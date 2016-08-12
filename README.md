# General info
This folder contains the technical specification of the Concord protocol.

Sources of the specification are written in Pandoc's flavoured markdown and are
compiled to Github's flavoured markdown so to be readable and hosted in the code
repository directly.

## Requirements
To compile this documentation (not only to markdown) you'll have to install Pandoc
and two extensions: [`pandoc-citeproc`](https://github.com/jgm/pandoc-citeproc)
and [`pandocfilters`](https://github.com/jgm/pandocfilters). To install Pandoc
we remand to the official [installation page](http://pandoc.org/installing.html).

`pandoc-citeproc` is distributed with the Linux x64 package of Pandoc, otherwise
can be found in `apt` and `brew` or installed with `cabal install --global pandoc-citeproc`.

`graphviz` is used for general charting and schemas and can most probably be
found in your OS's package manager, so search for it there.

`pandocfilters` can instead be installed along with the python-graphviz interface
with `pip install -r pyreq.txt` (TODO change to the include paths of graphviz).

We will also need the plantuml jar file to enable writing UML diagrams in Pandoc
sources. The latter can be downloaded from the [official website](http://plantuml.com/download.html)
and needs to be placed is this repository's root folder.

## Compilation
This step is easily handled by `make`. Check the [Makefile](Makefile).
It also handles different files outputs and filters.

## Publication
A [`publish.sh`](publish.sh) script has been written that merges
changes from master into gh-pages branch, commits and pushes the changes to that
branch.
