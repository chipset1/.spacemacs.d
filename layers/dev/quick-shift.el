
(defvar quick-shift--project-buffers nil)

(setq quick-shift--project-buffers '((".spacemacs.d" ("keybindings.el"
                                                      "packages.el"
                                                      "funcs.el"))
                                     ("game4" ("prototype1.js"
                                               "tasks.org"
                                               "webpack.config.js"))))

;; (find-file "keybindings.el")

(defun quick-shift/view-buffers ()
  (define-key popwin:keymap (kbd "q") 'popwin:close-popup-window)
  (set-window-configuration (current-window-configuration))
  ;; (popwin:create-popup-window 30 'bottom nil)

  ;; (set-window-buffer nil "buffer1")
  ;; (set-window-buffer (split-window (selected-window) helm-autoresize-min-height t) "buffer2")

  (switch-to-buffer "*popwin-dummy*")
  (insert quick-shift--project-buffers)
  )

(defun quick-shift--ff-at-project (n project-name file-names)
  (when (string-equal (projectile-project-name) project-name)
    (find-file (nth n (nth 0 file-names)))
    ;; (switch-to-buffer (nth n (nth 0 file-names))
    ;;                   nil 'force-same-window)
    ))

(defun quick-shift--window (n)
  (mapcar #'(lambda (pb)
              (quick-shift--ff-at-project n (car pb) (cdr pb)))
          quick-shift--project-buffers))

;;  todo
;; (defun quick-shift-set-buffers (p buffers)
;;   ;; (cons '(1 2 3)  1)
;;   (setq (quick-shift--project-buffers) ))

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
