;;; private-tools/hexo/config.el -*- lexical-binding: t; -*-

(def-package! hexo
  :commands +hexo/open
  :config
  (map! :leader :n "oh" #'+hexo/open)
  (evil-make-overriding-map hexo-mode-map 'normal)
  )
