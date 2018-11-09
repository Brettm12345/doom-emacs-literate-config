;; -*- no-byte-compile: t; -*-
;;; ~/.config/doom/packages.el

;; app/transmission
(package! transmission)

;; lang/javascript
(package! yarn :recipe (:fetcher github :repo "jmfirth/yarn.el"))

;; lang/apache
(package! apache-mode)

;; lang/sh
(package! flycheck-checkbashisms)

;; ui/doom
(package! doom-themes :recipe (:fetcher github :repo "brettm12345/emacs-doom-themes" :files ("*.el" "themes/*.el")))
