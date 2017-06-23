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
  '(
   ;; sublime-themes
    )

)

(defun dev/pre-init-evil-cleverparens ()
  (message "this ran1")
  )

;;; packages.el ends here

;; search will center on the line it's found in.
;; (define-key evil-normal-state-map (kbd "n") (lambda()
;;                                               (interactive)
;;                                               (evil-ex-search-next)
;;                                               (evil-scroll-line-to-center (line-number-at-pos))))

;; (defun spacemacs//open-in-external-app (file-path)
;;   "Open `file-path' in external application."
;;   (cond
;;    ((spacemacs/system-is-mswindows) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\\\" file-path)))
;;    ((spacemacs/system-is-mac) (shell-command (format "open \"%s\"" file-path)))
;;    ((spacemacs/system-is-linux) (let ((process-connection-type nil))
;;                                   (start-process "" nil "xdg-open" file-path)))))
;; (open-in-explorer)

;; exec-path

;; (defun spacemacs/open-file-or-directory-in-external-app (arg)
;;   "Open current file in external application.
;; If the universal prefix argument is used then open the folder
;; containing the current file by the default explorer."
;;   (interactive "P")
;;   (if arg
;;       (spacemacs//open-in-external-app (expand-file-name default-directory))
;;     (let ((file-path (if (derived-mode-p 'dired-mode)
;;                          (dired-get-file-for-visit)
;;                        buffer-file-name)))
;;       (if file-path
;;           (spacemacs//open-in-external-app file-path)
;;         (message "No file associated to this buffer.")))))
