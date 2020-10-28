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

(use-package! sis
  :config
  ;; (add-hook 'text-mode-hook #'smart-input-source-mode)
  (sis-global-respect-mode)
  :init
  (sis-ism-lazyman-config
   "com.apple.keylayout.US"
   "com.logcg.inputmethod.LogInputMac2.LogInputMac2SP")
  ;; (setq smart-input-source-other-input-source "com.logcg.inputmethod.LogInputMac2.LogInputMac2SP")
  )
