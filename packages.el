;; -*- no-byte-compile: t; -*-
;;; code/emacs/hell-on-earth/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! company-prescient :disable t)
(package! doom-snippets :ignore t)
(package! rustic :recipe (:host github :repo "brotzeit/rustic"))
(package! lsp-mode :recipe (:host github :repo "emacs-lsp/lsp-mode") :pin "0b4bfd43")
(package! lsp-ui :recipe (:host github :repo "emacs-lsp/lsp-ui") :pin "5d643fb")

;; (package! org-roam :recipe (:host github :repo "org-roam/org-roam"))
