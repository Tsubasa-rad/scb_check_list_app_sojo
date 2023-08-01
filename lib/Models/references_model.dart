class ReferencesModel {
  final int number;
  final String title, url, date;

  ReferencesModel({
    required this.number,
    required this.title,
    required this.url,
    required this.date,
  });
}

List References = [
  ReferencesModel(
    number: 1,
    title: "新たな価値観が地域を救う, 産経新聞連載(電子版)",
    url: "https://www.sankei.com/article/20200417-NKBM7YGUIFNZXIORQPYDWNAATY/",
    date: "2023/7/20",
  ),
  ReferencesModel(
    number: 2,
    title: "新たな価値観が地域を救う, 産経新聞連載（紙面版)",
    url: "https://scblab.jp/document/112-sankei-column.html",
    date: "2023/7/20",
  ),
];
