---
title: "Hacking the Knitr Button"
layout: post
page_number: 2
knit: source('../knit_function.R')$value
---



The following knit funciton provides a solution to the previously described problem.


```r
knit_function <- function(inputFile, encoding) {
  ## Get root directory location
  root <- rprojroot::is_git_root;
  
  ## Read the yaml for the output file name
  rmd.content <-  paste(readLines(inputFile, n = 20), sep = "\n" );
  yaml.range <- grep('---', rmd.content);  
  yaml.range <- seq(yaml.range[1]+1, yaml.range[2]-1);
  yaml.content <-  paste(rmd.content[yaml.range], collapse=" \n")
  yaml.content <- yaml::yaml.load(yaml.content);
  
  setwd('markdown');
  
  ## Default behaviour
  if (is.null(yaml.content$combine_docs)) {
    
    ## generate markdown files and preview the document 
    out_dir <- root$find_file('analysis/preview');
    md_file <- knitr::knit(inputFile,encoding = encoding);
    render_file <- rmarkdown::render(md_file, output_dir = out_dir)
    
  ## Combine documents
  } else if (yaml.content$combine_docs) {
    
    out_dir <- root$find_file('reports')
    md_file <- paste0(yaml.content$title,'.md')
    write(readLines(inputFile), file = md_file)

    cfiles <- list.files(pattern = "*.md")
    cfiles[which(cfiles == basename(inputFile))] <- NULL
    
    for(i in 1:length(cfiles)){
      text <- readLines(cfiles[i])
      hspan <- grep("---", text)
      text <- text[-c(hspan[1]:hspan[2])]
      write(text, sep = "\n", file = md_file, append = T)
    }
    render_file <- rmarkdown::render(input = md_file, output_dir = out_dir);
  }
}
```




