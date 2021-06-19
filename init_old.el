;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; this is an old 2016 init.el that worked with the old master
;; branch of spacemacs. I am now on the develop branch so I had to
;; update it. I'm keeping this around since I haven't finished
;; porting it over to the current init.el

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default dotspacemacs-distribution 'spacemacs
                dotspacemacs-startup-banner 'nil
                dotspacemacs-smart-closing-parenthesis t
                dotspacemacs-smartparens-strict-mode t
                dotspacemacs-enable-lazy-installation 'unused
                dotspacemacs-ask-for-lazy-installation t
                dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
                dotspacemacs-configuration-layers
                '(
                  (auto-completion :variables
                                   auto-completion-return-key-behavior 'complete
                                   auto-completion-tab-key-behavior 'complete
                                   auto-completion-enable-snippets-in-popup t)
                  org
                  ;;  (c-c++ :variables
                  ;;         c-c++-default-mode-for-headers 'c-mode)
                  (shell :variables shell-default-shell 'eshell)
                  emacs-lisp
                  (elfeed :variables
                          elfeed-feeds '(("https://gridbugs.org/feed.xml" gamedev)
                                         ("http://gigasquidsoftware.com/atom.xml" clojure)
                                         ("http://feeds.cognitect.com/cognicast/feed.rss" clojure)
                                         ("http://feeds.cognitect.com/blog/feed.rss" clojure)
                                         ("https://blog.sakugabooru.com/feed/" sakugabooru)))
                  ;; python
                  javascript
                  ;; lua
                  racket
                  csharp
                  (clojure :variables
                           clojure-enable-fancify-symbols nil)
                  ;; markdown
                  ;; html
                  (git :variables
                       git-magit-status-fullscreen t)
                  ibuffer
                  (ranger :variables
                          ranger-preview-file t)
                  dev
                  )

                dotspacemacs-additional-packages '(base16-theme
                                                   gnu-elpa-keyring-update
                                                   ;; sublime-themes
                                                   frog-jump-buffer
                                                   )
                dotspacemacs-excluded-packages '()
                dotspacemacs-install-packages 'used-only
                dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.

  ;; this n
  (setq-default dotspacemacs-smooth-scrolling t
                dotspacemacs-line-numbers nil
                dotspacemacs-mode-line-theme 'spacemacs
                ;;'relative
                dotspacemacs-check-for-update nil

                ;; from new template config
                dotspacemacs-emacs-pdumper-executable-file "emacs"
                dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)
                dotspacemacs-elpa-https t
                dotspacemacs-elpa-timeout 5
                dotspacemacs-gc-cons '(100000000 0.1)
                dotspacemacs-read-process-output-max (* 1024 1024)
                dotspacemacs-use-spacelpa nil
                dotspacemacs-verify-spacelpa-archives t
                dotspacemacs-elpa-subdirectory 'emacs-version

                dotspacemacs-editing-style 'vim
                dotspacemacs-verbose-loading nil
                dotspacemacs-startup-banner 'official
                ;; dotspacemacs-distinguish-gui-tab t
                dotspacemacs-startup-lists '(recents bookmarks)
                dotspacemacs-default-theme 'base16-ocean
                dotspacemacs-themes '(base16-ocean spacemacs-dark)
                dotspacemacs-colorize-cursor-according-to-state t
                dotspacemacs-mode-line-unicode-symbols nil ;; ended here
                dotspacemacs-default-font '("Source Code Pro" ;;"Anonymous Pro for Powerline"
                                            :size 18
                                            :weight normal
                                            :width normal
                                            :powerline-scale 1.0)
                dotspacemacs-leader-key "SPC"
                dotspacemacs-emacs-leader-key "M-m"
                dotspacemacs-major-mode-leader-key ","
                dotspacemacs-major-mode-emacs-leader-key "C-M-m"
                dotspacemacs-ex-command-key ":"
                dotspacemacs-command-key "SPC"
                dotspacemacs-remap-Y-to-y$ t
                dotspacemacs-auto-save-file-location 'cache
                dotspacemacs-auto-resume-layouts t
                dotspacemacs-use-ido nil ;; ido or helm
                dotspacemacs-helm-resize t
                dotspacemacs-helm-no-header nil
                dotspacemacs-helm-position 'bottom
                dotspacemacs-enable-paste-micro-state nil
                dotspacemacs-which-key-delay 0.4
                dotspacemacs-which-key-position 'bottom
                dotspacemacs-loading-progress-bar t
                dotspacemacs-fullscreen-at-startup nil
                dotspacemacs-fullscreen-use-non-native nil
                dotspacemacs-maximized-at-startup t
                ;; dotspacemacs-active-transparency 97
                dotspacemacs-inactive-transparency 67
                ;; If non nil unicode symbols are displayed in the mode line. (default t)
                dotspacemacs-mode-line-unicode-symbols t
                dotspacemacs-smooth-scrolling t
                dotspacemacs-smartparens-strict-mode t
                dotspacemacs-highlight-delimiters 'all
                dotspacemacs-persistent-server nil
                dotspacemacs-search-tools '("ag")
                ;; The default package repository used if no explicit repository has been
                ;; specified with an installed package.
                ;; Not used for now. (default nil)
                dotspacemacs-default-package-repository nil))

(defun dotspacemacs/user-init ()
  (desktop-save-mode 1)
  (set-fringe-mode 0)
  (set-face-foreground 'vertical-border "gray")
  (add-hook 'with-editor-mode-hook 'evil-insert-state)
  ;; (add-to-list 'projectile-project-root-files ".pde") ;; TODO: figure out if this works
  (defalias 'ag 'ag.exe)

  ;; (set-face-attribute 'default nil :height 140)
  ;; (add-hook 'org-agenda-finalize-hook dev/agenda-buffer-format)

  (set-default-coding-systems 'utf-8-unix)
  (prefer-coding-system 'utf-8-unix)
  (defalias 'ff 'find-file-other-window)

  ;; blue
  ;; (set-face-background 'spacemacs-normal-face "#8fa1b3")
  ;; (setq evil-normal-state-cursor "#8fa1b3")

  ;; red
  ;; (set-face-background 'spacemacs-normal-face "#bf616a")
  ;; (setq evil-normal-state-cursor "#bf616a")

  ;; white / grey
  ;; (set-face-background 'spacemacs-normal-face "#c0c5ce")
  (setq-default js2-basic-offset 2
                js-indent-level 2
                c-basic-offset 2
                c-indent-tabs-mode t
                ;; https://emacs.stackexchange.com/questions/233/how-to-proceed-on-package-el-signature-check-failure
                package-check-signature nil ;; 'allow-unsigned
                dumb-jump-prefer-searcher 'ag
                helm-ag-ignore-buffer-patterns '("/lib/" ".log" "/node_modules/")
                ivy-height 20
                dired-quick-sort-suppress-setup-warning t
                ;; to stop ag crashing emacs (might not need this now)
                helm-input-idle-delay 0.1
                helm-cycle-resume-delay 2
                helm-follow-input-idle-delay 1

                helm-semantic-fuzzy-match t
                helm-buffers-fuzzy-matching t
                helm-recentf-fuzzy-match    t
                helm-imenu-fuzzy-match t
                helm-M-x-fuzzy-match t ;; optional fuzzy matching for helm-M-x

                helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
                helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
                helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
                ;; helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
                ;; helm-ff-file-name-history-use-recentf t
                helm-echo-input-in-header-line t

                ;;projectile-indexing-method 'alien ;; speed up indexing on windows
                ;; projectile-project-search-path '("~/src/")
                powerline-default-separator nil

                require-final-newline nil
                mode-require-final-newline nil
                default-buffer-file-coding-system 'utf-8-unix
                evil-normal-state-cursor "#c0c5ce"
                evil-search-module 'evil-search
                evil-want-C-i-jump t

                ;;org-refile-targets '((org-agenda-files . (:maxlevel . 6)))
                ;; org-default-notes-file "~/src/notes/organiser.org"
                scroll-margin 5
                org-bullets-bullet-list '("■" "◆" "▲" "▶")
                neo-theme 'nerd

                yas-snippet-dirs '("~/.spacemacs.d/snippets")
                dired-listing-switches "-Al --si --time-style long-iso -t"
                delete-by-moving-to-trash t))

(defun scroll-to-center-advice (&rest args)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defun save-buffer-advice (&rest args)
  (save-buffer))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  " layers configuration. You are free to put any user code."
  ;; (setq ranger-width-preview 0.9)
  (golden-ratio-mode t)
  ;; (global-company-mode)
  (helm-autoresize-mode t)

  (set-frame-font "Source Code Pro")
  ;; (set-face-attribute 'default nil :height 130)
  ;; TODO fix this. this messes up startup
  ;; (set-face-background 'helm-swoop-target-line-face "#8fa1b3")
  ;; (set-face-background 'helm-swoop-target-word-face "#c0c5ce")

  ;; (set-face-background 'spacemacs-normal-face "#c0c5ce")
  (setq-default  powerline-default-separator 'box
                 ranger-show-literal t
                 ranger-width-preview 0.55
                 reb-re-syntax 'rx
                 projectile-indexing-method 'alien)

  ;; (spacemacs/toggle-truncate-lines-on)
  (spacemacs/toggle-transparency)

  ;; find other way to do this since it overrides tab in insert mode
  ;; (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)

  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  ;; (add-hook 'clojure-mode-hook #'evil-lispy-mode)
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'js2-mode-hook (lambda ()
                             (interactive)
                             (add-hook 'evil-insert-state-exit-hook
                                       (lambda ()
                                         (interactive)
                                         (save-buffer))
                                       nil
                                       'make-it-local)))

  (advice-add 'previous-buffer :after #'dev/switch-to-buffer-continue)
  (advice-add 'next-buffer :after #'dev/switch-to-buffer-continue)
  (advice-add 'last-buffer :after #'dev/switch-to-buffer-continue)
  (advice-add #'evil-jump-backward :after #'scroll-to-center-advice)
  (advice-add #'evil-ex-search-previous :after #'scroll-to-center-advice)
  (advice-add #'evil-ex-search-next :after #'scroll-to-center-advice)
  (advice-add #'spacemacs/jump-to-definition :after #'scroll-to-center-advice)
  (advice-add #'goto-last-change :after #'scroll-to-center-advice)
  (advice-add #'evil-goto-mark-line :after #'scroll-to-center-advice)
  ;; (advice-add #'evil-replace :after #'save-buffer-advice)
  (evil-add-command-properties #'jump-to-definition :jump t)
  (evil-add-command-properties #'goto-last-change :jump t)

  (evilified-state-evilify skewer-error-mode skewer-error-mode-map

    (kbd "q") 'quit-window)

  ;; (spaceline-compile)
  ;; (spacemacs/load-theme 'base16-ocean)
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."


)
