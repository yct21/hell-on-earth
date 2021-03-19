;;; private-lang/org/+peregrine.el -*- lexical-binding: t; -*-

(defun hoe-peregrine//switch-to-peregrine ()
  (unless (equal persp-last-persp-name "peregrine")
    (persp-switch "peregrine"))
  )

(defun hoe-peregrine/switch-to-agenda ()
  (interactive)
  (hoe-peregrine//switch-to-peregrine)
  (org-agenda nil "t")
  (evil-goto-first-line)
  )

(defun hoe-peregrine/create-task (title)
  (interactive "sTitle: ")
  (hoe-peregrine//switch-to-peregrine)
  (let* ((filename (--> title
                        (split-string it)
                        (string-join it "-")
                        (downcase it)))
         (timestamp (format-time-string "%Y%m%d%H%M%S"))
         (filepath (format "%s/%s-%s.org"
                           hoe/peregrine
                           timestamp
                           filename)))
    (find-file filepath)
    (erase-buffer)
    (insert (format "* TODO %s\n\n** expectation\n\n** logs"
                    title))
    (evil-goto-first-line)
    ))

(defun hoe-peregrine/switch-from-list ()
  (interactive)
  (+ivy:project-search "\\* LIST ")
  )
