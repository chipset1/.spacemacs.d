(load-file "clj-comment.el")
(load-file "processing.el")

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

(defun dev/to-unix-file ()
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix)
  (query-replace "" " "))

(defun dev-powershell-command (command)
  (shell-command-to-string (concat "c:/windows/system32/WindowsPowerShell/v1.0/powershell.exe " command)))

(defun dev/open-in-explorer ()
  ;; same as mac open .
  ;; for other methods check ao
  ;; http://stackoverflow.com/questions/320509/is-it-possible-to-open-an-explorer-window-from-powershell
  (interactive)
  (dev-powershell-command (concat "Invoke-Item " default-directory)))

;; configuration-layer/package-usedp

(fset 'dev/plus-eol-semi-colon [?\C-o ?$ ?\; escape])
(fset 'dev/plus-comma-next-arg [?\C-o ?a ?\,])
(fset 'dev/plus-eol-bracket [?\C-o ?a ?\{ return])
(fset 'dev/change-in-arg [?c ?i ?a])
;; (fset 'dev/function-to-export [?c ?w "export"])

(defun dev/switch-to-buffer-continue ()
  "Activate a sparse keymap:
  <left>   `previous-buffer'
  <right>  `next-buffer'"
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "<left>") #'previous-buffer)
     (define-key map (kbd "<right>") #'next-buffer)
     map)))
