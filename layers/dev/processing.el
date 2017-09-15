(defun dev-goto-path-at (format-address)
  (let ((path (word-at-point)))
    (browse-url (format format-address path))))

(defun dev/goto-p5reference ()
  (interactive)
  (dev-goto-path-at "https://p5js.org/reference/#/p5/%s"))

(defun dev/goto-processing-reference ()
  (interactive)
  (dev-goto-path-at "https://processing.org/reference/%s_.html"))

(defun dev/helm-processing-find-sketch ()
  (interactive)
  (helm :sources '(((name . "Sketches")
                    (candidates . (lambda ()
                                    (directory-files processing-sketch-dir
                                                     nil
                                                     nil
                                                     #'file-newer-than-file-p)))
                    (action . (lambda (candidate)
                                (message "%s" candidate)
                                (processing-find-sketch candidate)))))
        :buffer "*helm-processing-find-sketch*"))