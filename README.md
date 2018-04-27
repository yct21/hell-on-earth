# Private doom configuration

This is my private configuration for [doom-emacs](https://github.com/hlissner/doom-emacs).

## Install

``` sh
git clone https://github.com/yct21/doom-emacs-private ~/.config/doom
```

And use this `doom!` block in `~/.emacs.d/init.el`:

```emacs-lisp
(doom! 
  :private 
  (personal +keybindings)
  ;; other modules you want to include
)
```
