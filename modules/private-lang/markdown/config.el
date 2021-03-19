;;; private-lang/markdown/config.el -*- lexical-binding: t; -*-

(map! :map markdown-mode-map
      :ni "M-y" #'+insert-chrome-url/insert-chrome-current-tab-url-in-md
      )
