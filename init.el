;;; init.el -*- lexical-binding: t; -*-

(doom! :feature
       eval
       (evil +everywhere)
       file-templates
       (lookup
        +devdocs
        +docsets)
       snippets
       spellcheck
       (syntax-checker +childframe)
       workspaces

       :completion
       (company +childframe)
       (ivy +childframe)

       :editor
       parinfer
       rotate-text

       :ui
       (popup +all +defaults)
       (pretty-code +fira)
       doom
       doom-dashboard
       doom-modeline
       doom-quit
       evil-goggles
       fci
       hl-todo
       nav-flash
       treemacs
       vc-gutter
       vi-tilde-fringe
       window-select

       :emacs
       dired
       ediff
       electric
       eshell
       imenu
       term
       vc

       :tools
       editorconfig
       gist
       make
       magit
       password-store
       pdf
       rgb
       tmux

       :lang
       cc
       data
       emacs-lisp
       go
       (haskell +intero)
       markdown
       javascript
       (org
        +attach
        +babel
        +capture
        +export
        +present)
       python
       rest
       rust
       (sh +fish)
       web

       :app
       (email +gmail)

       :config
       (default +bindings +evil-commands)
       literate)

