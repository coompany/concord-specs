## General info
This folder contains the technical specification of the Concord protocol.

Sources of the specification are written in Pandoc's flavoured markdown and are
compiled to Github's flavoured markdown so to be readable and hosted in the code
repository directly.

## Compilation
To compile this documentation (not only to markdown) you'll have to install Pandoc
and two extensions: [`pandoc-citeproc`](https://github.com/jgm/pandoc-citeproc)
and [`pandocfilters`](https://github.com/jgm/pandocfilters). To install Pandoc
we remand to the official [installation page](http://pandoc.org/installing.html).
`pandoc-citeproc` is distributed with the Linux x64 package of Pandoc, otherwise
can be found in `apt` and `brew` or installed with `cabal install --global pandoc-citeproc`.
`pandocfilters` can instead be installed with `pip install pandocfilters`. We will
also need the plantuml jar file to enable writing UML diagrams in Pandoc files.
The latter can be downloaded from the [official website](http://plantuml.com/download.html).
