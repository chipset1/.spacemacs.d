;;; packages.el --- dev layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: stephenaemblem <stephenemblem@stephens-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:
; e
; You appear to be setting environment variables ("PATH") in your .bashrc or .zshrc: those files are only
;  read by interactive shells,
;  so you should instead set environment variables in startup files like
;  .profile, .bash_profile or .zshenv.
;  Refer to your shell's man page for more info.
;  Customize `exec-path-from-shell-arguments' to remove "-i"
;   when done, or disable `exec-path-from-shell-check-startup-files' t
;   o disable this message.
; Done.

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `dev-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `dev/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `dev/pre-init-PACKAGE' and/or
;;   `dev/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:






(setq dev-packages
  '(evil-cleverparens
    base16-theme
   ;; sublime-themes
    )

)


(defun dev/init-base16-theme ())
(defun dev/init-evil-cleverparens ()
	(use-package evil-cleverparens
    :defer t
    :init (progn (add-hook 'clojure-mode-hook 'evil-cleverparens-mode))
))

;;; packages.el ends here
