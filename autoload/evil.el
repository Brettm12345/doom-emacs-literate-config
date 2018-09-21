;;; ~/.config/doom/autoload/evil.el -*- lexical-binding: t; -*-


;;;###autoload (autoload '+brett/sort "~/.config/doom/autoload/evil" nil t)
(evil-define-operator +brett/sort (beg end)
  "Sort lines with motion"
  (interactive "<r>")
  (sort-lines nil beg end))
