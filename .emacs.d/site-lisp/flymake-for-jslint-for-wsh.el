;;; flymake-for-jslint-for-wsh.el --- use flymake with js code, on Windows
;;
;; Author:     Dino Chiesa
;; Version:    1.1
;; Modified:   2010 May 20
;; Keywords:   javascript js jslint flymake
;;
;; This code is distributed under the New BSD License.
;;
;; Copyright (c) 2010, Dino Chiesa
;; All rights reserved.
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:
;;
;; Redistributions of source code must retain the above copyright
;; notice, this list of conditions and the following disclaimer.
;;
;; Redistributions in binary form must reproduce the above copyright
;; notice, this list of conditions and the following disclaimer in the
;; documentation and/or other materials provided with the distribution.
;;
;; Neither the name of the author or any contributors, nor the names of
;; any organizations they belong to, may be used to endorse or promote
;; products derived from this software without specific prior written
;; permission.
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;; A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;; HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
;; INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
;; BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
;; OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
;; AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
;; WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;; POSSIBILITY OF SUCH DAMAGE.
;;
;;
;; Started from
;; http://www.emacswiki.org/emacs-en/FlymakeJavaScript
;;
;; .. and modified for use on Windows.
;;
;;
;;
;; Bugs:
;;
;;    - Not tested on x64 versions of Windows
;;
;;    - No support for Linux. Really there shouldn't be a separate .el
;;      file for Windows and Linux.  This should be generalied to
;;      support both, and should be renamed to flymake-for-jslint.js
;;


(require 'flymake)


(defvar flymake-for-jslint-jslint-location "\\bin\\jslint-for-wsh.js"
  "Location of the jslint.js script.  The jslint script specified
here must be modified from the standard jslint available from
jslint.com.

The modified version can be obtained from
http://code.google.com/p/jslint-for-wsh/source/browse/#svn/trunk

If you'd like to perform the modifications yourself, follow these
instructions.  Near the bottom of the file is a line which reads:

    (function(){if(!JSLINT(WScript.StdIn.ReadAll(),.....

Replace that, and everything that follows, to:

    (function(){
        var filename = \"stdin\";
        var content= \"\";
        if (WScript.Arguments.length > 0){
            filename = WScript.Arguments(0);
            var fso = new ActiveXObject(\"Scripting.FileSystemObject\");
            var fs = fso.OpenTextFile(filename, 1);
            content = fs.ReadAll();
            fs.Close();
            fso = null;
            fs = null;
        } else {
            content = WScript.StdIn.ReadAll();
        }
        if(!JSLINT(content,{passfail:false})){
            WScript.StdErr.WriteLine(\"JSLINT\");
            for (var i=0; i<JSLINT.errors.length; i++) {
                // sample error msg:
                //  sprintf.js(53,42) JSLINT: Use the array literal notation [].
                var e=JSLINT.errors[i];
                if (e !== null){
                    var line = (typeof e.line == \"undefined\")?'0':e.line;
                    WScript.StdErr.WriteLine(filename + '(' +line+','+e.character+') JSLINT: '+e.reason);
                    WScript.StdErr.WriteLine('    ' + (e.evidence||'').replace(/^\\s*(\\S*(\\s+\\S+)*)\\s*$/,\"$1\"));
                }
            }}}());


This change does two things:

1. allows you to specify the file to run lint on, on the command
   line, rather than as stdin. Stdin still works if no file is
   specified at all.

2. emits the error messages in a format that is more similar to
   most C/C++ compilers.

The first change allows you to invoke jslint.js from the command
line, or from within emacs with M-x compile. The second change
allows you to interpet error messages with M-x next-error.
"
)


(defun flymake-jslint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (file-without-path (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name)))
         (cscript-exe (concat (getenv "windir")
                              "\\system32\\cscript.exe")))
    (list cscript-exe (list (expand-file-name flymake-for-jslint-jslint-location)
                            file-without-path))))

(setq flymake-allowed-file-name-masks
      (cons '(".+\\.js$"
              flymake-jslint-init
              flymake-simple-cleanup
              flymake-get-real-file-name)
            flymake-allowed-file-name-masks))

(setq flymake-err-line-patterns
      (cons '("^[ \t]*\\([A-Za-z.0-9_: \\-]+\\)(\\([0-9]+\\)[,]\\( *[0-9]+\\))\\( Microsoft JScript runtime error\\| JSLINT\\): \\(.+\\)$"
              1 2 3 5)
            flymake-err-line-patterns))

(provide 'flymake-for-jslint-for-wsh)

