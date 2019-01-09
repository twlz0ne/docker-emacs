
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(let ((pkgs-to-install
       (seq-remove 'package-installed-p '(dart-mode eglot))))
  (when pkgs-to-install
    (package-refresh-contents)
    (dolist (pkg pkgs-to-install)
      (package-install pkg))))

(defun project-try-dart (dir)
  (let ((project (or (locate-dominating-file dir "pubspec.yaml")
                     (locate-dominating-file dir "BUILD"))))
    (if project
        (cons 'dart project)
      (cons 'transient dir))))
(add-hook 'project-find-functions #'project-try-dart)
(cl-defmethod project-roots ((project (head dart)))
  (list (cdr project)))

(with-eval-after-load "eglot"
  (add-to-list 'eglot-server-programs
               '(dart-mode . ("dart_language_server"))))

(add-hook 'dart-mode-hook 'eglot-ensure)
