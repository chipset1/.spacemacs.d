
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
      '(evil-easymotion
        anzu
        ztree
        ;; eyebrowse

        vertigo
        delight
        key-chord
        ;; evil-cleverparens

        golden-ratio-scroll-screen
        lispyville
        all-the-icons
        lispy
        all-the-icons-ivy
        spaceline-all-the-icons
        all-the-icons-dired
        all-the-icons-ivy
        indium
        processing-mode
        keyfreq
        evil-easymotion
        general
        skeletor
        xref-js2))


(defun dev/init-vertigo ()
  )


(defun dev/init-golden-ratio-scroll-screen ()
  (require 'golden-ratio-scroll-screen)
  (use-package golden-ratio-scroll-screen )
  ;; (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-on)

  ;; (spacemacs/toggle-mode-line)
  ;; (spaceline-toggle-buffer-size-off)
  )

(defun dev/init-key-chord ()

  (use-package key-chord :ensure t
    :defer t
    :config
    (setq key-chord-two-keys-delay 0.2)
    (use-package key-seq :ensure t))
  )

(defun dev/init-spaceline-all-the-icons ()
  (use-package spaceline-all-the-icons
               :defer t
               :after spaceline
               :config (spaceline-all-the-icons-theme)))

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
    :config
    (progn (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))
    ))


(defun dev/init-delight ()
  (delight 'emacs-lisp-mode
           '("Elisp" (lexical-binding ":Lex" ":Dyn"))
           :major)
  (use-package delight
    :defer t
    :ensure nil
    :config
    (progn
      (defadvice powerline-major-mode (around delight-powerline-major-mode activate)
        (let ((inhibit-mode-name-delight nil)) ad-do-it))
      (defadvice powerline-minor-modes (around delight-powerline-minor-modes activate)
        (let ((inhibit-mode-name-delight nil)) ad-do-it))))
  )


(defun dev/init-anzu ()
  (use-package anzu
    :defer t
    :config
    (progn
      (global-anzu-mode +1)
      ))
  )

(defun dev/init-indium ()
  (use-package indium
    :defer t))


(defun dev/init-lispyville ()
  (use-package lispyville
    :defer t
    :config
    (progn
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
    :defer t
    :ensure t
    :config
    (general-evil-setup t)

    (general-define-key
     :states '(normal insert emacs)
     :prefix "C-SPC"
     :non-normal-prefix "C-SPC"
     "l" '(avy-goto-line)
     "a" 'align-regexp
     )

    ;; (general-define-key
    ;;  :states '(normal motion insert emacs)
    ;;  :prefix "SPC"
    ;;  nil
    ;;  ;; "ar" '(ranger :which-key "call ranger")
    ;;  ;; "g"  '(:ignore t :which-key "Git")
    ;;  ;; "gs" '(magit-status :which-key "git status")
    ;;  )
    )

  )

(defun dev/init-keyfreq ()
  (setq keyfreq-excluded-commands
        '(self-insert-command
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

(spacemacs|use-package-add-hook helm
  :post-config (progn
                 (set-face-background 'helm-swoop-target-line-face "#8fa1b3")
                 (set-face-background 'helm-swoop-target-word-face "#c0c5ce")
                 (setq-default helm-autoresize-min-height 50
                               helm-autoresize-max-height 0)
                 (setq-default
                  helm-display-header-line nil
                  helm-split-window-default-side 'left
                  helm-always-two-windows t)
                 (set-face-attribute 'helm-action nil :underline nil)
                 (set-face-attribute 'helm-match nil :background nil)
                 (add-hook 'helm-after-persistent-action-hook
                           '(lambda () (recenter-top-bottom (car recenter-positions))))
                 (add-hook 'helm-after-action-hook
                           '(lambda () (recenter-top-bottom (car recenter-positions))))))

(spacemacs|use-package-add-hook hydra
  :config (progn
            (defhydra hydra-buffer (:color blue :columns 3)
              "
                Buffers :
  "
              ("n" next-buffer "next" :color red)
              ("b" ivy-switch-buffer "switch")
              ("B" ibuffer "ibuffer")
              ("p" previous-buffer "prev" :color red)
              ("C-b" buffer-menu "buffer menu")
              ("N" evil-buffer-new "new")
              ("d" kill-this-buffer "delete" :color red)
              ;; don't come back to previous buffer after delete
              ("D" (progn (kill-this-buffer) (next-buffer)) "Delete" :color red)
              ("s" save-buffer "save" :color red))

            (spacemacs/set-leader-keys
              "ob" 'hydra-buffer/body)
            ))
