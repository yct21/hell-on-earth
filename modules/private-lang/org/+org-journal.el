;;; private/org/+org-journal.el -*- lexical-binding: t; -*-

(def-package! org-journal
  :commands org-journal-new-entry
  :init
  (map! :leader :n "oj" #'org-journal-new-entry)
  :config
  (setq org-journal-dir "~/orlog/stf")
  (setq org-journal-carryover-items nil))
