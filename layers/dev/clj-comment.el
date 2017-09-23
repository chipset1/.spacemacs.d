(defun comment-when-found (str)
  "WIP should exit if nothing is found"
  ;; after sp-beginning the current point is at (||foo bar).
  ;; sp-beginning moves up a sexp if on a open paren |(|foo bar)
  ;; so backward char is called to place the point on the open paren
  (sp-beginning-of-sexp 1)
  (save-excursion
    (if (or (string-equal str (thing-at-point 'word))
            (sp--looking-at-p (sp--strict-regexp-opt '("(" "[" "{"))))
        (progn
          (backward-char)
          (clojure-comment-uncomment))
      (progn
        (backward-char)
        (comment-when-found str)))))

(defun comment-map ()
  (interactive)
  (save-excursion
    (comment-when-found "map")))

(defun comment-defn ()
  (interactive)
  (save-excursion
    (beginning-of-defun)
    (clojure-comment-uncomment)))

(defun comment-before-defn ()
  (interactive)
  (beginning-of-defun)
  (forward-char)
  (sp-forward-sexp 3)
  (next-line)
  (clojure-comment-uncomment))

(defun comment-line ()
  (interactive)
  (save-excursion
    (sp-down-sexp)
    (clojure-comment-uncomment)))

(defun clojure-comment-uncomment ()
  "Adds/removes reader macro '#_' at the begining of sexp"
  ;; (interactive "c")
  (interactive)
  ;; char at point = # / _ or char before point = _
  ;; or sexp already comment
  ;; then delete comment
  ;; (message (string up))
  ;;(count (if (string-equal "o" (string up)) 1 2))
  (let ((count 1))
    (save-excursion
      (cond ((string-equal "#" (string (char-after)))
             (delete-forward-char 2))
            ((and (sp--looking-at-p (sp--strict-regexp-opt '("(" "[" "{")))
                  (not (string-equal "_" (string (char-before)))))
             (insert "#_"))
            ((string-equal "_" (string (char-after)))
             (progn
               (delete-backward-char 1)
               (delete-char 1)))
            ((string-equal "_" (string (char-before)))
             (delete-backward-char 2))
            (t (progn
                 (sp-beginning-of-sexp count)
                 (backward-char)
                 (if (string-equal "_" (string (char-before)))
                     (delete-backward-char 2)
                   (insert "#_"))))))))

;; (defun elisp-comment-uncomment ()
;;   (sp-backward-up-sexp)
;;   (when (string-match "comment" (thing-at-point 'line))
;;     (message "%s" "asdf"))
;;   ;;   )
;;   (paredit-wrap-sexp)
;;   (sp-backward-up-sexp)
;;   (forward-char)
;;   (insert "comment ")
;;   )