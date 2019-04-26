
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'dart-mode)
    (package-refresh-contents)
    (package-install 'dart-mode))

(let ((dart-debug t))
  (define-advice dart--run-process
      (:override (executable &rest args) simulate-process-error)
    nil)
  (require 'dart-mode))
