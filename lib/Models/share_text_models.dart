class ShareTextModel {
  final String title;
  final int number;
  ShareTextModel({
    required this.number,
    required this.title,
  });
}

List shareTextModel = [
  ShareTextModel(number: 0, title: "ベース\n合計得点と評価がわかる"),
  ShareTextModel(number: 1, title: "すべての結果をひと画面でわかる"),
  ShareTextModel(number: 2, title: "両方を合わせたデザイン"),
  ShareTextModel(number: 3, title: "螺旋状に描画されたデザイン"),
];
