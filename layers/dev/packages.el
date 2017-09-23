
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
;; See the Spacemacs documentation and FAQs for instructions on how to implement ;; a new layer:
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
      '(evil-easymotion
        vertigo
        lispy
        rainbow-mode
        lispyville
        ;; evil-mc
        anzu
        keyfreq
        general
        key-chord
        ;; delight
        golden-ratio-scroll-screen
        spaceline-all-the-icons
        all-the-icons
        all-the-icons-ivy
        all-the-icons-dired
        all-the-icons-ivy
        skeletor
        processing-mode
        indium
        xref-js2))

(defun dev/init-rainbow-mode ()
  (use-package rainbow-mode
    :defer t
    :config (progn (add-hook 'html-mode-hook 'rainbow-mode)
                   (add-hook 'js2-mode-hook 'rainbow-mode)
                   (add-hook 'css-mode-hook 'rainbow-mode))))

(defun dev/init-vertigo ()
  )

(defun dev/init-xref-js2 ()
  (use-package xref-js2
    :defer t
    :config
    (progn
      (define-key js2-mode-map (kbd "M-.") nil)

      ;; (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
      ;; (define-key esc-map (kbd "M-?") 'xref-js2--find-references)

      (add-hook 'js2-mode-hook (lambda ()
                                 (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
      )))


(defun dev/init-golden-ratio-scroll-screen ()
  (use-package golden-ratio-scroll-screen
    :defer t
    :config
    (progn
      (define-key help-mode-map (kbd "C-j") 'golden-ratio-scroll-screen-up)
      (define-key help-mode-map (kbd "C-k") 'golden-ratio-scroll-screen-down)
      (set-face-background 'golden-ratio-scroll-highlight-line-face "#4f5b66")
      (setq golden-ratio-scroll-highlight-delay (cons 0.08 0.1))
      ;; (set-face-background 'golden-ratio-scroll-highlight-line-face "#8fa1b3")
      ;; (set-face-background 'golden-ratio-scroll-highlight-line-face "#bf616a")
      ;; (set-face-background 'golden-ratio-scroll-highlight-line-face "#ebcb8b")
      ;; (set-face-background 'golden-ratio-scroll-highlight-line-face "#a7adba") ;; red
      ;; (set-face-background 'golden-ratio-scroll-highlight-line-face "#65737e") ;; grey
      ))
  )

(defun dev/init-key-chord ()
  (use-package key-chord :ensure t
    :defer t
    :config
    (setq key-chord-two-keys-delay 0.2)
    ;; (use-package key-seq :ensure t)
    )
  )

(defun dev/init-spaceline-all-the-icons ()
  (use-package spaceline-all-the-icons
    :defer t
    :after spaceline
    :config (progn
              (setq-default spaceline-all-the-icons-separator-type 'none
                            spaceline-all-the-icons-icon-set-modified 'toggle
                            mode-line-format 'spaceline-all-the-icons)

              (spaceline-toggle-all-the-icons-eyebrowse-workspace-off)
              ;; (spaceline-toggle-all-the-icons-hud-off)
              ;; (spaceline-toggle-all-the-icons-flycheck-status-info-off)
              (spaceline-toggle-all-the-icons-minor-modes-off)
              ;; (spaceline-toggle-all-the-icons-mode-icon-off)
              (spaceline-toggle-all-the-icons-position-off)
              (spaceline-toggle-all-the-icons-projectile-off)
              (spaceline-toggle-all-the-icons-time-off)
              (spaceline-toggle-all-the-icons-modified-off)
              (spaceline-toggle-all-the-icons-buffer-size-off)
              (spaceline-all-the-icons-theme)
              )))

(defun dev/init-all-the-icons ()
  (use-package all-the-icons
    :defer t))

(defun dev/init-all-the-icons-ivy ()
  (use-package all-the-icons
    :defer t
    :config (all-the-icons-ivy-setup)))


(defun dev/init-all-the-icons-dired ()
  (use-package all-the-icons-dired
    :defer t
    :config (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
    ))


;; (defun dev/init-delight ()
;;   (use-package delight
;;     :defer t
;;     :ensure nil
;;     :config
;;     (progn
;;       (delight 'emacs-lisp-mode
;;                '("Elisp" (lexical-binding ":Lex" ":Dyn"))
;;                :major)
;;       (defadvice powerline-major-mode (around delight-powerline-major-mode activate)
;;         (let ((inhibit-mode-name-delight nil)) ad-do-it))
;;       (defadvice powerline-minor-modes (around delight-powerline-minor-modes activate)
;;         (let ((inhibit-mode-name-delight nil)) ad-do-it))))
;;   )


(defun dev/init-anzu ()
  (use-package anzu
    :defer t
    :config (global-anzu-mode +1))
  )

(defun dev/init-indium ()
  (use-package indium
    :defer t))

(defun dev/init-lispy ()
  (use-package lispy
    :defer t
    :config
    (progn
      (general-mmap "C-d" nil) ;; for lispy
      ;; (add-hook 'lispy-mode-hook #'lispyville-mode)
      ;; (add-hook 'emacs-lisp-mode-hook #'lispy-mode-hook)

      ;; (add-hook 'clojure-mode-hook #'lispy-mode-hook)
      (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1))))))

(defun dev/init-lispyville ()
  (use-package lispyville
    :defer t
    :config
    (progn
      (add-hook 'js2-mode-hook #'lispyville-mode)
      (add-hook 'clojure-mode-hook #'lispyville-mode)
      (add-hook 'emacs-lisp-mode-hook #'lispyville-mode)
      (add-hook 'lispy-mode-hook #'lispyville-mode)
      )))


(defun dev/init-evil-easymotion ()
  (evilem-default-keybindings "gh")
  (evilem-define (kbd "ghf") #'evil-repeat-find-char
                 :name 'evilem--motion-evil-find-char-forward-line
                 :scope 'line
                :pre-hook (save-excursion
                             ;; (setq evil-this-type 'inclusive)
                             (setq evil-this-type 'exclusive)
                             (call-interactively #'evil-find-char)))

  (evilem-define (kbd "ghF") #'evil-repeat-find-char
                 :name 'evilem--motion-evil-find-char-backward-line
                 :scope 'line
                 :pre-hook (save-excursion
                             (setq evil-this-type 'exclusive)
                             (call-interactively #'evil-find-char-backward)))

  (define-key evil-normal-state-map "g1" 'evil-find-char)
  (define-key evil-normal-state-map "f" 'evilem--motion-evil-find-char-forward-line)
  (define-key evil-motion-state-map "f" 'evilem--motion-evil-find-char-forward-line)

  (define-key evil-normal-state-map "F" 'evilem--motion-evil-find-char-backward-line)
  (define-key evil-motion-state-map "F" 'evilem--motion-evil-find-char-backward-line)
  )

(defun dev/init-general ()
  (use-package general
    :defer t))

(defun dev/init-keyfreq ()
  (setq keyfreq-excluded-commands
        '(self-insert-command
          evil-delete-backward-char-and-join
          evil-insert
          org-self-insert-command
          abort-recursive-edIT
          exit-minibuffer
          company-ignore
          evil-next-line
          evil-previous-line
          evil-normal-state
          evil-forward-char
          evil-backward-char))
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  )

(defun dev/init-processing-mode ()
  (use-package processing-mode
    :defer t
    :config
    (progn
      (setq-default processing-location "~/processing-3.0b6/processing-java.exe"
                    processing-application-dir "~/processing-3.0b6"
                    processing-sketchbook-dir "~/src/processing")

      (add-to-list 'load-path "~/processing-3.0b6")
      (autoload 'processing-mode "processing-mode" "Processing mode" t)
      (add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode)))))

(defun dev/init-skeletor ()
  (setq-default skeletor-project-directory "~/src/js"
                skeletor-user-directory "~/.spacemacs.d/skeleton-projects")
  (skeletor-define-template "p5js"
    :no-license? t
    :no-git? t)
  )

(defun dev/post-init-helm ()
  (spacemacs|use-package-add-hook helm
    :post-config (progn
                   (general-define-key :states '(emacs)
                                       :keymaps 'helm-map
                                       "C-1" (lambda ()
                                               ;; action 0 is switch to buffer
                                               (helm-select-nth-action 0))
                                       "C-2" (lambda ()
                                               (helm-next-line)
                                               (helm-select-nth-action 0))
                                       "C-3" (lambda ()
                                               (helm-next-line 2)
                                               (helm-select-nth-action 0))
                                       "C-4" (lambda ()
                                               (helm-next-line 3)
                                               (helm-select-nth-action 0))
                                       "C-5" (lambda ()
                                               (helm-next-line 4)
                                               (helm-select-nth-action 0)))

                   (setq-default helm-display-header-line nil
                                 helm-split-window-default-side 'left
                                 helm-autoresize-min-height 50
                                 helm-autoresize-max-height 0
                                 helm-always-two-windows t)
                   )))
