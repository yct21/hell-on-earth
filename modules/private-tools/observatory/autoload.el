;;; private-tools/observatory/autoloads.el -*- lexical-binding: t; -*-

;;;###autodef
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
(defun hoe-observatory/create-snippet (title)
  (interactive "sTitle: ")
  (hoe-observatory/create-draft "snippet" title)
  )

;;;###autoload
(defun hoe-observatory/create-note (title)
  (interactive "sTitle: ")
  (hoe-observatory/create-draft "note" title)
  )

;;;###autoload
(defun hoe-observatory/create-clipping (title)
  (interactive "sTitle: ")
  (hoe-observatory/create-draft "clipping" title)
  (insert "\n")
  (insert "Source: ")
  (+insert-chrome-url/insert-chrome-current-tab-url-in-md title)
  )

;;;###autoload
(defun hoe-observatory/create-draft (category title)
  (let* ((filename (--> title
                        (split-string it)
                        (string-join it "-")
                        (downcase it)))
         (filepath (format "%s/%ss/%s.md"
                           hoe-observatory/root
                           category
                           filename)))
    (find-file filepath)
    (erase-buffer)
    (insert (format hoe-observatory//draft-template
                    title
                    (format-time-string "%Y-%m-%d")
                    category
                    ))))
