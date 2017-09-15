
(defvar quick-shift--project-buffers nil)

(setq quick-shift--project-buffers '((".spacemacs.d" ("funcs.el"
                                                      "packages.el"
                                                      "keybindings.el"))
                                     ("game4" ("prototype1.js"
                                               "tasks.org"
                                               "webpack.config.js"))))

(defun quick-shift/ff-at-project (n project-name file-names)
  (when (string-equal (projectile-project-name) project-name)
    (switch-to-buffer (nth n (nth 0 file-names))
                      nil 'force-same-window)
    ))

(defun quick--shift--window (n)
  (mapcar #'(lambda (pb)
              (quick-shift/ff-at-project n (car pb) (cdr pb)))
          quick-shift--project-buffers)
  )

(defun quick-shift-1 ()
  (interactive)
  (quick-shift--window 0))
(defun quick-shift-2 ()
  (interactive)
  (quick-shift--window 1))
(defun quick-shift-3 ()
  (interactive)
  (quick-shift--window 2))

(defun quick-shift--format-var (n s d)
  (mapcar #'(lambda (pb)
              (concat (car pb) " " (car (car (cdr pb)))))
          quick-shift--project-buffers))

(defun quick-shift-change-buffer ()
  (interactive)
  (let ((this-command 'ivy-switch-buffer))
    (ivy-read "Switch to buffer: " (lambda (n s d)
                                     (interactive)
                                     ;; '("game4 var.js\n     foo.js"
                                     (quick-shift--format-var n s d)
                                     )
              :action #'quick-shift--action)
    ))


;; "1" (lambda ()
;;       (interactive)
;;       (quick-shift/ff-at-project "game4" "prototype1.js"))
;; "2" (lambda ()
;;       (interactive)
;;       (quick-shift/ff-at-project "game4" "tasks.org"))
;; "3" (lambda ()
;;       (interactive)
;;       (quick-shift/ff-at-project "game4" "webpack.config.js"))