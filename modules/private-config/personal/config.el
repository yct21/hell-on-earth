;;; private/personal/config.el -*- lexical-binding: t; -*-

(when (featurep! +keybindings) (load! +keybindings))
(when (featurep! +mru-workspace) (load! +mru-workspace))

(after! avy
  (setq avy-all-windows 'all-frames))

(setq-default frame-title-format
              '("Emacs   |   "
                (:eval (+workspace--tabline))))
