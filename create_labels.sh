#!/bin/bash
set -e

gh label create "setup" --color "0E8A16" --description "初期セットアップ" --force
gh label create "model" --color "5319E7" --description "データモデル" --force
gh label create "data" --color "1D76DB" --description "データ永続化" --force
gh label create "ui" --color "FBCA04" --description "UI関連" --force
gh label create "feature" --color "0052CC" --description "新機能" --force
gh label create "logic" --color "C2E0C6" --description "ロジック" --force
gh label create "ci" --color "D93F0B" --description "CI/CD" --force
gh label create "docker" --color "0DB7ED" --description "Docker関連" --force
gh label create "llm" --color "B60205" --description "LLM関連" --force

echo "ラベルを作成しました。"
