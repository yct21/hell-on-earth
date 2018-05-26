(after! evil-surround
  (evil-define-key 'operator evil-surround-mode-map "t" 'evil-surround-edit)
  (evil-define-key 'operator evil-surround-mode-map "t" 'evil-Surround-edit)
  (evil-define-key 'visual evil-surround-mode-map "t" 'evil-surround-region)
  (evil-define-key 'visual evil-surround-mode-map "gT" 'evil-Surround-region)
  )
