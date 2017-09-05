(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

(defun dev/powershell-command (command)
  (shell-command-to-string (concat "c:/windows/system32/WindowsPowerShell/v1.0/powershell.exe " command)))

(defun spacemacs/open-in-explorer ()
  ;; same as mac open .
  ;; for other methods check ao
  ;; http://stackoverflow.com/questions/320509/is-it-possible-to-open-an-explorer-window-from-powershell
  (interactive)
  (dev/powershell-command (concat "Invoke-Item " default-directory)))

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


(defun elisp-comment-uncomment ()
  (sp-backward-up-sexp)
  (when (string-match "comment" (thing-at-point 'line))
    (message "%s" "asdf"))
  ;;   )
  (paredit-wrap-sexp)
  (sp-backward-up-sexp)
  (forward-char)
  (insert "comment ")
  )

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


(defun quick-shift--find-file-if-exists (file-name)
  (find-file-at-point file-name)
  (comment (if (get-buffer file-name)
               (message "find-file-at-point could not find filename %s" file-name))))

(defun quick-shift/ff-at-project (project-name file-name &optional on-fail-fn)
  (if (string-equal (projectile-project-name) project-name)
      (quick-shift--find-file-if-exists file-name)
    (message "%s" (projectile-project-name))))

;; thesaurus

(defun dev/goto-path-at (format-address)
  (let ((path (word-at-point)))
    (browse-url (format format-address path))))

(defun dev/goto-p5reference ()
  (interactive)
  (dev/goto-path-at "https://p5js.org/reference/#/p5/%s"))

(defun dev/goto-processing-reference ()
  (interactive)
  (dev/goto-path-at "https://processing.org/reference/%s_.html"))


;; editing

(fset 'dev/plus-eol-semi-colon [?\C-o ?$ ?\; escape])
(fset 'dev/plus-comma-next-arg [?\C-o ?a ?\,])
(fset 'dev/plus-eol-bracket [?\C-o ?a ?\{ return])
(fset 'dev/change-in-arg [?c ?i ?a])
(fset 'dev/function-to-export [?c ?w "export"])
;; cwexport const ea = $i => 

(spacemacs/jump-to-definition)
(helm-ag)

(defun dev/switch-to-buffer-continue ()
  "Activate a sparse keymap:
  <left>   `previous-buffer'
  <right>  `next-buffer'"
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "<left>") #'previous-buffer)
     (define-key map (kbd "<right>") #'next-buffer)
     map)))
