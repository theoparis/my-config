(use-package
	evil
	:load-path "~/.local/share/emacs/evil"
)
(use-package
	catppuccin-theme
	:load-path "~/.local/share/emacs/catppuccin-theme"
)
(load-theme 'catppuccin :no-confirm)
(require 'evil)
(evil-mode 1)
