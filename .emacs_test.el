(defun ensime-log-to-file (txt)
  (write-region txt nil  "ensime_test.log" 'append))

(defun message (&rest args)
  (ensime-log-to-file (format "-- %s\n" (apply 'format args))))

(setq user-emacs-directory (expand-file-name "./emacs.d"))
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(require 'cl)
(let ((needed-packages '(auto-complete dash s)))
  (unless (every #'package-installed-p needed-packages)
    (package-refresh-contents)
    (dolist (p needed-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(add-to-list 'load-path ".")

(require 'ensime)

(require 'ensime-test)

(setq inhibit-startup-message t)
(setq debug-on-error nil)
(setq debug-on-quit nil)
(setq visible-bell t)
(setq visual-line-mode nil)
(setq mark-even-if-inactive t)
(show-paren-mode t)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(tool-bar-mode 0)
(menu-bar-mode 0)
(toggle-scroll-bar 0)
(setq backup-directory-alist '(("." . (ensime-temp-directory))))

(defun ensime-test-output (txt)
  (ensime-log-to-file (format "%s\n" txt)))

;;(ensime-run-all-tests)

;;(message "Finishing.")

;;(kill-emacs 0)
