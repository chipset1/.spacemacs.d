;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default dotspacemacs-distribution 'spacemacs
                dotspacemacs-check-for-update t
                dotspacemacs-elpa-https nil
                dotspacemacs-startup-banner 'nil
                dotspacemacs-smart-closing-parenthesis t
                dotspacemacs-smartparens-strict-mode t
                dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers")
                dotspacemacs-configuration-layers
                '((auto-completion :variables
                                   auto-completion-return-key-behavior 'complete
                                   auto-completion-tab-key-behavior 'complete
                                   auto-completion-enable-snippets-in-popup t)
                  org
                  (c-c++ :variables
                         c-c++-default-mode-for-headers 'c++-mode)
                  (shell :variables shell-default-shell 'eshell)
                  emacs-lisp
                  (elfeed :variables
                          elfeed-feeds '(("http://feeds.cognitect.com/cognicast/feed.rss" clojure)
                                         ("http://feeds.cognitect.com/blog/feed.rss" clojure)
                                         ("https://blog.sakugabooru.com/feed/" sakugabooru)))
                  racket
                  python
                  javascript
                  (clojure :variables
                           clojure-enable-fancify-symbols nil)
                  markdown
                  html
                  (git :variables
                       git-magit-status-fullscreen t)
                  ibuffer
                  (ranger :variables
                          ranger-preview-file t)
                  dev)

                dotspacemacs-additional-packages '(base16-theme
                                                   sublime-themes)
                dotspacemacs-excluded-packages '()
                dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.

  (setq-default dotspacemacs-smooth-scrolling t
                dotspacemacs-line-numbers nil
                ;;'relative
                dotspacemacs-editing-style 'vim
                dotspacemacs-verbose-loading nil
                dotspacemacs-startup-banner 'official
                ;; dotspacemacs-distinguish-gui-tab t
                dotspacemacs-startup-lists '(recents bookmarks)
                dotspacemacs-default-theme 'base16-ocean
                dotspacemacs-themes '(base16-ocean spacemacs-dark)
                dotspacemacs-colorize-cursor-according-to-state t
                dotspacemacs-mode-line-unicode-symbols nil
                dotspacemacs-default-font '("Source Code Pro" ;;"Anonymous Pro for Powerline"
                                            :size 18
                                            :weight normal
                                            :width normal
                                            :powerline-scale 1.0)
                dotspacemacs-leader-key "SPC"
                dotspacemacs-emacs-leader-key "M-m"
                dotspacemacs-major-mode-leader-key ","
                dotspacemacs-major-mode-emacs-leader-key "C-M-m"
                dotspacemacs-ex-command-key ";"
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
                dotspacemacs-active-transparency 97
                dotspacemacs-inactive-transparency 97
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

  ;; (add-hook 'org-agenda-finalize-hook dev/agenda-buffer-format)

  (set-default-coding-systems 'utf-8-unix)
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

                dumb-jump-prefer-searcher 'ag
                helm-ag-ignore-buffer-patterns '("/lib/" ".log" "/node_modules/")
                ivy-height 20

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
                projectile-project-search-path '("~/src/")
                powerline-default-separator nil

                require-final-newline nil
                mode-require-final-newline nil
                default-buffer-file-coding-system 'utf-8-unix
                evil-normal-state-cursor "#c0c5ce"
                evil-search-module 'evil-search

                org-refile-targets '((org-agenda-files . (:maxlevel . 6)))
                org-default-notes-file "~/src/notes/organiser.org"
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

(defun dotspacemacs/user-config ()
  " layers configuration. You are free to put any user code."
  ;; (setq ranger-width-preview 0.9)
  ;; (golden-ratio-mode t)
  (helm-autoresize-mode t)

  ;; TODO fix this. this messes up startup
  (set-face-background 'helm-swoop-target-line-face "#8fa1b3")
  (set-face-background 'helm-swoop-target-word-face "#c0c5ce")

  ;; (set-face-background 'spacemacs-normal-face "#c0c5ce")
  (setq-default  powerline-default-separator nil
                 ranger-show-literal t
                 ranger-width-preview 0.55
                 reb-re-syntax 'rx
                 projectile-indexing-method 'alien)

  (spacemacs/toggle-truncate-lines-on)
  (spacemacs/toggle-transparency)


  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  (add-hook 'clojure-mode-hook #'evil-lispy-mode)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(ansi-term-color-vector
   [unspecified "#2b303b" "#bf616a" "#a3be8c" "#ebcb8b" "#8fa1b3" "#b48ead" "#8fa1b3" "#c0c5ce"] t)
 '(cider-cljs-lein-repl
   "(do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/start-figwheel!) (figwheel-sidecar.repl-api/cljs-repl))")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "c796f2b78c5b89b1342f97a8c87ec393f793892d031e690e2a3214abfc9e78f0" "fb3e623e6c6e98f45aea182e56808a11d4c255490e49387a508bfc42251e15d0" "4f15ae94b399f73b10ce7234b882b2b0d8007ed7e3b3dae47e3ef9aa8dd7d315" "b4ec581daad15aa7020b722523dc6bcea850bfbdbe31bfeb11c45ea51899bd75" "09669536b4a71f409e7e2fd56609cd7f0dff2850d4cbfb43916cc1843c463b80" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" "c70cc9c4c6257d70f5c11b90cb9e8b1e54e6edd6aa43f39879746e16a70533f5" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" "e254f8e18ba82e55572c5e18f3ac9c2bd6728a7e500f6cc216e0c6f6f8ea7003" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" default)))
 '(evil-search-module (quote evil-search))
 '(evil-want-Y-yank-to-eol t)
 '(eyebrowse-mode t)
 '(fci-rule-color "#073642" t)
 '(global-highlight-changes-mode nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("~/src/notes/organiser.org")))
 '(package-selected-packages
   (quote
    (undo-tree nameless evil-lispy disaster company-c-headers cmake-mode clang-format org-mime ghub let-alist elfeed-web elfeed-org elfeed-goodies ace-jump-mode noflet elfeed rainbow-mode w3m org-category-capture gntp skewer-mode simple-httpd json-snatcher json-reformat haml-mode gitignore-mode fuzzy web-completion-data dash-functional tern inflections edn multiple-cursors peg queue pythonic auto-complete smooth-scrolling pdf-tools tablist golden-ratio-scroll-screen avy-zap key-seq key-chord counsel swiper-helm all-the-icons-ivy vertigo ztree spaceline-all-the-icons all-the-icons-dired all-the-icons font-lock+ delight indium sourcemap memoize websocket lispyville lispy zoutline swiper ivy xref-js2 general org org-plus-contrib projectile diminish cider seq clojure-mode packed anaconda-mode company paredit avy smartparens magit magit-popup git-commit with-editor evil yasnippet helm helm-core markdown-mode async alert log4e hydra f js2-mode dash s racket-mode faceup yapfify xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit sublime-themes spacemacs-theme spaceline smeargle slim-mode skeletor shell-pop scss-mode sass-mode restart-emacs ranger rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pug-mode processing-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode keyfreq json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-easymotion evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump define-word cython-mode company-web company-tern company-statistics company-anaconda column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu base16-theme auto-yasnippet auto-highlight-symbol auto-compile annoying-arrows-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(spaceline-all-the-icons-eyebrowse-display-name nil)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(font-lock-variable-name-face ((t (:foreground "#dfe1e8"))))
 '(js2-external-variable ((t (:foreground "#dfe1e8"))))
 '(js2-function-param ((t (:foreground "#dfe1e8"))))
 '(org-scheduled-today ((t (:foreground "slate gray"))))
 '(org-time-grid ((t (:foreground "indian red"))))
 '(spaceline-all-the-icons-sunset-face ((t (:inherit powerline-active2 :foreground "#fe7714" :height 1.4 :family " Source Code Pro")))))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(ansi-term-color-vector
   [unspecified "#2b303b" "#bf616a" "#a3be8c" "#ebcb8b" "#8fa1b3" "#b48ead" "#8fa1b3" "#c0c5ce"] t)
 '(cider-cljs-lein-repl
   "(do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/start-figwheel!) (figwheel-sidecar.repl-api/cljs-repl))")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "c796f2b78c5b89b1342f97a8c87ec393f793892d031e690e2a3214abfc9e78f0" "fb3e623e6c6e98f45aea182e56808a11d4c255490e49387a508bfc42251e15d0" "4f15ae94b399f73b10ce7234b882b2b0d8007ed7e3b3dae47e3ef9aa8dd7d315" "b4ec581daad15aa7020b722523dc6bcea850bfbdbe31bfeb11c45ea51899bd75" "09669536b4a71f409e7e2fd56609cd7f0dff2850d4cbfb43916cc1843c463b80" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" "c70cc9c4c6257d70f5c11b90cb9e8b1e54e6edd6aa43f39879746e16a70533f5" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" "e254f8e18ba82e55572c5e18f3ac9c2bd6728a7e500f6cc216e0c6f6f8ea7003" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" default)))
 '(evil-search-module (quote evil-search))
 '(evil-want-Y-yank-to-eol t)
 '(eyebrowse-mode t)
 '(fci-rule-color "#073642" t)
 '(global-highlight-changes-mode nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("~/src/notes/organiser.org")))
 '(package-selected-packages
   (quote
    (glsl-mode rust-mode doom-themes evil-lispy disaster company-c-headers cmake-mode clang-format org-mime ghub let-alist elfeed-web elfeed-org elfeed-goodies ace-jump-mode noflet elfeed rainbow-mode w3m org-category-capture gntp skewer-mode simple-httpd json-snatcher json-reformat haml-mode gitignore-mode fuzzy web-completion-data dash-functional tern inflections edn multiple-cursors peg queue pythonic auto-complete smooth-scrolling pdf-tools tablist golden-ratio-scroll-screen avy-zap key-seq key-chord counsel swiper-helm all-the-icons-ivy vertigo ztree spaceline-all-the-icons all-the-icons-dired all-the-icons font-lock+ delight indium sourcemap memoize websocket lispyville lispy zoutline swiper ivy xref-js2 general org org-plus-contrib projectile diminish cider seq clojure-mode packed anaconda-mode company paredit avy smartparens magit magit-popup git-commit with-editor evil yasnippet helm helm-core markdown-mode async alert log4e hydra f js2-mode dash s racket-mode faceup yapfify xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit sublime-themes spacemacs-theme spaceline smeargle slim-mode skeletor shell-pop scss-mode sass-mode restart-emacs ranger rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pug-mode processing-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode keyfreq json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-easymotion evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump define-word cython-mode company-web company-tern company-statistics company-anaconda column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu base16-theme auto-yasnippet auto-highlight-symbol auto-compile annoying-arrows-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(spaceline-all-the-icons-eyebrowse-display-name nil)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(font-lock-variable-name-face ((t (:foreground "#dfe1e8"))))
 '(js2-external-variable ((t (:foreground "#dfe1e8"))))
 '(js2-function-param ((t (:foreground "#dfe1e8"))))
 '(org-scheduled-today ((t (:foreground "slate gray"))))
 '(org-time-grid ((t (:foreground "indian red"))))
 '(spaceline-all-the-icons-sunset-face ((t (:inherit powerline-active2 :foreground "#fe7714" :height 1.4 :family " Source Code Pro")))))
