(evil-define-operator hoe/necro (beg end type)
  "necro!"
  (evil-shift-left beg end 2)
  (markdown-insert-gfm-code-block "cpp"))
