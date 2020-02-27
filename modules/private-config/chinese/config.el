;;; private/chinese/config.el -*- lexical-binding: t; -*-

(use-package! fcitx
  :config
  (fcitx-default-setup))
  ;; (fcitx-evil-turn-on))

(use-package! ace-pinyin
  :config
  (progn
    (setq ace-pinyin-use-avy t)
    (ace-pinyin-global-mode t)))

;; (use-package! cnfonts
;;   :config
;;   (progn
;;     (cnfonts-enable)))
