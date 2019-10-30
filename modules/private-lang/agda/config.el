;;; private-lang/agda/config.el -*- lexical-binding: t; -*-

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(map! :after agda2-mode
      :map agda2-mode-map
      :ni "C-k" (lambda! (insert "\\")))

(after! agda2-mode
  (setq agda-input-tweak-all
    '(agda-input-compose
      (agda-input-prepend ";")
      (agda-input-nonempty)))
  (agda-input-setup)
  )
