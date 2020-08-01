(after! idris-mode
  (add-hook! 'idris-mode-hook (electric-indent-local-mode -1))
  )
