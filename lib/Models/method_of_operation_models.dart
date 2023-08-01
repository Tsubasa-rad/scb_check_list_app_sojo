class MethodOfOperationModel {
  final String title, detaileText;
  final int number;

  MethodOfOperationModel({
    required this.title,
    required this.detaileText,
    required this.number,
  });
}

List operationModel = [
  MethodOfOperationModel(
    number: 1,
    title: "アカウントを作成する必要がありますか？",
    detaileText:
        "いいえ、アカウントを作成する必要は、現在のバージョンでは、必要ではありません。今後のアップデートで、アカウントを作成することで、あなたのデータをバックアップなどをすることができます。",
  ),
  MethodOfOperationModel(
    number: 2,
    title: "データが同期されない場合、どうすればいいですか？",
    detaileText: """データの同期に問題がある場合、以下の手順を試してみてください。
アプリを再起動してみてください。
デバイスの設定でローカルデータ、ローカルデータへのアクセスが有効になっていることを確認してください。""",
  ),
  MethodOfOperationModel(
    number: 3,
    title: "SCBチェックリストのやり方を教えてください",
    detaileText: """SCBチェックリストのページへ行ってもらって、右下の＋ボタンを押してもらう
タイトルの設定画面に移るので、プロジェクト名を入力してください
入力が終わり、確定するとアンケートが開始します。
あとは、アンケートに従って答えていってください。
わからない場合は、右下の 詳細 ボタンを押してもらうと質問の具体的な説明が出てきます。
""",
  ),
];
