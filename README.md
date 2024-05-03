
在庫管理システムのためのRails API

## 機能

- 商品情報のCRUD操作
- 在庫情報の取得と更新
- トランザクションの記録と参照
- ユーザー管理（登録、更新、削除）
- 在庫不足時の通知機能

## APIエンドポイント

- `GET /products`: 全商品のリストを取得
- `POST /products`: 新しい商品を登録
- `PUT /products/:id`: 指定の商品を更新
- `DELETE /products/:id`: 指定の商品を削除
