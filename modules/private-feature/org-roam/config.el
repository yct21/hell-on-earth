;;; private-feature/org-roam/config.el -*- lexical-binding: t; -*-

;;; org-roam
(defun my-org-protocol-focus-advice (orig &rest args)
  (x-focus-frame nil)
  (apply orig args))

(use-package! org-roam
  :ensure t
  :hook (org-load . org-roam-mode)
  :config
  (setq org-roam-directory "~/doc/observatory")
  (setq org-roam-db-location "~/doc/observatory/org-roam.db")
  (setq org-roam-graph-viewer "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
  (setq org-roam-server-network-poll nil)
  (setq org-roam-completion-system 'ivy)
  (set-company-backend! 'org-mode '(company-tabnine company-yasnippet company-dabbrev))
  (advice-add 'org-roam-protocol-open-ref :around
              #'my-org-protocol-focus-advice)
  (advice-add 'org-roam-protocol-open-file :around
              #'my-org-protocol-focus-advice)
  )

(use-package! org-roam-protocol
  :after org-protocol)
