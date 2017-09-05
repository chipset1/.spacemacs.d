(general-evil-setup)

;; (general-omap :prefix "SPC"
;;            "." 'avy-goto-word-or-subword-1
;;           "l" 'evil-avy-goto-line
;;          "e" 'evil-avy-goto-subword-0)


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
              ;; "C-k" 'evil-scroll-page-up
              ;; "C-j" 'evil-scroll-page-down

              "C-k" 'golden-ratio-scroll-screen-up
              "C-j" 'golden-ratio-scroll-screen-down
              "C-=" 'evil-numbers/inc-at-pt
              "C--" 'evil-numbers/dec-at-pnt
              "C-l" 'dev/change-in-arg
              "C-;" 'evilnc-comment-or-uncomment-lines)



(general-define-key :states '(normal insert)
                    "M-)" 'evil-lisp-state-sp-forward-slurp-sexp
                    "M-(" 'evil-lisp-state-wrap)

(general-define-key :states '(normal visual operator)
                    "H" 'evil-backward-WORD-begin
                    "L" 'evil-forward-WORD-begin)

(general-imap "C-'" 'dev/plus-eol-bracket
              "C-," 'dev/plus-comma-next-arg
              "C-;" 'dev/plus-eol-semi-colon)

(define-key evil-ex-completion-map (kbd ";") 'exit-minibuffer) ;; maybe change this to evil write

;; package specific

(evil-define-key 'normal evil-cleverparens-mode-map
  "M-)" nil
  "M-(" nil
  "{" 'evil-cp-beginning-of-defun
  "}" 'evil-cp-end-of-defun
  "[" nil                            ; [ and ] aren't used so unimpaired works
  "]" nil)
(evil-define-key 'visual evil-cleverparens-mode-map
  "{" 'evil-cp-beginning-of-defun
  "}" 'evil-cp-end-of-defun
  "[" nil
  "]" nil)

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
  "1" (lambda ()
        (interactive)
        (quick-shift/ff-at-project "game4" "prototype1.js"))
  "2" (lambda ()
        (interactive)
        (quick-shift/ff-at-project "game4" "tasks.org"))
  "3" (lambda ()
        (interactive)
        (quick-shift/ff-at-project "game4" "webpack.config.js"))

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
  "ol" 'comment-line
  ;; "oe" 'cider-pprint-eval-defun-at-point
  )

(spacemacs/set-leader-keys-for-major-mode 'clojure-mode
  "ep" 'cider-pprint-eval-defun-at-point)
