(defun layer-dir (file)
  (concat "~/.spacemacs.d/layers/dev/" file))

;;(load-file (layer-dir "quick-shift.el"))
(load-file (layer-dir "processing.el"))
(load-file (layer-dir "online-thesaurus.el"))

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

(defun dev/to-unix-file ()
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix)
  (query-replace "" ""))

(defun dev/w3m (url)
  (interactive)
  (with-output-to-temp-buffer "*w3m-output*"
    (shell-command (format "c:/Users/stephen/msys64/usr/bin/w3m.exe %s -S -cols 40" url) standard-output)
    )
  ;; (switch-to-buffer "*w3m-output*")
  )


(defun w3m-ddg (query-str)
  (dev/w3m (format "https://duckduckgo.com/?q=%s" query-str)))

(defun w3m-reddit (query)
  (w3m-ddg (concat "site:reddit.com " query)))

(defun dev/pacman ()
  (shell-command (format "~/msys64/usr/bin/pacman.exe %s")))

(defun dev/open-in-explorer ()
  ;; same as mac open .
  ;; for other methods check ao
  ;; http://stackoverflow.com/questions/320509/is-it-possible-to-open-an-explorer-window-from-powershell
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open"))
  ;; (shell-command (concat "Invoke-Item " default-directory))
  )

;; configuration-layer/package-usedp


(fset 'dev/plus-eol-semi-colon [escape ?$ ?a ?\; escape])
(fset 'dev/plus-comma-next-arg [?\C-o ?a ?\,])
(fset 'dev/plus-eol-bracket [?\C-o ?a ?\{ return])
(fset 'dev/change-in-arg [?c ?i ?a])
;; (fset 'dev/function-to-export [?c ?w "export"])

(defun dev/switch-to-buffer-continue ()
  "Activate a sparse keymap:
  <left>   `previous-buffer'
  <right>  `next-buffer'
 this doesn't work"
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

(defun dev/org-insert-journal-heading ()
  ;; http://ergoemacs.org/emacs/elisp_datetime.html
  (interactive)
  (evil-org-org-insert-heading-respect-content-below)
  (insert (format "%s %sth\n\t"
                  (format-time-string "%A")
                  (format-time-string "%d")))
  )

(defun dev/goto-clojure-docs ()
  (interactive)
  (dev-goto-path-at "https://clojuredocs.org/clojure.core/%s"))

(defun dev/clip-file ()
  "Put the current file name on the clipboard"
  ;; https://stackoverflow.com/questions/18812938/copy-full-file-path-into-copy-paste-clipboard
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      (file-name-directory default-directory)
                    (buffer-file-name))))
    (when filename
      (x-select-text filename))))

;;ffmpeg -framerate 60 -i  ./output/day1/%04d.tif -pix_fmt yuv420p mp4s/day1_10000.mp4
(defun dev/ffmpeg-quil-sketch (num)
  "i didn't use this. see if I can make a general one for all processing sketches"
  (interactive "sday number: ")
  (let ((default-directory "~/src/clojure/genuary2022/quil"))
    (shell-command (concat "ffmpeg -y -framerate 60 -i  ./output/day"
                           num
                           "/%04d.tif -pix_fmt yuv420p mp4s/day"
                           num ".mp4"
                           ;; "  && vlc mp4s/day" num ".mp4"
                           ))
    (dev/open-in-explorer)
    ))