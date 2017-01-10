# Reproducible Research - Course 5

## Week 2 - Markdown and knitr

### Coding Standards in R

Coding standards helps with readability and understanding of the code.

1. **Always use a text file / text editor**

    No formatting or special appearance, typically ASCII. Helps with accessibility.

2. **Indent the code**

    Different blocks of code should be indented to see the flow of the program. Suggested: 4 spaces, ideal is 8.

3. **Limit the width of your code**

    Option: 80 columns. Forces to think about the code structure. With indentation, it prevents too many nested function. Limit to 2 nested for loops maximum.

4. **Limit the length of individual functions**

    Limit a function to one basic operation. Put all the function on a screen page. Split the code in logical function, helps with debugging.

### Markdown

Markdown is a really useful language for creating documents.

Markdown helps to focus on the code. It is easy to integrate with R code.

*"Markdown is a text-to-HTML conversion tool for web writers. Markdown allows you to write using an easy-to-read, easy-to-write plain text format, then convert it to structurally valid XHTML (or HTML)"*

John Gruber, creator of Markdown

Italic, bold, headings, unordered list, ordered list, links, advanced linking

### R Markdown

- R Markdown is the integration of R code with Markdown
- Allows one to create documents containing "live" R code.
- R code is evaluated as part of the processing of the Markdown
- Results from R code are inserted into Markdown document
- A core tool in literate statistical programming
- R Markdown can be converted to standard Markdown or HTML using the **knitr** and **markdown** packages in R
- Any basic text editor can be used to create a markdown documents
- R markdown can also be converted into slides using the **slidify** package in R

### knitr

#### Introduction

Literate Statistical Programming with knitr  
Original idea comes from Don Knuth:
- An article is a stream of text and code
- Analysis code is divided into text and code "chunks"
- Presentation code formats results (tables, figures....)
- Article explains what is going on

Literate programs are **weaved** to produce human-readable documents and **tangled** to produce machine-readable documents.  

Literate programming is a general concept that need:
- a documentation language
- a programming language

**knitr** provides a variety of documentation languages

- Start as early as possible
- Keep track of things with version control
- Use software whose operation can be coded
- Don't save output (especially temporary)
- Save data in non-proprietary formats

**Advantages:**
- Text and code all in one place, logical order
- Data, results automatically updated to reflect external changes
- Code is live--automatic "regression test" when building a document

**Disadvantages**
- Text and code all in one place can make document difficult to read, especially if there is a lot of code
- Can substantially slow down processing of documents (although there are tools to help)

#### knitr

**knitr** is a R package written by Yihui Xie. It supports RMarkdown, LaTeX and HTML as documentation languages. It can also export PDF and HTML.

**knitr** is good for:
- Manuals
- Short/Medium length technical documents
- Tutorials
- Reports (especially if generated periodically)
- Data preprocessing documents/summaries

**knitr** is not very good for :
- Long research articles
- Complex tim-consuming computations
- Documents that require precise formatting

Code chunks can be named for clarity.

By default in **knitr**, code in a code chunk is echoed, as will the results of computation (if there are results to print). This can be modified easily in RStudio.

*see R markdown file to experiment*

**Setting Global Options**  

### Summary

Literate Statistical programming can be a useful way to put test, code, data, output all in one document.

**knitr** is a powerful tool for integrating code and text in a simple document format.



### Resources:

[http://rmarkdown.rstudio.com/](http://rmarkdown.rstudio.com/)

[https://daringfireball.net/projects/markdown/](https://daringfireball.net/projects/markdown/)

[https://www.r-statistics.com/2010/09/managing-a-statistical-analysis-project-guidelines-and-best-practices/](https://www.r-statistics.com/2010/09/managing-a-statistical-analysis-project-guidelines-and-best-practices/)

[http://projecttemplate.net/index.html](http://projecttemplate.net/index.html)
