# Mac 初期設定

## XCodeのインストール

- XCodeをApp Storeからマニュアルインストールする
- XCodeを実行し、利用規約に同意する

## Homebrewのインストール

- [homebrew](https://brew.sh)をインストールする

## dotfilesの実行

- `git clone https://github.com/kncp/dotfiles.git`
- `cd ~/dotfiles`
- `./setup.sh`

## Homebrewでアプリをインストール

- `cd ~/dotfiles`
- `brew bundle`

## zshのローカル設定を追加する

- `~/.zshrc.local` を作成する

## sshkeyを生成する

`ssh-keygen -t ed25519 -C "{your@email.address}"`

- passphrase は10桁以上ないとすぐに解析されます

## ssh passphrase をKeyChainに覚えさせる

```
$ ssh-add -K ~/.ssh/id_ed25519
Enter passphrase for /Users/hogehoge/.ssh/id_ed25519:
Identity added: /Users/hogehoge/.ssh/id_ed25519 (your@email.address)
```

## キーボード

- キーのリピート
  - 最大
- リピート入力認識までの時間
  - 最大

## UI

- バッテリー残量パーセント表示
- 日付表示
- Dock設定
  - 右へ移動
  - 少し小さく
- コンピュータ名変更

## Finder

- 環境設定
  - サイドバー
- 表示
  - パスバー

## iTerm2の見た目を変更する

- Profiles
  - Colors
    - Color Presets...: Pastel (Dark Background)
  - Window
    - Columns: 200
    - Rows: 50
    - Transparency: ~25

## Google 日本語入力を設定する

- `キーボード > 入力ソース > +(追加)`
- 日本語の `ひらがな` を追加
- 英語の `英数` を追加
- 元の日本語入力を削除（ `ことえり` など）

## Shellの変更 (Catalina 以降は不要)

```
$ chsh -s /bin/zsh
```
