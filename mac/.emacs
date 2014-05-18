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
