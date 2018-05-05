;;; private/personal/config.el -*- lexical-binding: t; -*-

(when (featurep! +keybindings) (load! +keybindings))

(after! avy
  (setq avy-all-windows 'all-frames))
