;;; private-tools/pullover/config.el -*- lexical-binding: t; -*-

(use-package! pullover
  :custom
  (pullover-major-mode 'gfm-mode)
  (pullover-emacsclient-command "/usr/local/bin/emacsclient")
  )
