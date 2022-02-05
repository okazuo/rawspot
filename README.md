# アプリケーション名
rawspot

# 概要
住宅営業のための土地情報共有サービス

# 本番環境
https://rawspot.site/  
### ログイン情報（テスト用）  
・Eメール：test@com  
・パスワード：111aaa  

# 制作背景（意図）
30人程の組織で、住宅営業をしていた時に抱えていた問題がある。それはお客様へ紹介する「土地情報を社員同士で共有したい」ということだ。  
営業マンは世に公開されていない土地情報を、独自に入手しているが、社員同士で共有しない。理由は自分にメリットがなく、しかも面倒だからだ。  
簡単に共有できて、かつメリットがあるサービスが欲しかった。

# DEMO　※掲載している個人名、社名など全て架空のものです※
### トップページ（ログイン前）
・ログインしないと使えません。テストアカウントをお使いください。
[![Image from Gyazo](https://i.gyazo.com/1c855ba2ad5b7fb270107d19a60f34cb.png)](https://gyazo.com/1c855ba2ad5b7fb270107d19a60f34cb)
### トップページ（ログイン後）
・投稿した土地情報が表示される。  
・検索欄で希望エリアや金額等を絞り込めるようにした。  
[![Image from Gyazo](https://i.gyazo.com/b554f5b60988b84a5b7012f55bff6958.jpg)](https://gyazo.com/b554f5b60988b84a5b7012f55bff6958)
### 物件登録画面
・地図を表示したあとに、マーカーを移動させることも可能。  
・投稿する現地写真はプレビューが表示される。  
[![Image from Gyazo](https://i.gyazo.com/07a4ec8b910cfddbe9957ffc317dbeb1.png)](https://gyazo.com/07a4ec8b910cfddbe9957ffc317dbeb1)
### 詳細表示画面
・「FAX情報 確認」ボタンで紙媒体のFAXを確認可能。  
・「お気に入り登録」ボタンで非同期通信のお気に入り登録ができる。  
・「コメント」投稿では携帯アプリのLineのように即時反映されるコメントが残る。  
[![Image from Gyazo](https://i.gyazo.com/c93d2bb5d7793c22631599aa7b598def.jpg)](https://gyazo.com/c93d2bb5d7793c22631599aa7b598def)
### 編集削除画面
・以前の登録内容が入力済みの状態で編集・削除を選択する。
[![Image from Gyazo](https://i.gyazo.com/2df7fe57c200720bd1181d4548e84444.png)](https://gyazo.com/2df7fe57c200720bd1181d4548e84444)
### 契約一覧画面
・物件を誰がいつ投稿したか、また誰が契約したかが一覧で表示される。  
・一覧にはソート機能がついており、任意のタイトル順に並べ替えが可能。  
・タイトル以外を選択すると、対象の物件詳細画面に遷移する。  
[![Image from Gyazo](https://i.gyazo.com/328e335952c46bb25e0a650f79a6eb3e.png)](https://gyazo.com/328e335952c46bb25e0a650f79a6eb3e)
### マイページ画面
・自分のお気に入りと、過去の投稿物件が表示される。
[![Image from Gyazo](https://i.gyazo.com/28fcad3d2222d2ac4516144c44682131.jpg)](https://gyazo.com/28fcad3d2222d2ac4516144c44682131)
# 工夫したポイント
・現実で課題になっていることに取り組んだ。  
・面倒くさがりな営業マンのために、投稿時の必須項目は最低限にして、プルダウンの選択型にした。  
・契約情報が一覧できることで、投稿者を社内で評価することができる。(報酬金を与える等)  
・紙FAXをpdfで投稿できるようにした。  
・googlemapのマーカーを動かせるようにして、現地場所の判別を正確にした。  
・入力途中のEnterキーによる誤送信を防止した。（ログインと一覧検索時は除外）  
・取り扱い不可の物件と契約済みの物件には、その作業者が表示されることで信憑性を高めた。  
・表示画面の大きさが変わってもビューが崩れないようにした。  

# 使用技術（開発環境）
### バックエンド
Ruby, Ruby on Rails
### フロンドエンド
Html, Css, JavaScript
### データベース
MySQL, Sequel Pro
### インフラ
AWS(EC2),Capistrano
### Webサーバ（本番環境）
nginx
### アプリケーションサーバ（本番環境）
unicorn
### ソース管理
GitHub, GitHubDesktop
### テスト
RSpec
### エディタ
VSCode

# 課題や今後実装したい機能
### アプリケーションをSPA化すること
・バックエンドのRailsでJSONデータを返すAPIを提供する。  
・フロントエンドにVue.jsやReact.js等を使用する  

# DB設計
## usersテーブル
| Column           | type   | Options                 |
|------------------|--------|-------------------------|
|name               |string  |null:false              |
|email             |string  |null:false, unique: true |
|encrypted_password|string  |null:false               |
#### association
has_many :orders  
has_many :closes  
has_many :comments  
has_many :favorites, dependent: :destroy  
has_many :spots, through: :favorites  

## spotsテーブル
| Column           | type       | Options                         |
|------------------|------------|---------------------------------|
|price             |integer     |                                 |
|estate_agent      |string      |null:false                       |
|size              |integer     |                                 |
|address           |integer     |null:false                       |
|water_id          |integer     |null:false                       |
|officialmap_id    |integer     |null:false                       |
|transcript_id     |integer     |null:false                       |
|contact_id        |integer     |null:false                       |
|explanation       |text        |                                 |
|latitude          |decimal     |null:false, precision: 9, scale: 6|
|longitude         |decimal     |null:false, precision: 9, scale: 6|
|user              |references  |null:false ,foreign_key: true    |
#### association
belongs_to :user  
has_many_attached :images 
has_one :order  
has_one :close  
has_many :comments  
has_one_attached :faxdate 
has_many :favorites, dependent: :destroy  
has_many :users, through: :favorites  

## ordersテーブル
| Column           | type       | Options                      |
|------------------|------------|------------------------------|
|customer          |string      |null:false                    |
|user              |references  |null:false, foreign_key: true |
|spot              |references  |null:false, foreign_key: true |
#### association
belongs_to :user  
belongs_to :spot  

## closesテーブル
| Column           | type       | Options                      |
|------------------|------------|------------------------------|
|user              |references  |null:false, foreign_key: true |
|spot              |references  |null:false, foreign_key: true |
#### association
belongs_to :user  
belongs_to :spot  

## commentsテーブル
| Column           | type       | Options                      |
|------------------|------------|------------------------------|
|text              |text        |null:false                    |
|user              |references  |null:false, foreign_key: true |
|spot              |references  |null:false, foreign_key: true |
#### association
belongs_to :user  
belongs_to :spot  

## favoritesテーブル
| Column           | type       | Options                      |
|------------------|------------|------------------------------|
|user              |references  |null:false, foreign_key: true |
|spot              |references  |null:false, foreign_key: true |
#### association
belongs_to :user  
belongs_to :spot  
