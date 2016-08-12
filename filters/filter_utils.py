import hashlib
import os
import sys


def get_filename4code(module, content, ext=None):
    """Generate filename based on content
    The function ensures that the (temporary) directory exists, so that the
    file can be written.
    Example:
        filename = get_filename4code("myfilter", code)
    """
    imagedir = module + "-images"
    fn = hashlib.sha1(content.encode(sys.getfilesystemencoding())).hexdigest()
    try:
        os.mkdir(imagedir)
        sys.stderr.write('Created directory ' + imagedir + '\n')
    except OSError:
        pass
    if ext:
        fn += "." + ext
    return os.path.join(imagedir, fn)


def get_caption(kv):
    """get caption from the keyvalues (options)
    Example:
      if key == 'CodeBlock':
        [[ident, classes, keyvals], code] = value
        caption, typef, keyvals = get_caption(keyvals)
        ...
        return Para([Image([ident, [], keyvals], caption, [filename, typef])])
    """
    res = []
    caption = []
    typef = ""
    for k, v in kv:
        if k == u"caption":
            caption = [Str(v)]
            typef = "fig:"
        else:
            res.append([k, v])

    return caption, typef, res


def get_extension(format, default, **alternates):
    """get the extension for the result, needs a default and some specialisations
    Example:
      filetype = get_extension(format, "png", html="svg", latex="eps")
    """
    try:
        return alternates[format]
    except KeyError:
        return default
