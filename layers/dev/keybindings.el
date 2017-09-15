(general-evil-setup)

;; durp windows http://emacs.stackexchange.com/questions/30275/c-not-recognized-on-windows-10

;; (general-define-key
;;  :states '(normal insert emacs)
;;  :prefix "C-SPC"
;;  :non-normal-prefix "C-SPC"
;;  "l" '(avy-goto-line)
;;  "a" 'align-regexp
;;  "f" (lambda ()
;;        (let ((helm-ag--buffer-search t))
;;          (helm-ag1 (format "export.+%s" (word-at-point)))
;;          )
;;        )
;;  )

(general-nmap "(" 'sp-backward-up-sexp
              "0" 'evil-first-non-blank
              "-" 'deer
              "Q" (lambda ()
                    (interactive)
                    (evil-execute-macro 1 "@q"))
              "s" 'evil-avy-goto-char-2
              "gl" 'evil-avy-goto-line
              "gs" 'magit-status
              "[j" 'vertigo-jump-down
              "[k" 'vertigo-jump-up
              "gj" 'spacemacs/helm-jump-in-buffer
              "gf" 'ivy-switch-buffer
              "C-f" 'anzu-query-replace
              ";" 'save-buffer
              ;; "C-k" 'evil-scroll-page-up
              ;; "C-j" 'evil-scroll-page-down

              ;; "C-k" 'golden-ratio-scroll-screen-down
              ;; "C-j" 'golden-ratio-scroll-screen-up
              "C-=" 'evil-numbers/inc-at-pt
              "C--" 'evil-numbers/dec-at-pnt
              "C-l" 'dev/change-in-arg
              "C-;" 'evilnc-comment-or-uncomment-lines
              "C-d" nil ;; for lispy
              "U" 'undo-tree-redo
              )



;; paren , curly operator change to letters
(general-omap "ip" 'evil-inner-paren    ;; was evil-paste?
              "ap" 'evil-a-paren        ;; evil paragraph
              "ik" 'evil-inner-curly
              "ak" 'evil-a-curly
              )

(general-define-key :states '(normal insert)
                    "M-)" 'evil-lisp-state-sp-forward-slurp-sexp
                    "C-s" 'save-buffer
                    "M-(" 'evil-lisp-state-wrap)

(general-define-key :states '(normal visual operator)
                    "H" 'evil-backward-WORD-begin
                    "L" 'evil-forward-WORD-begin
                    "C-k" 'golden-ratio-scroll-screen-down
                    "C-j" 'golden-ratio-scroll-screen-up)

(general-imap "C-'" 'dev/plus-eol-bracket
              "C-," 'dev/plus-comma-next-arg
              "C-;" 'dev/plus-eol-semi-colon)

;; (define-key evil-ex-completion-map (kbd ";") 'exit-minibuffer) ;; maybe change this to evil write

;; package specific
(general-define-key :states '(normal insert)
                    :keymaps 'org-mode-map
                    "C-t"  (lambda ()
                             (interactive)
                             (insert "*** ")
                             (evil-insert-state)))


(define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
;; (define-key calc-mode-map (kbd "C-c C-r") 'ca)

(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "os" 'org-timer-start
  "oi" (lambda ()
         (interactive)
         (end-of-line)
         (insert " - ")
         (org-timer))
  "op" 'org-timer-pause-or-continue)

(spacemacs/set-leader-keys
  "1" 'quick-shift-1
  "2" 'quick-shift-2
  "3" 'quick-shift-3
  "5" 'query-replace
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
  "os" 'dev/to-unix-file
  "or" (lambda () "test"
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
  "op" 'dev/helm-processing-find-sketch
  "oe" 'dev/open-in-explorer
  ;; "ou" 'comment-map
  ;; "of" 'comment-defn
  ;; "obf" 'comment-before-defn
  "ol" 'comment-line
  ;; "oe" 'cider-pprint-eval-defun-at-point
  )

(spacemacs/set-leader-keys-for-major-mode 'clojure-mode
  "ep" 'cider-pprint-eval-defun-at-point)
