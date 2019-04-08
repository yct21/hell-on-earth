;;; private/chinese/config.el -*- lexical-binding: t; -*-

(def-package! fcitx
  :config
  (fcitx-evil-turn-on))

(def-package! ace-pinyin
  :config
  (progn
    (setq ace-pinyin-use-avy t)
    (ace-pinyin-global-mode t)))

;; (def-package! cnfonts
;;   :config
;;   (progn
;;     (cnfonts-enable)))
