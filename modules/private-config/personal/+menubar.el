;;; private-config/personal/+menubar.el -*- lexical-binding: t; -*-

(add-hook! 'window-setup-hook
  (define-key global-map [menu-bar options] nil)
  (define-key global-map [menu-bar edit] nil)
  (define-key global-map [menu-bar tools] nil)
  (define-key global-map [menu-bar file] nil)
  (define-key global-map [menu-bar buffers] nil)
  )
