;;; private/org/+org-journal.el -*- lexical-binding: t; -*-

(def-package! org-journal
  :config
  (setq org-journal-dir "~/stf")
  (map! :leader :n "oj" #'org-journal-new-entry)
  )
