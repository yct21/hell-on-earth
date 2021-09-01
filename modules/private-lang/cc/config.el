(after! cc-mode

  ;; (setq ccls-initialization-options `(:clang (:resourceDir "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/11.0.0")))
  ;; (setq ccls-initialization-options `(:clang (:resourceDir "/usr/local/Cellar/llvm/10.0.1/lib/clang/9.0.1")))
  (add-hook! 'cc-mode-hook
    (push 'c/c++-clang flycheck-disabled-checkers)
    (push 'c/c++-gcc flycheck-disabled-checkers)
    (push 'c/c++-cppcheck flycheck-disabled-checkers))

  (set-pretty-symbols! '(c-mode c++-mode) nil)
  ;; (set-pretty-symbols! '(c-mode c++-mode)
  ;;   ;; Functional
  ;;   ;; :def "void "
  ;;   ;; Types
  ;;   :null "nullptr"
  ;;   ;; Flow
  ;;   :not "!"
  ;;   :for "for"
  ;;   :return "return"
  ;;   )
  (after! quickrun
    (quickrun-add-command "c++/clang++"
      '((:command     . "clang++")
        (:exec        . ("%c -std=c++17 -I/usr/local/include -L/usr/local/lib  -o %e %s"
                          "%e %a"))
        (:remove . ("%e"))
        (:description . "Run C++"))
      :default "c++")
    )
  )

(after! lsp-mode
  (add-to-list 'lsp-disabled-clients 'ccls)
  )

(add-to-list 'auto-mode-alist '(".buckconfig" . conf-toml-mode))

(load! "+format")
