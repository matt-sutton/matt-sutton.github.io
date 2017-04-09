---
title: "Hacking the Knitr Button"
layout: post
page_number: 1
knit: source('../knit_function.R')$value
---



When setting up a simulation study for my research I stumbled across an interesting way to hack the knit button in R studio. A few posts have already covered this trick to some extent (see [here](https://github.com/yihui/knitr/issues/965) and [here](https://github.com/lmmx/devnotes/wiki/Rmarkdown-custom-knit-hook-to-compile-a-multi-part-document)). 

In this post I thought I'd introduce the basic idea and how it can be used to solve an annoying directory problem disused by [Jennybc Cboettig and Yihui](https://github.com/yihui/knitr/issues/913).  

## The problem 

One common critique of the knitr or rmarkdown packages is that they assume that the source files are (e.g. figures, cached data) are in the working directory of the Rmd file. 

A common occurrence for this type of problem is when trying to share multiple reports with collaborators who only want to look through the reports generated and don't want to see the Rmd, figures or other include files generated when compiling a markdown document. 

For example, the standard knit button will only allow a "flat" structure for an Rmd project:


```r
 - analysis/
    |- report_human.Rmd
    |- report_human.pdf
    |- report_rats.Rmd
    |- report_rats.html
 - reports/
```

Where after knit-ing the documents, the report_human.pdf and report_rats.html are manually moved to the correct directory.

## Introduction

The trick to changing the function of the knit button is to specify a `knit:` field in the YAML header of an Rmd file. 
As a default, the knit button will evaluate the function `rmarkdown::render` which takes the input file and generates the required output. 

To make use of this, set the yaml for the document report_human.Rmd or report_rats.Rmd to:


```r
---
title: "Report human"
knit: source('knit_function.R')$value
output: pdf_document
---
```

Here's a simple knit function that I wrote (saved as knit_function.R in the same directory):


```r
knit_function <- function(inputFile, encoding) {
  rmarkdown::render(inputFile, output_dir = "../reports")
}
```

This solution is limited since the output file is defined relative to the input file and thus reproducability is limited. A good solution to this problem is to use the package rprojroot which can be used to set file locations relative to the root directory.


```r
knit_function <- function(inputFile, encoding) { 
  rmarkdown::render(inputFile, output_dir = rprojroot::is_git_root("reports"))
}
```

Using this definition, the locaiton of the Rmd file does not matter relative to the location of the output. The root directory is located as the folder containing the '.git' file. So regardless of where the source Rmd file is, the output location will be the same. 

*Note:* that the knit parameter can also be changed to ensure that the location of the knit funciton is kept constant.


```r
knit: source(rprojroot::is_git_root$find_file('analysis','knit_function.R'))$value
```

After cloning the repo, the Rmd file can be moved anywhere within the project and will still output to the correct location. 