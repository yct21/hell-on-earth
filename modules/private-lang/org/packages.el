;; -*- no-byte-compile: t; -*-
;;; private/org/packages.el

(when (featurep! +org-projectile)
  (package! org-projectile))

(when (featurep! +org-journal)
  (package! org-journal))
;; (when (featurep! +org-wiki)
;;   (package! org-wiki))
