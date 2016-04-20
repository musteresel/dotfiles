;;;; Emacs startup configuration



;;; Basic Emacs config
(setq inhibit-startup-message t)
(transient-mark-mode)
(delete-selection-mode)
(column-number-mode)
(show-paren-mode)
(which-function-mode)
(tool-bar-mode -1)



;;; Bootstrap use-package, setting up package.el along the way
(require 'package)
(setq package-enable-at-startup nil) ; DON'T autorun package-initialize...
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize) ; ... run it NOW
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(require 'bind-key)


;;; Autocompletion
(use-package company
  :ensure t
  :defer t
  :config (global-company-mode))

;;; Auto resize windows to make life easier
(use-package golden-ratio
  :ensure t
  :config (golden-ratio-mode 1))
