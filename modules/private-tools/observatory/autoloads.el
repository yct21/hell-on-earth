;;; private-tools/observatory/autoloads.el -*- lexical-binding: t; -*-

;;;###autoload (autoload 'hoe/observatory-create-post/body "core/autoload/hydras" nil t)
(defhydra hoe-observatory/create-post (:hint nil)
  "
  Observatory create post:
  _b_:bliki
  _n_:note
  _c_:cliping "
  ("b" hoe-observatory/create-bliki)
  ("n" hoe-observatory/create-note)
  ("c" hoe-observatory/create-cliping)
  )

(defconst hoe-observatory//draft-template
  "
---
title: \"%s\"
date: %s
tags: []
categories: %s
---
"
  )

;;;###autoload
(defun hoe-observatory/create-bliki (title)
  (interactive "sTitle: ")
  (hoe-observatory/create-draft "bliki" title)
  )

;;;###autoload
(defun hoe-observatory/create-note (title)
  (interactive "sTitle: ")
  (hoe-observatory/create-draft "note" title)
  )

;;;###autoload
(defun hoe-observatory/create-cliping (title)
  (interactive "sTitle: ")
  (hoe-observatory/create-draft "cliping" title)
  (insert "\n")
  (insert "Source: ")
  (+insert-chrome-url/insert-chrome-current-tab-url-in-md)
  )

;;;###autoload
(defun hoe-observatory/create-draft (category title)
  (let* ((filename (--> title
                        (split-string it)
                        (string-join it "-")
                        (downcase it)))
         (filepath (format "%s/source/_drafts/%s-%s.md"
                           hoe-observatory/root
                           category
                           filename)))
    (find-file filepath)
    (erase-buffer)
    (insert (format hoe-observatory//draft-template
                    title
                    (format-time-string "%Y-%m-%d %H:%M:%S")
                    category
                    ))))
