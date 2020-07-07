(after! cc-mode
  ;; (setq ccls-args "-init='{\"clang\":{\"extraArgs\":[\"-isystem\", \"/Library/Developer/CommandLineTools/usr/include/c++/v1\"]}}'")
  ;; (setq ccls-initialization-options `(:clang (:resourceDir "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/11.0.0")))
  (setq ccls-initialization-options `(:clang (:resourceDir "/usr/local/Cellar/llvm/9.0.1/lib/clang/9.0.1")))
  (set-pretty-symbols! '(c-mode c++-mode) nil)
  (set-pretty-symbols! '(c-mode c++-mode)
    ;; Functional
    ;; :def "void "
    ;; Types
    :null "nullptr"
    ;; Flow
    :not "!"
    :for "for"
    :return "return"
    )
  (after! quickrun
    (quickrun-add-command "c++/clang++"
      '((:command     . "clang++")
        (:exec        . ("%c -std=c++2a -I/usr/local/include -L/usr/local/lib  -o %e %s"
                          "%e %a"))
        (:remove . ("%e"))
        (:description . "Run C++"))
      :default "c++")
    )
  )
