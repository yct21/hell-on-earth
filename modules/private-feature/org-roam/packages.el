;;; private-feature/org-roam/package.el -*- lexical-binding: t; -*-

(package! org-roam)
(package! org-roam-server)

(use-package! org-roam-server
  :config
  (setq org-roam-server-port 2020)
  )
