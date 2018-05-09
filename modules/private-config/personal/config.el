;;; private/personal/config.el -*- lexical-binding: t; -*-

(when (featurep! +keybindings) (load! +keybindings))
(when (featurep! +mru-workspace) (load! +mru-workspace))

(after! avy
  (setq avy-all-windows 'all-frames))

(setq-default frame-title-format
              '("欢迎回来，指挥官   |   "
                (:eval (+workspace--tabline))))

(setq-default evil-shift-width 2)

(after! typescript-mode
  (setq typescript-indent-level 2))

(after! json-reformat
  (setq json-reformat:indent-width 2))

(after! js2-mode
  (setq js2-basic-offset 2))
