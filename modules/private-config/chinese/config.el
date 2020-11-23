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
  :hook
   (((text-mode prog-mode) . sis-context-mode)
   ((text-mode prog-mode) . sis-inline-mode))
  :config
(sis-ism-lazyman-config
   "com.apple.keylayout.US"
   "com.logcg.inputmethod.LogInputMac2.LogInputMac2SP")
  ;; (setq smart-input-source-other-input-source "com.logcg.inputmethod.LogInputMac2.LogInputMac2SP")

  ;; (add-hook 'text-mode-hook #'smart-input-source-mode)
  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  (setq
    sis-inline-tighten-head-rule 0
    sis-inline-tighten-tail-rule 0)
  ;; enable the /follow context/ mode for all buffers
  ;; (sis-global-follow-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  ;; (sis-global-inline-mode t)
  )
