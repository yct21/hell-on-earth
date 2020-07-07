;; -*- no-byte-compile: t; -*-
;;; code/emacs/hell-on-earth/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! company-prescient :disable t)
(package! doom-snippets :ignore t)

(package! org-roam :recipe (:host github :repo "org-roam/org-roam"))
