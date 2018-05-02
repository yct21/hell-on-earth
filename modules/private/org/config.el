;;; private/org/config.el -*- lexical-binding: t; -*-

(when (featurep! +org-projectile)
  (def-package! org-projectile
    :config
    (org-projectile-per-project)
    (setq org-projectile-per-project-filepath "TODOs.org"))
  (load! +org-projectile))

(map!
 (:localleader
   (:desc "Insert element" :prefix "i"
     :desc "Insert drawer" :n "d" #'org-insert-drawer
     )))
