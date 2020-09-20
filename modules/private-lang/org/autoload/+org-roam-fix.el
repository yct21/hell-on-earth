;;; private-lang/org/autoload/+org-roam-fix.el -*- lexical-binding: t; -*-

;;;###autoload
(defun hoe/open-roam-server ()
  (interactive)
  (smartparens-global-mode -1)
  (org-roam-server-mode)
  (smartparens-global-mode +1)
  )
