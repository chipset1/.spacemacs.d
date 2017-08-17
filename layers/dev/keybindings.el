(general-evil-setup)

(general-nmap "(" 'sp-backward-up-sexp
              ")" 'sp-up-sexp
              "0" 'evil-first-non-blank
              "-" 'deer
              "Q" (lambda ()
                    (interactive)
                    (evil-execute-macro 1 "@q"))
              "gl" 'evil-avy-goto-lin
              "gs" 'magit-status
              "C-k" 'evil-scroll-page-up
              "C-j" 'evil-scroll-page-down
              "C-=" 'evil-numbers/inc-at-pt
              "C--" 'evil-numbers/dec-at-pt
              "C-l" 'dev/change-in-arg
              "C-;" 'evilnc-comment-or-uncomment-lines)

(general-define-key :states '(normal insert)
                    "M-)" 'sp-forward-slurp-sexp
                    "M-(" 'wrap)

(general-define-key :states '(normal visual operator)
                    "H" 'evil-backward-WORD-begin
                    "L" 'evil-forward-WORD-begin)

(general-imap "C-'" 'dev/plus-eol-bracket
              "C-," 'dev/plus-comma-next-arg
              "C-;" 'dev/plus-eol-semi-colon)

(define-key evil-ex-completion-map (kbd ";") 'exit-minibuffer) ;; maybe change this to evil write

;; (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)