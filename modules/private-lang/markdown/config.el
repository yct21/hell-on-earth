;;; private-lang/markdown/config.el -*- lexical-binding: t; -*-

(map! :map markdown-mode-map
      :localleader
      :prefix "i"
      "l" #'+insert-chrome-url/insert-chrome-current-tab-url-in-md)
