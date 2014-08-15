;; UserSettings
(setq user-full-name "Yagi2")
(setq user-mail-address "mail@yagi2.com")

;; common mode
;; tabではなくspaceを使う
(setq indent-tabs-mode nil)
;; インデント幅を4に変更
(setq-default tab-width 4)
;; バッファ最後の行でnext-lineしても新しい行を作らない
(setq next-line-add-newlines nil)

;; c/c++ mode
(add-hook 'c-mode-common-hook
		  '(lambda ()
			 ;; K&Rスタイルを利用する
			 (c-set-style "k&r")
			 ;; インデントにtabではなくspaceを使う
			 (setq indent-tabs-mode nil)
			 ;; インデント幅を4にする
			 (setq c-basic-offset 4)
			 ))

;;; 拡張子によるモードの対応
(setq auto-mode-alist
      (append
	   '(("\\.html$" . html-mode))
       '(("\\.c$" . c-mode))
       '(("\\.h$" . ch-mode))
       '(("\\.cpp$" . c++-mode))
       auto-mode-alist))

;;; 文字コード
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq file-name-coding-system 'sjis)
(setq locale-coding-system 'utf-8)

;; テキストエンコーディングとしてUTF-8を優先使用
(prefer-coding-system 'utf-8)

;; C-kでは最後の改行まで削除
(setq kill-whole-line t)

;; Localeに合わせた環境設定
(set-locale-environment nil)
(prefer-coding-system 'utf-8)

;; 終了してもカーソル位置を記録
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 50)
                                  (session-file-alist 500 t)
                                  (file-name-history 10000)))
  (setq session-globals-max-string 100000000)
  (setq history-length t)
  (add-hook 'after-init-hook 'session-initialize))

;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)

;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; Beep音を鳴らさない
(setq visible-bell nil)

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)
(setq auto-save-default nil)

;; カーソルのある桁数を表示
(column-number-mode t)
;; タイトルバーにファイル名表示
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; スクロールを１行単位
(setq scroll-step 1)

;; 開始時のメッセージを削除
(setq inhibit-startup-message t)

;; キーバインド
;; コメントアウト
(define-key global-map (kbd "C-c ;") 'comment-dwim)

;; カーソル行をハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "ForestGreen"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;;ツールバーを削除
(tool-bar-mode 0)

;; フォントの設定
(set-face-attribute 'default nil
            :family "Ricty" ;; font
            :height 160)    ;; font size

(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Ricty")) ;; font

;; color-theme
(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-molokai)

;; direx
(add-to-list 'load-path "~/.emacs.d/site-lisp/direx-el")
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;; popwin
(add-to-list 'load-path "~/.emacs.d/site-lisp/popwin-el")
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; direxの設定
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")

;; tabbar
(add-to-list 'load-path "~/.emacs.d/site-lisp/tabbar-el")
(require 'cl)
 (when (require 'tabbar nil t)
    (setq tabbar-buffer-groups-function
	    (lambda (b) (list "All Buffers")))
    (setq tabbar-buffer-list-function
          (lambda ()
            (remove-if
             (lambda(buffer)
	       (unless (string= (buffer-name buffer) "*shell*")
		 (find (aref (buffer-name buffer) 0) " *")))
             (buffer-list))))
    (tabbar-mode))

;; 左に表示されるボタンを無効化
(setq tabbar-home-button-enabled "")
(setq tabbar-scroll-left-button-enabled "")
(setq tabbar-scroll-right-button-enabled "")
(setq tabbar-scroll-left-button-disabled "")
(setq tabbar-scroll-right-button-disabled "")

;; 色設定
 (set-face-attribute
   'tabbar-default-face nil
   :background "gray90") ;バー自体の色
  (set-face-attribute ;非アクティブなタブ
   'tabbar-unselected-face nil
   :background "gray90"
   :foreground "black"
   :box nil)
  (set-face-attribute ;アクティブなタブ
   'tabbar-selected-face nil
   :background "black"
   :foreground "white"
   :box nil)

;; 幅設定
  (set-face-attribute
   'tabbar-separator-face nil
   :height 0.7)

;; Firefoxライクなキーバインドに
(global-set-key [(control tab)]       'tabbar-forward)
(global-set-key [(control shift iso-lefttab)] 'tabbar-backward)
;; -nw では効かないので別のキーバインドを割り当てる
(global-set-key (kbd "C-x n") 'tabbar-forward)
(global-set-key (kbd "C-x p") 'tabbar-backward)

;;F4ボタンで切り替え
(global-set-key [f4] 'tabbar-mode)

;; Macのトラックパッドでの快適スクロール
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)

;; 行番号設定
(global-linum-mode t)

;; ウィンドウサイズ
(setq initial-frame-alist
      '((top . 1) (left . 1) (width . 130) (height . 50)))

;; github
(defun chomp (str)
  (replace-regexp-in-string "[\n\r]+$" "" str))

(defun git-project-p ()
  (string=
   (chomp
    (shell-command-to-string "git rev-parse --is-inside-work-tree"))
   "true"))

(defun open-github-from-current ()
  (interactive)
  (cond ((and (git-project-p) (use-region-p))
         (shell-command
          (format "open-github-from-file %s %d %d"
                  (file-name-nondirectory (buffer-file-name))
                  (line-number-at-pos (region-beginning))
                  (line-number-at-pos (region-end)))))
        ((git-project-p)
         (shell-command
          (format "open-github-from-file %s %d"
                  (file-name-nondirectory (buffer-file-name))
                  (line-number-at-pos))))))

;; 文法チェック
(require 'flymake)

(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)

(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.cpp&" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c-mode-hook
          '(lambda ()
             (flymake-mode t)))

(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "gcc" (list "-Wall" local-file))))

(push '("\\.c$" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c-mode-hook
          '(lambda ()
             (flymake-mode t)))

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete-1.3.1/dict")
(ac-config-default)

;; git gutter
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-git-gutter")
(require 'git-gutter)
(global-git-gutter-mode t)

(custom-set-variables
 '(git-gutter:window-width 2)
 '(git-gutter:modified-sign "☁")
 '(git-gutter:added-sign "☀")
 '(git-gutter:deleted-sign "☂"))

(set-face-background 'git-gutter:modified "blue") ;; background color
(set-face-foreground 'git-gutter:added "orange")
(set-face-foreground 'git-gutter:deleted "white")
