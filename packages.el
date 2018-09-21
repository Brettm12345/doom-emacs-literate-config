;; -*- no-byte-compile: t; -*-
;;; ~/.config/doom/packages.el

;; app/transmission
(package! transmission)

;; feature/evil
(package! evil-replace-with-register)

;; lang/javascript
(package! yarn :recipe (:fetcher github :repo "jmfirth/yarn.el"))

;; lang/sh
(package! flycheck-checkbashisms)
