# rails7-practice

## rails serverが実行できるまで

1. docker-compose、dockerfile、gemfile、gemfile.lockを用意する
2. docker-compose run web rails new . --no-deps --css tailwind -d mysql -f
3. docker-compose build (コンテナイメージを再ビルド)
4. database.ymlを更新
5. docker-compose run web rails db:create
6. docker-compose up -d

## tailwindの自動ビルド
docker-compose exec web rails tailwindcss:watch

### 起動中のコンテナへログインしてbashで操作（起動中のコンテナのみ）
docker exec -it web bash

## appで開発

- docker-compose run --rm web rails g scaffold kind name:string
- docker-compose run --rm web rails g scaffold food name:string kind:references price:integer memo:text is_deleted:boolean deleted_at:datetime
- docker-compose run --rm web rails db:migrate

## ransack、kaminariをインストール

- gemにransack、kaminariを追加
- docker-compose exec web bundle install

### kaminariのdefault viewを作成する

- rails g kaminari:views default -e erb

# 参考にしたもの
- https://zenn.dev/yamadanobuhiko/articles/f9e89d69062cac
- https://ryotarch.com/docker/no-matching-manifest-for-linux-arm64-v8-on-m1-mac/
- https://zenn.dev/n04h/scraps/ccb7f7db9ff3d0
- https://qiita.com/tikaranimaru/items/70f87b1fe4b1e7166348
- https://zenn.dev/seuyu_bin/articles/bfdcdc46b36a42

## 問題解決
- https://qiita.com/croquette0212/items/7b99d9339fd773ddf20b

# Rails7
- https://qiita.com/tikaranimaru/items/f83e04aab35c51c46c09
