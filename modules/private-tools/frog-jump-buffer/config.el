;;; private-tools/frog-jump-buffer/config.el -*- lexical-binding: t; -*-

(def-package! frog-jump-buffer
  :config
  (dolist (regexp '("TAGS" "^\\*Compile-log" "-debug\\*$" "^\\:" "errors\\*$" "^\\*Backtrace" "-ls\\*$"
                  "stderr\\*$" "^\\*Flymake" "^\\*vc" "^\\*Warnings" "^\\*eldoc" "\\^*Shell Command"))
    (push regexp frog-jump-buffer-ignore-buffers))
  (setq frog-jump-buffer-default-filter 'frog-jump-buffer-filter-same-project)
  )
