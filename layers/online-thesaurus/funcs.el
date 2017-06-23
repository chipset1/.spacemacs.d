(require 'dom)
(require 'thingatpt)

;; to do add test add antonyms
(defvar-local query-url "http://www.thesaurus.com/browse/%s")

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

(defun relevancy-list (dom)
  (dom-by-class dom "relevancy-list"))

(defun synoym-face (word)
  (propertize word
              'face
              '(:foreground "#d08770")))

(defun find-like--insert-text (text)
  (dotimes (n (length text))
    (cond ((and (not (zerop n))
                (zerop (mod n 2)))
           (insert (synoym-face (format "%s,\n" (nth n text)))))
          ((= n (- (length text) 1))
           (insert (synoym-face (format "%s\n" (nth n text)))))
          (t
           (insert (synoym-face (format "%s, " (nth n text))))))))

;; TODO: use dash.el split-at to format synomys
(defun format-text (pair text)
  (insert (propertize (format "\n[%s: %s]\n"
                              (car pair)
                              (cdr pair))
                      'face
                      '(:foreground "#8fa1b3")))
  (find-like--insert-text text))

(defun all-text (dom)
  (mapcar 'dom-texts
          (dom-by-class dom "text")))

(defun heading-data (dom-data)
  (let ((heading (dom-by-class dom-data "synonyms-heading")))
    (pairlis (mapcar (lambda (dom)
                       (dom-texts (dom-by-class dom "txt")))
                     heading)
             (mapcar (lambda (dom)
                       (dom-texts (dom-by-class dom "ttl")))
                     heading))))

(defun parse-html ()
  (let (start end)
    (goto-char (point-min))
    (search-forward-regexp "id=\"content\"")
    (setq start (point))
    (sgml-skip-tag-forward 1)
    (setq end (point))
    (libxml-parse-html-region start end nil t)))

(defun thesaurus ()
  (interactive)
  (setq synonym-lookup (thing-at-point 'word))
  (url-retrieve (format query-url synonym-lookup)
                (lambda (status)
                  (let (dom-data heading-pairs)
                    (popwin:popup-buffer-tail (current-buffer))
                    ;; (switch-to-buffer (current-buffer))
                    ;; (popwin:pop-to-buffer (current-buffer))
                    (setq dom-data (parse-html))
                    (setq heading-pairs (heading-data dom-data))
                    (erase-buffer)
                    (insert (propertize synonym-lookup
                                        'face
                                        '(:foreground "#b48ead" :weight bold)))
                    ;; (message "%s" (mapcar (lambda (dom)
                    ;;                         (json-read-from-string (dom-attr dom 'data-category)))
                    ;;                       (dom-by-tag (dom-by-id dom-data
                    ;;                                              (format "synonyms-%s" 1))
                    ;;                                   'a)))
                    (dotimes (n (length heading-pairs))
                      ;; TODO: sort this properly
                      (format-text (nth n heading-pairs)
                                   (all-text (relevancy-list (dom-by-id dom-data
                                                                        (format "synonyms-%s" n))))))
                    (goto-char (point-min))))))
