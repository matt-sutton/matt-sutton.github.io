---
title: "Hacking the Knitr Button"
layout: post
page_number: 2
knit: source('../knit_function.R')$value
---



The first example illustrated how the knitr button can be customised to change the output location in a standardised way. Notable extensions for this method include changing the knitr button script to run a makefile using @yihui's servr package 


```r
knit_function <- function(inputFile, encoding) { 
  servr::make(dir="path containing Makefile")
}
```

changing the output file name, importing a common set of packages (provided this is done sensibly). The next section describes how this method can be used to combine multiple Rmd documents.

## Custom knit to combine documents

An interesting extension to the knit button would allow for knit-ing multiple documents together with a single click. For the sake of simplicity we will assume that these documents are located in the same directory. For example consider the following file structure:


```r
 - data/
    |- human.dat
 - analysis/
    |- report_introduction.Rmd
    |- report_human_svm.Rmd
    |- report_human_neural_net.Rmd
 - reports/
    |- human_analysis.pdf
```

here the final analysis should contain both the svm analysis and the neural net analysis. While building the Rmd files we might like to see a preview of the section we are writing without looking at the entire document. This makes sense since each individual analysis might take a while to compute so building the full document would take too long. By saving the markdown files of these preview renders we could speed up the render of the final combined document.

This leads to the following file structure:


```r
 - data/
    |- human.dat
 - analysis/
    |- preview.pdf
    |- report_introduction.Rmd
    |- report_human_svm.Rmd
    |- report_human_neural_net.Rmd
    |- saved_markdown
        |- report_introduction.md
        |- report_human_svm.md
        |- report_human_neural_net.md
        |- figures
            |- plot01.png
 - reports/
    |- human_analysis.pdf
```

The preview.pdf file would preview the section currently being written. The files under the saved_markdown directory would contain the completed R analysis combined with the relevant markdown text. 

To facilitate this, we could introduce a term in the yaml describing the output directory (relative to the project root) and a term describing which files to combine. For example:


```r
---
title: "Report human"
out_dir: "reports"
combine_docs: TRUE
knit: source('knit_function.R')$value
output: pdf_document
---
```

if the fields are left off then the knit should produce the required md files and preview in the Rmd directory.
