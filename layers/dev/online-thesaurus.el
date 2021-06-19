(require 'dom)
(require 'thingatpt)

;; to do add test add antonyms

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

(defun online-thesaurus--parse-html ()
  (let (start end)
    (goto-char (point-min))
    (search-forward-regexp "id=\"root\"")
    (setq start (point))
    (sgml-skip-tag-forward 1)
    (setq end (point))
    (libxml-parse-html-region start end nil t)))

(defun online-thesaurus--format-buffer ()
  ;; format the raw text
  (evil-first-non-blank)
  ;; (search-forward "]")
  ;; (insert "\n")
  (search-forward "other")
  (evil-backward-word-begin)
  (insert "\n")
  ;; delete links to other synonym pages
  (evil-previous-line)
  (evil-delete-whole-line (point-at-bol) (point-at-eol))

  (evil-forward-WORD-end 4)
  (evil-forward-char)
  (insert "\n")
  ;; delete unneeded text
  (search-forward "MOST")
  (evil-backward-word-begin)
  (insert "\n")
  (evil-delete-line (point-at-bol) (point-at-eol))

  ;; put synonyms on seperate lines
  ;; this might need to be changed since it could
  ;; place a new line in between a synonym since they can be multiple workds
  (evil-previous-line)
  (evil-forward-WORD-end 10)
  (evil-forward-char)
  (insert "\n")

  )
;; compound
(defun online-thesaurus-query ()
  (interactive)
  ;; (message "%s" synonym-lookup)
  (setq synonym-lookup (thing-at-point 'word))
  (url-retrieve (format "http://www.thesaurus.com/browse/%s" synonym-lookup)
                (lambda (status)
                  (let (dom-data heading-pairs)

                    (popwin:popup-buffer-tail (current-buffer))
                    (setq dom-data (online-thesaurus--parse-html))
                    (setq heading-pairs (dom-by-class dom-data "MainContentContainer"))

                    (erase-buffer)
                    (insert (propertize synonym-lookup
                                        'face
                                        '(:foreground "#b48ead" :weight bold)))
                    (insert "\n")
                    (insert (dom-texts heading-pairs))
                    (online-thesaurus--format-buffer)
                    ;; (goto-char (point-min))
                    ))))
