;;; private-lang/org/+observatory.el -*- lexical-binding: t; -*-

(setq hoe/observatory-tags-file "~/doc/observatory/20201026103832-tags.org")
(setq hoe/observatory-tags nil)

;;;###autoload
(defun hoe-observatory/collect-tags ()
  (interactive)
  (setq hoe/observatory-tags (--> hoe/observatory-tags-file
                               (f-read-text it)
                               (s-match-strings-all "^- .*" it)
                               (-map (lambda (str) (substring (car str) 2)) it)))
  )

(after! org-mode
  (add-hook! 'org-mode hoe-observatory/collect-tags)
  )

;;;###autoload
(defun hoe-observatory/insert-tag ()
  (interactive)
  (insert " ")
  (ivy-read "Insert tag"
    hoe/observatory-tags
    :action #'insert
    )
  )
