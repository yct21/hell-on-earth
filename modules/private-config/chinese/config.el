;;; private/chinese/config.el -*- lexical-binding: t; -*-

;; (use-package! fcitx
;;   :config
;;   (fcitx-aggressive-setup))
  ;; (fcitx-evil-turn-on))

(use-package! ace-pinyin
  :config
  (progn
    (setq ace-pinyin-use-avy t)
    (ace-pinyin-global-mode t)))

(use-package! smart-input-source
  :config
  (add-hook 'text-mode-hook #'smart-input-source-mode)
  :init
  (setq smart-input-source-other-input-source "com.logcg.inputmethod.LogInputMac2.LogInputMac2SP")
  )
