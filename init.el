;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-elpa-https t
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers")
   dotspacemacs-configuration-layers ;;dev--layers
   '((auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t)
     org
     shell
     emacs-lisp
     ;;deft
     racket
     python
     javascript
     evil-cleverparens
     (clojure :variables
              clojure-enable-fancify-symbols t)

     markdown
     html
     git
     evil-snipe
     ;;powershell
     ;; vinegar
     ibuffer
     (ranger :variables
             ranger-show-preview t)
     dev
     online-thesaurus)
   dotspacemacs-additional-packages '(base16-theme
                                      evil-easymotion
                                      ;; evil-easy-motion
                                      ;; atom-dark-theme
                                      skeletor
                                      sublime-themes
                                      ;; elmacro
                                      keyfreq
                                      annoying-arrows-mode
                                      processing-mode)
   dotspacemacs-excluded-packages '()
   ;; dotspacemacs-configuration-layers dev--layers
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil ;;'relative
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   ;; dotspacemacs-distinguish-gui-tab t
   dotspacemacs-startup-lists '(recents bookmarks)
   dotspacemacs-default-theme 'base16-ocean
   dotspacemacs-themes '(base16-ocean)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-default-font '("Source Code Pro";;"Anonymous Pro for Powerline"
                               :size 18
                               :weight regular
                               :width normal
                               :powerline-scale 1.5)
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
   dotspacemacs-search-tools '("ag" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil))


(defun dotspacemacs/user-init ()
  (desktop-save-mode 1)

  (set-fringe-mode 0)
  (set-face-foreground 'vertical-border "gray")

  (add-hook 'with-editor-mode-hook 'evil-insert-state)
  (setq helm-processing-find-sketch
        '((name . "Sketches")
          (candidates . (lambda ()
                          (directory-files processing-sketch-dir
                                           nil
                                           nil
                                           #'file-newer-than-file-p)))
          (action . (lambda (candidate)
                      (message "%s" candidate)
                      (processing-find-sketch candidate)))))

  (set-face-attribute 'default nil :height 140)
  (define-abbrev-table 'js2-mode-abbrev-table)
  (define-abbrev global-abbrev-table
    "mx" "mouseX"
    "my" "mouseY"
    )

  ;; blue
  ;; (set-face-background 'spacemacs-normal-face "#8fa1b3")
  ;; (setq evil-normal-state-cursor "#8fa1b3")

  ;; red
  ;; (set-face-background 'spacemacs-normal-face "#bf616a")
  ;; (setq evil-normal-state-cursor "#bf616a")

  ;; white / grey
  ;; (set-face-background 'spacemacs-normal-face "#c0c5ce")

  (set-face-background 'helm-swoop-target-line-face "#8fa1b3")
  (set-face-background 'helm-swoop-target-word-face "#c0c5ce")

  (setq-default
   helm-ag-ignore-buffer-patterns '("/lib/" ".log")
   require-final-newline nil
   mode-require-final-newline nil
   default-buffer-file-coding-system 'utf-8-unix
   ;; evil-normal-state-cursor "#c0c5ce"
   evil-search-module 'evil-search
   ranger-width-preview 0.35
   scroll-margin 5
   org-bullets-bullet-list '("■" "◆" "▲" "▶")
   neo-theme 'nerd

   powerline-default-separator 'bar

   processing-location "C:/Users/stephen/processing-3.0b6/processing-java.exe"
   processing-application-dir "C:/Users/stephen/processing-3.0b6"
   processing-sketchbook-dir "C:/Users/stephen/src/processing"

   projectile-indexing-method 'alien ;; speed up indexing on windows
   yas-snippet-dirs '("~/.spacemacs.d/snippets")
   dired-listing-switches "-Al --si --time-style long-iso -t"

   skeletor-project-directory "~/src/js"
   skeletor-user-directory "~/.spacemacs.d/skeleton-projects")

  (add-to-list 'load-path "~/processing-3.0b6")
  (autoload 'processing-mode "processing-mode" "Processing mode" t)
  (add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))

  (skeletor-define-template "p5js"
    :no-license? t
    :no-git? t)

  (add-to-list 'exec-path "C:/Users/stephen/.babun/cygwin/bin")
  (add-to-list 'exec-path "/usr/bin")
  (add-to-list 'projectile-project-root-files "index.html")
  (add-to-list 'projectile-project-root-files ".pde")

  (defalias 'ag 'ag.exe)
  (defalias 'ff 'find-file-other-window))

(defun scroll-to-center-advice (&rest args)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defun save-buffer-advice (&rest args)
  (save-buffer))

(defun helm-processing-find-sketch ()
  (interactive)
  (helm :sources '(dev/helm-processing-find-sketch)
        :buffer "*helm-processing-find-sketch*"))

(defun dev/goto-path-at (format-address)
  (let ((path (word-at-point)))
    (browse-url (format format-address path))))

(defun dev/goto-p5reference ()
  (interactive)
  (dev/goto-path-at "https://p5js.org/reference/#/p5/%s"))

(defun dev/goto-processing-reference ()
  (interactive)
  (dev/goto-path-at "https://processing.org/reference/%s_.html")
  )

(defun dotspacemacs/user-config ()
  " layers configuration. You are free to put any user code."

  (global-annoying-arrows-mode)
  (spacemacs/toggle-transparency)
  (spacemacs/toggle-evil-cleverparens-on)

  (setq powerline-default-separator 'bar)

  ;; TODO: figure out why this isn't working and why i can't bind anything to
  ;; s
  ;; (define-key evil-normal-state-map "S" nil)
  ;; (define-key evil-normal-state-map (kbd "F") 'evilem--motion-evil-find-char-backward)

  (evil-snipe-mode)
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

  (define-key evil-normal-state-map "f" 'evilem--motion-evil-find-char-forward-line)
  (define-key evil-motion-state-map "f" 'evilem--motion-evil-find-char-forward-line)
  ;; (define-key evil-normal-state-map "gj" 'evilem--motion-evil-find-char-forward-line)
  (define-key evil-normal-state-map "F" 'evilem--motion-evil-find-char-backward-line)
  (define-key evil-motion-state-map "F" 'evilem--motion-evil-find-char-backward-line)

  (define-key evil-normal-state-map "s" 'evil-avy-goto-char-2)
  (define-key evil-normal-state-map "gj" 'spacemacs/helm-jump-in-buffer)

  ;; (evilem-define (kbd "F") 'evil-avy-goto-char-2)

  ;; (evilem-define (kbd "gs") 'evil-snipe-repeat
  ;;                :pre-hook (save-excursion (call-interactively #'evil-snipe-s))
  ;;                :bind ((evil-snipe-scope 'buffer)
  ;;                       (evil-snipe-enable-highlight)
  ;;                       (evil-snipe-enable-incremental-highlight)))
  ;; (define-key evil-snipe-parent-transient-map (kbd "C-;")
  ;;   (evilem-create 'evil-snipe-repeat
  ;;                  :bind ((evil-snipe-scope 'buffer)
  ;;                         (evil-snipe-enable-highlight)
  ;;                         (evil-snipe-enable-incremental-highlight))))

  (setq keyfreq-excluded-commands
        '(self-insert-command
          evil-insert
          org-self-insert-command
          abort-recursive-edit
          exit-minibuffer
          company-ignore
          evil-next-line
          evil-previous-line
          evil-normal-state
          evil-forward-char
          evil-backward-char))
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)

  (global-set-key (kbd "M-`") (lambda ()
                                (interactive)
                                (find-file "~/src/notes/weekly-goals.org")))

  (define-key window-numbering-keymap (kbd "M-1") (lambda ()
                                                    (interactive)
                                                    (quick-shift/ff-at-project "game3" "tasks.org")))
  (define-key window-numbering-keymap (kbd "M-2") (lambda ()
                                                    (interactive)
                                                    (quick-shift/ff-at-project "game3" "game.js")))
  (define-key window-numbering-keymap (kbd "M-3") (lambda ()
                                                    (interactive)
                                                    (quick-shift/ff-at-project "game3" "index.html")))


  ;; (global-auto-revert-mode t) ;; auto refresh file changed
  (define-key helm-map (kbd "C-1") (lambda ()
                                     (interactive)
                                     ;; action 0 is switch to buffer
                                     (helm-select-nth-action 0)))
  (define-key helm-map (kbd "C-2") (lambda ()
                                     (interactive)
                                     (helm-next-line)
                                     (helm-select-nth-action 0)))
  (define-key helm-map (kbd "C-3") (lambda ()
                                     (interactive)
                                     (helm-next-line 2)
                                     (helm-select-nth-action 0)))
  (define-key helm-map (kbd "C-4") (lambda ()
                                     (interactive)
                                     (helm-next-line 3)
                                     (helm-select-nth-action 0)))

  (define-key helm-map (kbd "C-5") (lambda ()
                                     (interactive)
                                     (helm-next-line 4)
                                     (helm-select-nth-action 0)))

  (spacemacs/set-leader-keys
    ;; TODO: comment and unccoment functions
    ;; TODO: visual select blocks
    ;; sp-forward-slurp-sexp doesn't work with '/' or '.' in text
    ;; which doesn't work well in non-lisp languages
    ;; "ks" 'paredit-forward-slurp-sexp TODO: this is slow figure out why
    "z-" 'spacemacs/decrease-transparency
    "z=" 'spacemacs/increase-transparency
    "gc" 'magit-checkout
    "ot" 'thesaurus
    "bk" 'kill-this-buffer
    "ov" (lambda ()
           (interactive)
           (let ((start-point (point)))
             (evil-find-char 1 (string-to-char "("))
             (forward-char)
             (sp-up-sexp)
             (evil-visual-select start-point (+ 1 (point)))))

    "or" (lambda ()
           (interactive)
           (cond ((eq 'processing-mode major-mode)
                  (progn
                    (evil-write nil nil nil (buffer-file-name) t)
                    (processing-sketch-run)))
                 ((eq 'c++-mode major-mode)
                  (progn
                    (evil-write nil nil nil (buffer-file-name) t)
                    (compile "make")))))
    "of" 'dev/goto-p5reference
    "od" 'dev/goto-processing-reference
    "oo" 'clojure-comment-uncomment
    "op" 'helm-processing-find-sketch
    ;; "ou" 'comment-map
    ;; "of" 'comment-defn
    ;; "obf" 'comment-before-defn
    ;; "ol" 'comment-line
    ;; "oe" 'cider-pprint-eval-defun-at-point
    )

  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode
    "ep" 'cider-pprint-eval-defun-at-point)

  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
  (add-hook 'evil-insert-state-exit-hook 'save-buffer)

  (evil-add-command-properties #'jump-to-definition :jump t)
  ;; (defadvice evil-replace (after advice activate)
  ;;   (save-buffer))

  ;; TODO change to use add-function
  ;; (defadvice evil-ex-search-next (after advice activate)
  ;;   (evil-scroll-line-to-center (line-number-at-pos)))
  ;; (defadvice evil-goto-mark-line (after advice activate)
  ;;   (evil-scroll-line-to-center (line-number-at-pos)))
  ;; (defadvice evil-ex-search-previous (after advice activate)
  ;;   (evil-scroll-line-to-center (line-number-at-pos)))
  ;; (defadvice spacemacs/jump-to-definition (after advice activate)
  ;;   (evil-scroll-line-to-center (line-number-at-pos)))
  ;; (defadvice goto-last-change (after advice activate)
  ;;   (evil-scroll-line-to-center (line-number-at-pos)))

  (advice-add #'evil-ex-search-previous :after #'scroll-to-center-advice)
  (advice-add #'evil-ex-search-next :after #'scroll-to-center-advice)
  (advice-add #'spacemacs/jump-to-definition :after #'scroll-to-center-advice)
  (advice-add #'goto-last-change :after #'scroll-to-center-advice)
  (advice-add #'evil-goto-mark-line :after #'scroll-to-center-advice)
  (advice-add #'evil-replace :after #'save-buffer-advice)

  (fset 'dev/plus-eol-semi-colon [?\C-o ?$ ?\; escape])
  (define-key evil-insert-state-map (kbd "C-;") 'dev/plus-eol-semi-colon)

  (fset 'dev/plus-comma-next-arg [?\C-o ?a ?\,])
  (define-key evil-insert-state-map (kbd "C-,") 'dev/plus-comma-next-arg)


  (fset 'dev/plus-eol-bracket [?\C-o ?a ?\{ return])
  (define-key evil-insert-state-map (kbd "C-'") 'dev/plus-eol-bracket)

  (fset 'dev/change-in-arg [?c ?i ?a])
  (define-key evil-normal-state-map (kbd "C-l") 'dev/change-in-arg)
  (define-key evil-normal-state-map (kbd "C-;") 'evilnc-comment-or-uncomment-lines)

  ;; this might cause some problems e.g finding and replacing ";" in buffer
  ;; (define-key evil-ex-completion-map (kbd "C-;") 'exit-minibuffer)



  (define-key evil-normal-state-map (kbd "(") 'sp-backward-up-sexp)
  (define-key evil-normal-state-map (kbd ")") 'sp-up-sexp)
  (define-key evil-ex-completion-map (kbd ";") 'exit-minibuffer) ;; maybe change this to evil write
  (define-key evil-normal-state-map (kbd "0") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "H") 'evil-backward-WORD-begin)
  (define-key evil-normal-state-map (kbd "L") 'evil-forward-WORD-begin)

  (define-key evil-operator-state-map (kbd "H") 'evil-backward-WORD-begin)
  (define-key evil-operator-state-map (kbd "L") 'evil-forward-WORD-begin)

  (define-key evil-visual-state-map (kbd "H") 'evil-backward-WORD-begin)
  (define-key evil-visual-state-map (kbd "L") 'evil-forward-WORD-begin)
  (define-key evil-normal-state-map (kbd "-") 'deer)

  (define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-down)
  ;; (define-key evil-normal-state-map (kbd "C-K") 'evil-scroll-page-up)
  ;; (define-key evil-normal-state-map (kbd "C-J") 'evil-scroll-page-down)

  (define-key evil-normal-state-map (kbd "Q") (lambda ()
                                                (interactive)
                                                (evil-execute-macro 1 "@q")))

  (define-key evil-insert-state-map (kbd "C-s") (lambda ()
                                                  (interactive)
                                                  (evil-write nil nil nil (buffer-file-name) t)))

  (define-key evil-normal-state-map (kbd "gl") 'evil-avy-goto-line)
  (define-key evil-normal-state-map (kbd "gr") 'helm-mini)

  ;; (define-key evil-normal-state-map "s" 'evil-avy-goto-char-2)
  ;; (define-key evil-normal-state-map (kbd "go") 'evil-avy-goto-char-2)
  ;; (define-key evil-normal-state-map (kbd "go") nil)
  ;; (define-key evil-normal-state-map (kbd "go") 'evil-avy-goto-char-2)
  ;; durp windows http://emacs.stackexchange.com/questions/30275/c-not-recognized-on-windows-10
  ;; for binding C-)
  (define-key evil-normal-state-map (kbd "M-)") 'paredit-forward-slurp-sexp)
  (define-key evil-insert-state-map (kbd "M-)") 'paredit-forward-slurp-sexp)
  (define-key evil-normal-state-map (kbd "M-(") 'paredit-wrap-sexp)
  (define-key evil-insert-state-map (kbd "M-(") 'paredit-wrap-sexp)



  (define-key evil-normal-state-map (kbd "C-=") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)
  (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)

  ;; doesn't work
  ;; (define-key evil-insert-state-map (kbd "TAB") 'yas-expand)

  ;; (define-key spacemacs-clojure-mode-map (kbd "<s-return>") 'cider-eval-defun-at-point)
  (evilified-state-evilify skewer-error-mode skewer-error-mode-map
    (kbd "q") 'quit-window)
  ;; (define-key popwin:keymap (kbd "q") 'popwin:close-popup-window)

  (spacemacs/set-leader-keys-for-major-mode 'emacs-lisp-mode
    "es" 'spacemacs/eval-current-form-sp
    "ec" 'spacemacs/eval-current-symbol-sp)
  (spacemacs/set-leader-keys-for-major-mode 'js2-mode
    "ee" 'skewer-eval-last-expression
    "eb" 'skewer-load-buffer
    "el" (lambda ()
           (interactive)
           (skewer-eval (thing-at-point 'line t)))
    "ef" 'skewer-eval-defun)

  (evil-define-key 'normal evil-cleverparens-mode-map
    "{" 'evil-cp-beginning-of-defun
    "}" 'evil-cp-end-of-defun
    "[" nil                            ; [ and ] aren't used so unimpaired works
    "]" nil)
  (evil-define-key 'visual evil-cleverparens-mode-map
    "{" 'evil-cp-beginning-of-defun
    "}" 'evil-cp-end-of-defun
    "[" nil
    "]" nil)

  (spacemacs/load-theme 'base16-ocean))

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
      ("c796f2b78c5b89b1342f97a8c87ec393f793892d031e690e2a3214abfc9e78f0" "fb3e623e6c6e98f45aea182e56808a11d4c255490e49387a508bfc42251e15d0" "4f15ae94b399f73b10ce7234b882b2b0d8007ed7e3b3dae47e3ef9aa8dd7d315" "b4ec581daad15aa7020b722523dc6bcea850bfbdbe31bfeb11c45ea51899bd75" "09669536b4a71f409e7e2fd56609cd7f0dff2850d4cbfb43916cc1843c463b80" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" "c70cc9c4c6257d70f5c11b90cb9e8b1e54e6edd6aa43f39879746e16a70533f5" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" "e254f8e18ba82e55572c5e18f3ac9c2bd6728a7e500f6cc216e0c6f6f8ea7003" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" default)))
   '(evil-search-module (quote evil-search))
   '(evil-want-Y-yank-to-eol t)
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
   '(package-selected-packages
     (quote
      (evil-easymotion doom-themes all-the-icons font-lock+ atom-dark-theme yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic ranger ibuffer-projectile xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help processing-mode org-projectile pcache org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot mmm-mode markdown-toc markdown-mode gh-md uuidgen toc-org pug-mode org-plus-contrib org-bullets mwim livid-mode skewer-mode simple-httpd link-hint git-link eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump f column-enforce-mode clojure-snippets base16-ocean-dark-theme helm-company helm-c-yasnippet company-web web-completion-data company-tern dash-functional company-statistics company-quickhelp pos-tip company auto-yasnippet ac-ispell auto-complete web-mode web-beautify tern tagedit slim-mode scss-mode sass-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc jade-mode helm-css-scss haml-mode emmet-mode coffee-mode smeargle orgit magit-gitflow helm-gitignore request gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger evil-magit magit magit-popup git-commit with-editor monokai-theme sublime-themes reveal-in-osx-finder pbcopy osx-trash launchctl fasd grizzl evil-cleverparens clj-refactor inflections edn multiple-cursors paredit yasnippet peg cider-eval-sexp-fu cider queue clojure-mode base16-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package spacemacs-theme spaceline smooth-scrolling restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines open-junk-file neotree move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu elisp-slime-nav define-word clean-aindent-mode buffer-move bracketed-paste auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
   '(paradox-github-token t)
   '(pos-tip-background-color "#073642")
   '(pos-tip-foreground-color "#93a1a1")
   '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
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
   '(js2-function-param ((t (:foreground "#dfe1e8")))))
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
    ("78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "c796f2b78c5b89b1342f97a8c87ec393f793892d031e690e2a3214abfc9e78f0" "fb3e623e6c6e98f45aea182e56808a11d4c255490e49387a508bfc42251e15d0" "4f15ae94b399f73b10ce7234b882b2b0d8007ed7e3b3dae47e3ef9aa8dd7d315" "b4ec581daad15aa7020b722523dc6bcea850bfbdbe31bfeb11c45ea51899bd75" "09669536b4a71f409e7e2fd56609cd7f0dff2850d4cbfb43916cc1843c463b80" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" "c70cc9c4c6257d70f5c11b90cb9e8b1e54e6edd6aa43f39879746e16a70533f5" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" "e254f8e18ba82e55572c5e18f3ac9c2bd6728a7e500f6cc216e0c6f6f8ea7003" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" default)))
 '(evil-search-module (quote evil-search))
 '(evil-want-Y-yank-to-eol t)
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
 '(linum-format " %7i " t)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (org org-plus-contrib projectile diminish cider seq clojure-mode packed anaconda-mode company paredit avy smartparens magit magit-popup git-commit with-editor evil yasnippet helm helm-core markdown-mode async alert log4e hydra f js2-mode dash s racket-mode faceup evil-snipe yapfify xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit sublime-themes spacemacs-theme spaceline smeargle slim-mode skeletor shell-pop scss-mode sass-mode restart-emacs ranger rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-isort pug-mode processing-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode keyfreq json-mode js2-refactor js-doc info+ indent-guide ido-vertical-mode ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-easymotion evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump define-word cython-mode company-web company-tern company-statistics company-anaconda column-enforce-mode coffee-mode clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu base16-theme auto-yasnippet auto-highlight-symbol auto-compile annoying-arrows-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
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
 '(js2-function-param ((t (:foreground "#dfe1e8")))))
