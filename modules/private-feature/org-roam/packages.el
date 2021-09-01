;;; private-feature/org-roam/package.el -*- lexical-binding: t; -*-

;; (package! org-roam :recipe (:local-repo "/Users/yct21/code/emacs/org-roam"))

(package! org-roam
  :recipe (:type git :host github :repo "org-roam/org-roam"))
;; (package! org-roam-server)
