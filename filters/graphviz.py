#!/usr/bin/env python

"""
Pandoc filter to process code blocks with class "graphviz" into
graphviz-generated images.

Needs pygraphviz
"""

import os
import sys

import pygraphviz

from pandocfilters import toJSONFilter, Para, Image
from filter_utils import *


def get_prog(kv):
    return get_value(kv, u"prog")


def graphviz(key, value, format, _):
    if key == 'CodeBlock':
        [[ident, classes, keyvals], code] = value
        if "graphviz" in classes:
            caption, typef, keyvals = get_caption(keyvals)
            filetype = get_extension(format, "png", html="png", latex="pdf")
            dest = get_filename4code("graphviz", code, filetype)

            if not os.path.isfile(dest):
                g = pygraphviz.AGraph(string=code)
                g.layout()
                prog, keyvals = get_prog(keyvals)
                g.draw(dest, prog=prog if prog != "" else None)
                sys.stderr.write('Created image ' + dest + '\n')

            return Para([Image([ident, [], keyvals], caption, [dest, typef])])

if __name__ == "__main__":
    toJSONFilter(graphviz)
