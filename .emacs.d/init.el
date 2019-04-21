
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(let ((pkgs-to-install
       (seq-remove 'package-installed-p '(activity-watch-mode json))))
  (when pkgs-to-install
    (package-refresh-contents)
    (dolist (pkg pkgs-to-install)
      (package-install pkg))))

(setq debug-on-error t)
(require 'json)
(global-activity-watch-mode)
