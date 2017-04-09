knit_function <- function(inputFile, encoding) {
  ## Find the root directory from Git location (see rprojroot for details)
  root <- rprojroot::is_git_root
  
  ## Read the yaml for the output file name
  rmd.content <-  paste(readLines(inputFile, n = 20), sep = "\n" );
  yaml.range <- grep('---', rmd.content);  
  yaml.range <- seq(yaml.range[1]+1, yaml.range[2]-1);
  yaml.content <-  paste(rmd.content[yaml.range], collapse=" \n")
  yaml.content <- yaml::yaml.load(yaml.content);
  
  if(is.null(yaml.content$post)) stop("knit requires post yaml argument")
  
  ## Knit the document to md
  out_dir <- root$find_file("_blog", "markdown", yaml.content$post)
  dir.create(out_dir, showWarnings = FALSE)
  setwd(out_dir);
  md_file <- knitr::knit(inputFile,encoding = encoding);
}

## Knitr custom funciton inspired from https://github.com/yihui/knitr/issues/965
# Adress problem mentioned here: https://github.com/yihui/knitr/issues/913
# and here: https://github.com/rstudio/rmarkdown/issues/587