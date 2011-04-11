Thu, 20 May 2010  09:46

This is the readme for jslint-for-wsh and
flymake-for-jslint-for-wsh. Available from
http://code.google.com/p/jslint-for-wsh/

JSLINT is a lovely tool from Douglas Crockford - find it at
http://www.jslint.com/

Crockford has also released a special version of his tool for use on
Windows, with Windows Script Host - http://www.jslint.com/wsh/

That modified version still uses STDIN as the input for the
jslint tool, even though WSH allows a javascript program to read any
filesystem file.

The modification here enables jslint to read from a filesystem file.

This confers one main advantage: error messages that jslint emits can
include the file that contains the error.

The format of the error messages emitted from this modified version of
jslint is like this:

    sprintf.js(53,42) JSLINT: Use the array literal notation [].


-----

To use jslint-for-wsh.js from the command line, run it like this;

  cscript.exe  [path-to-jslint-for-wsh.js]   [js-source-module]

example

  cscript.exe  \bin\jslint-for-wsh.js   sprintf.js

-----

You can use jslint-for-wsh from within emacs.  There are two primary
ways. You can choose one or the other or both.

  (a) with M-x compile.

  (b) with flymake.


For (a), insert this into your .emacs file:

    (defun my-javascript-mode-fn ()
      (turn-on-font-lock)
      ;; jslint-for-wsh.js, produces errors like this:
      ;; file.cs(6,18): JSLINT: The body of a for in should be wrapped in an if statement ...
      (if (boundp 'compilation-error-regexp-alist-alist)
          (progn
            (add-to-list
             'compilation-error-regexp-alist-alist
             '(jslint-for-wsh
               "^[ \t]*\\([A-Za-z.0-9_: \\-]+\\)(\\([0-9]+\\)[,]\\( *[0-9]+\\))\\( Microsoft JScript runtime error\\| JSLINT\\): \\(.+\\)$" 1 2 3))
            (add-to-list
             'compilation-error-regexp-alist
             'jslint-for-wsh)))
      (if buffer-file-name
          (progn
            (make-local-variable 'compile-command)
            (setq compile-command
                  (let ((filename (file-name-nondirectory buffer-file-name)))
                    (concat (getenv "windir")
                            "\\system32\\cscript.exe \\bin\\jslint-for-wsh.js "
                            filename)))))
      )

    ;; use whichever javavscript mode you prefer
    (add-hook 'javascript-mode-hook 'my-javascript-mode-fn)
    (add-hook 'espresso-mode-hook 'my-javascript-mode-fn)


Be sure to specify the path you used for jslint-for-wsh.js .


-----

For (b), this package also contains an elisp module,
flymake-for-jslint-for-wsh.el, that lets you easily run flymake
using jslint.

To do so,

 1. put the elisp file in your emacs load-path.

 2. add something like the following in your .emacs file:

    (require 'flymake-for-jslint-for-wsh "flymake-for-jslint-for-wsh.el")
    (setq flymake-for-jslint-jslint-location "\\cheeso\\bin\\jslint-for-wsh.js")

    (defun my-javascript-mode-fn ()
         (flymake-mode 1)
    )

    ;; use whichever javavscript mode you prefer
    (add-hook 'javascript-mode-hook 'my-javascript-mode-fn)
    (add-hook 'espresso-mode-hook 'my-javascript-mode-fn)


-----

Obviously, if you want to be able to use both flymake and M-x compile,
you can combine those hook functions into one.


