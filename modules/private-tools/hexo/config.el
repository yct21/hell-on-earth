;;; private-tools/hexo/config.el -*- lexical-binding: t; -*-

(def-package! hexo
  :config
  (evil-make-overriding-map hexo-mode-map 'normal)
  )
