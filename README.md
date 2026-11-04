![alt text](JORFI_ISL_ENSKA_liggjandi_svart@4x_brink.png "Title")

# LaTex template for Jökull journal

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
