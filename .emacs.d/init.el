
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'dart-mode)
    (package-refresh-contents)
    (package-install 'dart-mode))

(setq dart-enable-analysis-server t)

(setq dart-debug t)
(toggle-debug-on-error)
