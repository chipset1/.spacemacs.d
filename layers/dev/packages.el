
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
        ;; evil-easymotion
        processing-mode
        )

      )

(defun dev/post-init-helm-swoop ()
  (set-face-background 'helm-swoop-target-line-face "#8fa1b3")
  (set-face-background 'helm-swoop-target-word-face "#c0c5ce")
  )

(defun dev/init-processing-mode ()
  (use-package processing-mode
    :config
    (progn
      (setq-default processing-location "~/processing-3.0b6/processing-java.exe"
                    processing-application-dir "~/processing-3.0b6"
                    processing-sketchbook-dir "~/src/processing")

      (add-to-list 'load-path "~/processing-3.0b6")
      (autoload 'processing-mode "processing-mode" "Processing mode" t)
      (add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode)))))

(defun dev/post-init-org-mode ()
  (spacemacs/set-leader-keys-for-major-mode 'org-mode
    "ot" (lambda ()
           (interactive)
           (insert "*** ")
           (evil-insert-state))
    "os" 'org-timer-start
    "oi" (lambda ()
           (interactive)
           (end-of-line)
           (insert " - ")
           (org-timer))
    "op" 'org-timer-pause-or-continue))
