(require-package 'pcache)
(setq pcache-directory (concat dotemacs-cache-directory "pcache/"))


(require-package 'request)
(setq request-storage-directory (concat dotemacs-cache-directory "request/"))


(require-package 'undo-tree)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      `(("." . ,(concat dotemacs-cache-directory "undo/"))))
(setq undo-tree-visualizer-timestamps t)
(setq undo-tree-visualizer-diff t)
(global-undo-tree-mode)


(require-package 'multiple-cursors)
(setq mc/list-file (concat dotemacs-cache-directory "mc-lists.el"))
(after 'evil
  (add-hook 'multiple-cursors-mode-enabled-hook #'evil-emacs-state)
  (add-hook 'multiple-cursors-mode-disabled-hook #'evil-normal-state))


(require-package 'wgrep)


(when (executable-find "pt")
  (require-package 'pt)
  (require-package 'wgrep-pt))


(when (executable-find "ag")
  (require-package 'ag)
  (setq ag-highlight-search t)
  (add-hook 'ag-mode-hook (lambda () (toggle-truncate-lines t)))
  (require-package 'wgrep-ag))


(require-package 'project-explorer)
(evilify project-explorer-mode project-explorer-mode-map)
(after 'project-explorer
  (setq pe/cache-directory (concat dotemacs-cache-directory "project-explorer"))
  (setq pe/omit-regex (concat pe/omit-regex "\\|^node_modules$")))


(require-package 'avy)


(require-package 'expand-region)


(when (executable-find "editorconfig")
  (require-package 'editorconfig)
  (require 'editorconfig))


(require-package 'aggressive-indent)
(require 'aggressive-indent)
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'lisp-mode-hook #'aggressive-indent-mode)


(require-package 'etags-select)
(setq etags-select-go-if-unambiguous t)


(require-package 'windsize)
(require 'windsize)
(setq windsize-cols 16)
(setq windsize-rows 8)
(windsize-default-keybindings)


(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


(require-package 'framemove)
(require 'framemove)
(setq framemove-hook-into-windmove t)


(require-package 'discover-my-major)


(when (and (>= emacs-major-version 24)
           (>= emacs-minor-version 4))
  (setq paradox-execute-asynchronously t)
  (require-package 'paradox)
  (evilify paradox-menu-mode paradox-menu-mode-map))


(require-package 'vlf)
(setq vlf-application 'dont-ask)
(require 'vlf-setup)


(require-package 'popwin)
(require 'popwin)
(popwin-mode)


(require-package 'restart-emacs)


(provide 'init-misc)
