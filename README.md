# thesisdown

This project was inspired by the [bookdown](https://github.com/rstudio/bookdown) package and is an updated version of Chester Ismay's Senior Thesis template in the `reedtemplates` package [here](https://github.com/ismayc/reedtemplates).

Currently, the PDF and gitbook versions are fully-functional.  The word and epub versions are developmental, have no templates behind them, and are essentially calls to the appropriate functions in bookdown.

If you are new to working with `bookdown`/`rmarkdown`, please read over the documentation available in the `gitbook` template at https://thesisdown.netlify.com/.  This is also available below at https://ismayc.github.io/thesisdown_book.

The current output for the four versions is here:
- [PDF](https://github.com/ratatstats/manusdown_book/blob/gh-pages/thesis.pdf) (Generating LaTeX file is available [here](https://github.com/ratatstats/manusdown_book/blob/gh-pages/thesis.tex) with other files at in the [book directory](https://github.com/ratatstats/manusdown_book/tree/gh-pages).)
- [Word](https://github.com/ratatstats/manusdown_book/blob/gh-pages/thesis.docx)
- [ePub](https://github.com/ratatstats/manusdown_book/blob/gh-pages/thesis.epub)
- [gitbook](https://ratatstats.github.io/manusdown_book)

Under the hood, the Reed College LaTeX template is used to ensure that documents conform precisely to submission standards. At the same time, composition and formatting can be done using lightweight [markdown](https://rmarkdown.rstudio.com/authoring_basics.html) syntax, and **R** code and its output can be seamlessly included using [rmarkdown](https://rmarkdown.rstudio.com).

## Customizing thesisdown to your institution

Please see Chester Ismay's thesisdown repo (https://github.com/ismayc/thesisdown) for more information.

### Using manusdown

Using **manusdown** has some prerequisites which are described below. To compile PDF documents using **R**, you are going to need to have LaTeX installed.  It can be downloaded for Windows at <https://miktex.org/download> and for Mac at <https://tug.org/mactex/mactex-download.html>.  Follow the instructions to install the necessary packages after downloading the (somewhat large) installer files.  You may need to install a few extra LaTeX packages on your first attempt to knit as well.

To use **manusdown** from RStudio:

1) Install the latest [RStudio](https://www.rstudio.com/products/rstudio/download/).
Only the version as of Oct 2017 has a recent enough Pandoc included so you may need to upgrade this
separately or install a newer RStudio.

    ```r
    rmarkdown::pandoc_available("1.2")
    #> [1] TRUE
    ```

2) Install the **bookdown** and **manusdown** packages: 

```r
install.packages("remotes")
remotes::install_github("rstudio/bookdown")
remotes::install_github("ratatstats/manusdown")
```

3) Use the **New R Markdown** dialog to select **Thesis**:

    ![New R Markdown](thesis_rmd.png)

    Note that this will currently only **Knit** if you name the directory `index` as shown above.

4) After choosing which type of output you'd like in the YAML at the top of index.Rmd, **Knit** the `index.Rmd` file to get the book in PDF or HTML formats.
5) Edit the individual chapter R Markdown files as you wish and then re-run step (4) again.
