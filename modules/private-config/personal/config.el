;;; private/personal/config.el -*- lexical-binding: t; -*-

(when (featurep! +keybindings) (load! +keybindings))
(when (featurep! +mru-workspace) (load! +mru-workspace))

(after! avy
  (setq avy-all-windows 'all-frames))

(setq-default frame-title-format
              '("别浪费时间折腾编辑器了……   |   "
                (:eval (+workspace--tabline))))
