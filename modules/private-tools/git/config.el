;;; private-tools/git/config.el -*- lexical-binding: t; -*-


(after! magit-gitflow
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
  (define-key magit-mode-map "%" 'magit-gitflow-popup))
