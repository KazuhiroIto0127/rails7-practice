# rails7-practice

1. docker-compose、dockerfile、gemfile、gemfile.lockを用意する
2. docker-compose build
3. docker-compose run --rm web bundle exec rails _7.0.3_ new . -d mysql -f
4. マルチステージビルドを利用。Dockerfileを更新して、entrypointを追加。
5. docker-compose build (コンテナイメージを再ビルド)

# 参考にしたもの
https://zenn.dev/yamadanobuhiko/articles/f9e89d69062cac
https://ryotarch.com/docker/no-matching-manifest-for-linux-arm64-v8-on-m1-mac/
https://zenn.dev/n04h/scraps/ccb7f7db9ff3d0
