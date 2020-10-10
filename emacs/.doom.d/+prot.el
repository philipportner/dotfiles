;;; ../dotfiles/emacs/.doom.d/+prot.el -*- lexical-binding: t; -*-

(use-package counsel
  :after ivy
  :custom
  (counsel-yank-pop-preselect-last t)
  (counsel-yank-pop-separator "\n—————————\n")
  (counsel-rg-base-command
   "rg -SHn --no-heading --color never --no-follow --hidden %s")
  (counsel-find-file-occur-cmd          ; TODO Simplify this
   "ls -a | grep -i -E '%s' | tr '\\n' '\\0' | xargs -0 ls -d --group-directories-first")
  :config
  (defun prot/counsel-fzf-rg-files (&optional input dir)
    "Run `fzf' in tandem with `ripgrep' to find files in the
present directory.  If invoked from inside a version-controlled
repository, then the corresponding root is used instead."
    (interactive)
    (let* ((process-environment
            (cons (concat "FZF_DEFAULT_COMMAND=rg -Sn --color never --files --no-follow --hidden")
                  process-environment))
           (vc (vc-root-dir)))
      (if dir
          (counsel-fzf input dir)
        (if (eq vc nil)
            (counsel-fzf input default-directory)
          (counsel-fzf input vc)))))

  (defun prot/counsel-fzf-dir (arg)
    "Specify root directory for `counsel-fzf'."
    (prot/counsel-fzf-rg-files ivy-text
                               (read-directory-name
                                (concat (car (split-string counsel-fzf-cmd))
                                        " in directory: "))))

  (defun prot/counsel-rg-dir (arg)
    "Specify root directory for `counsel-rg'."
    (let ((current-prefix-arg '(4)))
      (counsel-rg ivy-text nil "")))

  ;; TODO generalise for all relevant file/buffer counsel-*?
  (defun prot/counsel-fzf-ace-window (arg)
    "Use `ace-window' on `prot/counsel-fzf-rg-files' candidate."
    (ace-window t)
    (let ((default-directory (if (eq (vc-root-dir) nil)
                                 counsel--fzf-dir
                               (vc-root-dir))))
      (if (> (length (aw-window-list)) 1)
            (find-file arg)
        (find-file-other-window arg))
      (balance-windows (current-buffer))))

  ;; Pass functions as appropriate Ivy actions (accessed via M-o)
  (ivy-add-actions
   'counsel-fzf
   '(("r" prot/counsel-fzf-dir "change root directory")
     ("g" prot/counsel-rg-dir "use ripgrep in root directory")
     ("a" prot/counsel-fzf-ace-window "ace-window switch")))

  (ivy-add-actions
   'projectile-find-file
   '(("a" prot/counsel-fzf-ace-window "ace-window switch")))

  (ivy-add-actions
   'switch-to-buffer
   '(("a" prot/counsel-fzf-ace-window "ace-window switch")))

  (ivy-add-actions
   'counsel-rg
   '(("r" prot/counsel-rg-dir "change root directory")
     ("z" prot/counsel-fzf-dir "find file with fzf in root directory")))

  (ivy-add-actions
   'counsel-find-file
   '(("g" prot/counsel-rg-dir "use ripgrep in root directory")
     ("a" prot/counsel-fzf-ace-window "ace-window switch")
     ("z" prot/counsel-fzf-dir "find file with fzf in root directory")))

  ;; Remove commands that only work with key bindings
  (put 'counsel-find-symbol 'no-counsel-M-x t)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ;; ("C-x d" . counsel-dired)
         ("C-x C-r" . counsel-recentf)
         ("M-s g" . counsel-git-grep)
         ;; ("M-s l" . counsel-find-library)
         ("M-s z" . prot/counsel-fzf-rg-files)
         :map ivy-minibuffer-map
         ("C-SPC" . ivy-restrict-to-matches)))

(use-package ace-window
  :custom
  (aw-keys '(?h ?j ?k ?l ?y ?u ?i ?o ?p))
  (aw-scope 'frame)
  (aw-dispatch-always t)
  (aw-dispatch-alist
   '((?s aw-swap-window "Swap Windows")
     (?2 aw-split-window-vert "Split Window Vertically")
     (?3 aw-split-window-horz "Split Window Horizontally")
     (?? aw-show-dispatch-help)))
  (aw-minibuffer-flag t)
  (aw-ignore-current nil)
  (aw-display-mode-overlay t)
  (aw-background t)
  :config
  (ace-window-display-mode -1))

(map! :leader
      :desc "Ace-window" "0" #'ace-window)
