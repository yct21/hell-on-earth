;;; private/ranger/config.el -*- lexical-binding: t; -*-

(use-package! ranger
  :config
  (ranger-override-dired-mode t)
  (setq ranger-cleanup-eagerly t)
  )
