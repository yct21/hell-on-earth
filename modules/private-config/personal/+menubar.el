;;; private-config/personal/+menubar.el -*- lexical-binding: t; -*-

(add-hook! 'window-setup-hook
  (define-key global-map [menu-bar options] nil)
  (define-key global-map [menu-bar edit] nil)
  (define-key global-map [menu-bar tools] nil)
  (define-key global-map [menu-bar file] nil)
  (define-key global-map [menu-bar buffers] nil)
  (after! projectile
    (easy-menu-remove-item nil '() "Projectile")
    (define-key projectile-mode-map [menu-bar projectile] nil)
    )
  (after! yasnippet
    (easy-menu-remove-item nil '() "YASnippet")
    (define-key yas-minor-mode-map [menu-bar yas--minor-mode-menu] nil)
    )
  (easy-menu-remove yas-minor-mode-map '() "YASnippet")
  )
