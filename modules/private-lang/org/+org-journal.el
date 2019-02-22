;;; private/org/+org-journal.el -*- lexical-binding: t; -*-

(def-package! org-journal
  :commands org-journal-new-entry
  :init
  (map! :leader :n "oj" #'org-journal-new-entry)
  :config
  (setq org-journal-dir "~/.stf")
  (setq org-journal-file-format "%Y%m%d.stf")
  (setq org-journal-find-file (lambda (filename)
                                (let ((buffer (find-file-noselect filename)))
                                  (display-buffer buffer)
                                  )
                                ))
  (setq org-journal-carryover-items nil))

(set-popup-rule!
  ".*\\.stf$"
  :select t
  :modeline t
  :autosave t
  )
