#!/bin/bash
# 事前に `gh auth login` を済ませ、リポジトリのルートで実行してください。
set -e

gh issue create --title "#1 プロジェクト初期化" \
  --body "## 説明
Xcodeプロジェクトを作成し、GitHubリポジトリと接続する。

## 完了条件
- [ ] Xcodeプロジェクトがビルド成功する
- [ ] GitHubにinitial commitがpushされている" \
  --label "setup"

gh issue create --title "#2 TodoItemモデル設計" \
  --body "## 説明
タスクのデータ構造を定義する。重要度・繰り返しルール・サブタスク・期限を含む。

## 完了条件
- [ ] TodoItem, Priority, RepeatRule, SubtaskがCodable準拠で実装されている
- [ ] 単体テストでエンコード・デコードが通る" \
  --label "model"

gh issue create --title "#3 TodoStore（データ永続化）" \
  --body "## 説明
タスクの保存・読込を行うクラスを実装する。初期はUserDefaults、将来SwiftDataへ移行可能な設計にする。

## 完了条件
- [ ] アプリ再起動後もタスクが保持される" \
  --label "data"

gh issue create --title "#4 タスク追加機能" \
  --body "## 説明
タスク名入力＋重要度選択（高/中/低）のUIを実装する。

## 完了条件
- [ ] 入力してタスクを追加すると一覧に反映される
- [ ] 空文字では追加できない" \
  --label "feature,ui"

gh issue create --title "#5 リスト表示画面" \
  --body "## 説明
タスク一覧を重要度で色分け表示し、並び替え可能にする。

## 完了条件
- [ ] 重要度ごとに視覚的に区別できる
- [ ] 完了・未完了でグループ分けされる" \
  --label "feature,ui"

gh issue create --title "#6 タスク完了・削除機能" \
  --body "## 説明
チェックで完了、スワイプで削除できるようにする。

## 完了条件
- [ ] 完了状態がトグルできる
- [ ] 削除後リストから消える" \
  --label "feature"

gh issue create --title "#7 サブタスク機能" \
  --body "## 説明
タスクに子タスクを追加し、個別に完了できるようにする。

## 完了条件
- [ ] 親タスク内でサブタスクの追加・完了・削除ができる" \
  --label "feature"

gh issue create --title "#8 繰り返しタスク機能" \
  --body "## 説明
毎日/平日/曜日指定で自動的にその日のリストへ登録する。

## 完了条件
- [ ] 日付が変わったタイミングで該当タスクが自動生成される" \
  --label "feature,logic"

gh issue create --title "#9 通知・リマインダー" \
  --body "## 説明
期限が近いタスクをローカル通知で知らせる。

## 完了条件
- [ ] 通知許可を求める
- [ ] 指定時刻に通知が届く" \
  --label "feature"

gh issue create --title "#10 LLMタスク自動生成" \
  --body "## 説明
Foundation Modelsで曖昧な入力からサブタスク（例: ページ範囲）を生成する。

## 完了条件
- [ ] 「参考書10p」入力で進捗を踏まえたページ範囲が提案される" \
  --label "feature,llm"

gh issue create --title "#11 GitHub ActionsでCI" \
  --body "## 説明
push時に自動ビルド・テストを実行する。

## 完了条件
- [ ] PR作成時にCIが走り結果が表示される" \
  --label "ci"

gh issue create --title "#12 Dockerでユニットテスト環境" \
  --body "## 説明
Swiftの公式Dockerイメージでユニットテストを実行できるようにする。

## 完了条件
- [ ] docker runでテストが実行できる" \
  --label "ci,docker"

echo "12個のIssueを作成しました。"
