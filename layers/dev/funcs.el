(defun layer-dir (file)
  (concat "~/.spacemacs.d/layers/dev/" file))

(load-file (layer-dir "quick-shift.el"))
(load-file (layer-dir "processing.el"))

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

(defun dev/to-unix-file ()
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix)
  (query-replace "" ""))

(defun dev/w3m (url)
  (with-output-to-temp-buffer "*w3m-output*"
    (shell-command (format "~/msys64/usr/bin/w3m.exe %s -S -cols 220" url) standard-output))
  )

(defun w3m-ddg (query-str)
  (dev/w3m (format "https://duckduckgo.com/?q=%s" query-str)))

(defun w3m-reddit (query)
  (w3m-ddg (concat "site:reddit.com " query)))

(defun dev/open-in-explorer ()
  ;; same as mac open .
  ;; for other methods check ao
  ;; http://stackoverflow.com/questions/320509/is-it-possible-to-open-an-explorer-window-from-powershell
  (interactive)
  (shell-command (concat "Invoke-Item " default-directory)))

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


(defun dev/agenda-buffer-format ()
  (general-simulate-keys "wdWj" nil "agenda buffer line format" dev/agenda-format-line)
  (forward-line 2)
  (dev/agenda-format-line)
  )
