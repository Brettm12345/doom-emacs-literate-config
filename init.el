;;; init.el -*- lexical-binding: t; -*-

(setenv "SHELL" "/usr/bin/fish")
(setq explicit-shell-file-name "/usr/bin/fish")

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
       (ivy +fuzzy)

       :editor
       format
       parinfer
       rotate-text

       :ui
       (popup +all +defaults)
       (pretty-code +fira)
       doom
       doom-dashboard
       doom-quit
       evil-goggles
       modeline
       fci
       hl-todo
       nav-flash
       treemacs
       unicode
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
       upload

       :lang
       cc
       data
       emacs-lisp
       go
       (haskell +intero)
       markdown
       lua
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
       (default +bindings +evil-commands +snippets)
       literate)
