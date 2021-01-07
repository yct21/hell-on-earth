;;; private-ui/mini-modeline/config.el -*- lexical-binding: t; -*-

(use-package! mini-modeline
  :init
  (setq mini-modeline-r-format '("test"))
  :config
  (mini-modeline-mode t)
  (doom-modeline-mode t)
  )
