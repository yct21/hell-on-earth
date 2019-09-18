;;; private/org/+org-journal.el -*- lexical-binding: t; -*-

(def-package! org-journal
  :init
  (map! :leader :n "oj" #'org-journal-new-entry)
  :config
  (setq org-journal-dir "~/.stf")
  (setq org-journal-file-format "%Y%m%d.stf")
  (setq org-journal-find-file (lambda (filename)
                                (let ((buffer (find-file-noselect filename)))
                                  (display-buffer buffer)
                                  (org-journal-mode)
                                  )
                                ))
  (setq org-journal-carryover-items ""))

(set-popup-rule!
  ".*\\.stf$"
  :select t
  :modeline t
  :autosave t
  )
