# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* name
楽市楽船

* Ruby version
ruby 2.5.1

* table
usersテーブル
email password created_at updated_at 
メールアドレス、パスワード
profilesテーブル
user_id name city created_at updated_at 
名前、住所
postsテーブル
created_at updated_at title body user_id image
タイトル、本文、画像
tagsテーブル
id name created_at updated_at 
カテゴリー名
favoritesテーブル
post_id user_id created_at updated_at 
post_tag_relationsテーブル
post_id tag_id created_at updated_at 


* pages
トップページ（index)…トップページ　最新の投稿　人気の投稿
商品詳細ページ(show)…カテゴリー選択　→編集・削除
投稿編集フォーム(edit)…　
マイページ(mypage)…プロフィール入力
買う(buypage)…投稿一覧表示　→詳細ページ
売る(sellpage)…新規投稿フォーム　カテゴリー選択
相談する(consult)…チャット画面　一緒に見に行く　査定　陸送　買取　修理　アドバイス　

* controller
index, create, new, edit, show, update, destroy, buypage mypage, buypage, sellpage, consult

* model
User Profile Post Tag Favorite PostsTagRelation

* file_name
rakuichirakusen

