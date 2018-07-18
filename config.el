;;; private/brett/config.el -*- lexical-binding: t; -*-

;;
;; General settings
;;

(setq frame-resize-pixelwise t
      user-full-name "Brett Mandler"
      user-mail-address "brettmandler@gmail.com"
      doom-font (font-spec :family "Iosevka Term Medium" :size 22)
      doom-variable-pitch-font (font-spec :family "Iosevka Term Medium" :size 22)
      doom-big-font (font-spec :family "Iosevka Term Medium" :size 24)
      show-trailing-whitespace t
      doom-line-numbers-style 'relative
      doom-large-file-size 1024
      +lookup-open-url-fn 'eww)

(make-face-italic font-lock-comment-face)

;;
;; Keybindings
;;

(map!
 (:leader
   (:prefix "TAB"
     :desc "Rename workspace" :n "r"   #'+workspace/rename)
   (:prefix "f"
     :desc "Find file in dotfiles" :n "t" #'+brett/find-in-dotfiles
     :desc "Browse dotfiles"       :n "T" #'+brett/browse-dotfiles)
   (:prefix "n"
     :desc "Browse mode notes"     :n  "m" #'+brett/find-notes-for-major-mode
     :desc "Browse project notes"  :n  "p" #'+brett/find-notes-for-project))
 :m  "-"  #'dired-jump
 :nv "gr" #'evil-replace-with-register
 :n  "] SPC" (λ! (evil-insert-newline-below)(evil-previous-line))
 :n  "[ SPC" (λ! (evil-insert-newline-above)(evil-next-line)))

;;
;; Modules
;;

;; app/email
(setq mu4e-maildir        (expand-file-name "~/var/mail")
      mu4e-attachment-dir (expand-file-name "attachments" mu4e-maildir))

(after! mu4e
  (setq mu4e-get-mail-command (format "mbsync -c '%s/mbsync/config' -a" xdg-config))

  (setq mu4e-bookmarks
        `(("\\\\Inbox" "Inbox" ?i)
          ("\\\\Draft" "Drafts" ?d)
          ("flag:unread AND \\\\Inbox" "Unread messages" ?u)
          ("flag:flagged" "Starred messages" ?s)
          ("date:today..now" "Today's messages" ?t)
          ("date:7d..now" "Last 7 days" ?w)
          ("mime:image/*" "Messages with images" ?p)))

  (setq smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587)

  (set-email-account! "gmail.com"
                      '((mu4e-sent-folder       . "/gmail.com/Sent Mail")
                        (mu4e-drafts-folder     . "/gmail.com/Drafts")
                        (mu4e-trash-folder      . "/gmail.com/Trash")
                        (mu4e-refile-folder     . "/gmail.com/All Mail")
                        (smtpmail-smtp-user     . "brettmandler")
                        (user-mail-address      . "brettmandler@gmail.com"))))

;; core/projects
(after! projectile
  (setq projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o" ".zwc" ".old")))

;; emacs/eshell
(after! eshell
  (set-eshell-alias!
   "f"   "find-file $1"
   "l"   "ls -lh"
   "d"   "dired $1"
   "gl"  "(call-interactively 'magit-log-current)"
   "gs"  "magit-status"
   "gc"  "magit-commit"
   "rg"  "rg --color=always $*"))

;; feature/evil
(def-package! evil-lion
  :when (featurep! :feature evil)
  :config
  (evil-lion-mode))

(def-package! evil-replace-with-register
  :commands (evil-replace-with-register-install)
  :when (featurep! :feature evil)
  :config
  (evil-replace-with-register-install))

;; lang/javascript
(after! js2-mode
  (setq js2-basic-offset 2
        js2-bounce-indent-p t)
  (add-hook 'js2-mode-hook 'eslintd-fix-mode))

;; lang/org
(setq +org-directory (expand-file-name "~/usr/doc/org")
      org-agenda-files (list org-directory)
      org-ellipsis " ▼ ")

(after! org-bullets
  (setq org-bullets-bullet-list '("#")))

;; lang/sh
(def-package! flycheck-checkbashisms
  :when (and (featurep! :feature syntax-checker)(featurep! :lang sh))
  :after sh-mode
  :hook (flycheck-mode . flycheck-checkbashisms-setup))

;; lang/web
(after! css-mode
  (setq css-indent-offset 2))

;; tools/magit
(setq magit-repository-directories '(("~/src" . 2))
      magit-commit-arguments '("--gpg-sign=72B1D27CB7D82F0F")
      magit-rebase-arguments '("--autostash" "--gpg-sign=72B1D27CB7D82F0F")
      magit-pull-arguments   '("--rebase" "--autostash" "--gpg-sign=72B1D27CB7D82F0F")
      +magit-hub-features t
      magithub-clone-default-directory "~/src/github.com")

(after! magit
  (magit-define-popup-option 'magit-rebase-popup
    ?S "Sign using gpg" "--gpg-sign=" #'magit-read-gpg-secret-key))

;; tools/term
(after! multi-term
  (setq multi-term-program "/usr/bin/fish"))


