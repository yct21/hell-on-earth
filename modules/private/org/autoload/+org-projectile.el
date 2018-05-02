;;; private/org/autoload/+org-projectile.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +org/projectile-goto-todo ()
  (interactive)
  (org-projectile-goto-location-for-project (projectile-project-name)))
