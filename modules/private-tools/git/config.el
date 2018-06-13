;;; private-tools/git/config.el -*- lexical-binding: t; -*-


(after! magit-gitflow
  (define-key magit-mode-map "%" 'magit-gitflow-popup))
