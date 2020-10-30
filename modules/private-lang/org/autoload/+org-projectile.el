;;; private/org/autoload/+org-projectile.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +hoe/projectile-goto-todo ()
  (interactive)
  (org-projectile-goto-location-for-project (projectile-project-name)))
