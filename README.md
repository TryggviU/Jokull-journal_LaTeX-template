![alt text](JORFI_ISL_ENSKA_liggjandi_svart@4x_brink.png "Title")

# LaTeX template for Jökull journal

This repository includes a class file, `jokull.cls`, to setup articles in the journal [Jökull](https://jokull.jorfi.is/) of the Icelandic Glaciological and Geological Societies.

The Jökull class is largely based on the IGS Journal of Glaciology class: https://www.cambridge.org/core/journals/journal-of-glaciology and has been edited and improved to allow for Icelandic typesetting and to follow the style guidelines of Jökull.

The Jökull class allows for formatting articles for review with line numbers and double line-spacing by using:
```
\documentclass[review]{jokull}
```
whereas for the final arcticle form simply use:
```
\documentclass{jokull}
```
at the start of the article `.tex` file.

The default bibliography style is `chicago`, but I recommend downloading the [chicagolinks](https://ctan.org/tex-archive/biblio/bibtex/contrib/chicagolinks) BibTeX Style file (`chicagolinks.bst`) to allow for notes, URL and DOI links in the bibliography.
