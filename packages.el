;; -*- no-byte-compile: t; -*-
;;; ~/.config/doom/packages.el

;; feature/evil
(package! evil-lion)
(package! evil-replace-with-register)

;; lang/javascript
(package! yarn :recipe (:fetcher github :repo "jmfirth/yarn.el"))

;; lang/sh
(package! flycheck-checkbashisms)

