;;; private-config/startup/config.el -*- lexical-binding: t; -*-

(add-hook! 'doom-after-init-modules-hook
  (doom/load-session "~/code/emacs/doom/.local/etc/workspaces/normal")
  (hoe-observatory/collect-tags)
  (hoe/open-roam-server)
  )
