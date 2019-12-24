;;; private-tools/vlf/config.el -*- lexical-binding: t; -*-

(use-package! vlf
  :config
  (require 'vlf-setup)
  )

(defun vlf/define-keybindings ()
  "Define keybindings for VLF"
  (map! :map vlf-mode-map
       :n "C-f" #'vlf-occur)
  (map! :map vlf-occur-mode-map
        :n "RET" #'vlf-occur-visit
        :n "o" #'vlf-occur-show))
