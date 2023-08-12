import 'package:flutter/material.dart';

class SCBCheckList {
  final String title;
  final String question;
  final String question2;
  final String detail;
  final List<OptionModel> option;
  bool isLocked;
  OptionModel? selectedOption;
  final Color color;
  final bool text;
  SCBCheckList({
    required this.title,
    required this.question,
    required this.question2,
    required this.detail,
    this.isLocked = false,
    required this.option,
    this.selectedOption,
    required this.color,
    this.text = false,
  });
}

class OptionModel {
  final String optionId;
  final String option;
  final String detail;
  final int point;

  OptionModel({
    required this.optionId,
    required this.option,
    required this.detail,
    this.point = 0,
  });
}

final scbList = [
  SCBCheckList(
    title: "ブローカレス",
    question: "仲介者レス、直接つながることができるか？",
    question2: "",
    detail:
        """想像してみてください。あなたが友達とゲームをするためにインターネットを使っているとします。通常、ゲームをプレイするためには、インターネット上で仲介者（ブローカー）として機能するサーバーが必要です。このサーバーは、あなたと友達の通信を中継し、ゲームの進行や情報のやり取りを制御します。
しかし、ブローカレスなシステムでは、あなたと友達は直接通信することができます。つまり、仲介者（ブローカー）がいなくても、あなたと友達は直接つながることができるのです。
例えば、もしもあなたと友達がお互いのゲームデータを共有したい場合、ブローカレスなシステムでは直接データをやり取りすることができます。これは、あなたが友達にデータを送り、友達も直接それを受け取ることができるということです。仲介者（ブローカー）を通さなくても、お互いに直接情報をやり取りできるのです。
このような仕組みは、分散型ネットワークやブロックチェーンで利用されます。たとえば、仮想通貨の取引を行う場合、ブローカレスなシステムでは、直接相手と取引することができます。お金や情報が第三者を介さずに直接やり取りされるため、より迅速で安全な取引が可能になるのです。
ブローカレスなシステムの利点は、信頼性やセキュリティの向上です。仲介者を介さずに直接つながることで、情報の改ざんや不正な操作を防ぐことができます。また、仲介者に依存せずに直接つながることで、効率的なコミュニケーションやデータの共有が可能になります。
要するに、ブローカレス（仲介者レス）は、人々が直接つながり、情報や価値をやり取りすることができる仕組みです。これにより、より迅速で安全な取引やコミュニケーションが可能になります。""",
    option: [
      OptionModel(
          optionId: "A", option: "サーバ不要（全員がコネクタ）", detail: "ブローカレス", point: 8),
      OptionModel(optionId: "B", option: "一部がサーバ", detail: "ブローカレス", point: 2),
      OptionModel(optionId: "C", option: "サーバが必要", detail: "ブローカレス", point: 1),
    ],
    color: Colors.green,
  ),
  SCBCheckList(
    title: "サーバント",
    question: "サービス利用者がサービス提供者にもなり得るか",
    question2: "ユーザーが利用者と提供者の二つの役割",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "Yes", detail: "ユーザーが利用者と提供者の二つの役割", point: 5),
      OptionModel(
          optionId: "B", option: "No", detail: "ユーザーが利用者と提供者の二つの役割", point: 0),
    ],
    color: Colors.blue,
  ),
  SCBCheckList(
    title: "サーバント",
    question: "サービス利用者がサービス提供者にもなり得るか",
    question2: "既存の資源を活用しているか",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "Yes", detail: "既存の資源を活用しているか", point: 5),
      OptionModel(
          optionId: "B", option: "No", detail: "既存の資源を活用しているか", point: 0),
    ],
    color: Colors.blue,
  ),
  SCBCheckList(
    title: "サーバント",
    question: "サービス利用者がサービス提供者にもなり得るか",
    question2: "ユーザの資源を活用",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "ユーザの資源を活用", point: 5),
      OptionModel(optionId: "B", option: "No", detail: "ユーザの資源を活用", point: 0),
    ],
    color: Colors.blue,
  ),
  SCBCheckList(
    title: "つながりをブランディング",
    question: "つながり・物語・プロセスなどを発信",
    question2: "機能の公開",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "機能の公開", point: 1),
      OptionModel(optionId: "B", option: "No", detail: "機能の公開", point: 0),
    ],
    color: Colors.yellow,
  ),
  SCBCheckList(
    title: "つながりをブランディング",
    question: "つながり・物語・プロセスなどを発信",
    question2: "モノの公開",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "モノの公開", point: 1),
      OptionModel(optionId: "B", option: "No", detail: "モノの公開", point: 0),
    ],
    color: Colors.yellow,
  ),
  SCBCheckList(
    title: "つながりをブランディング",
    question: "つながり・物語・プロセスなどを発信",
    question2: "活動の公開",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "活動の公開", point: 2),
      OptionModel(optionId: "B", option: "No", detail: "活動の公開", point: 0),
    ],
    color: Colors.yellow,
  ),
  SCBCheckList(
    title: "つながりをブランディング",
    question: "つながり・物語・プロセスなどを発信",
    question2: "概念(コンセプト)の公開",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "Yes", detail: "概念(コンセプト)の公開", point: 3),
      OptionModel(
          optionId: "B", option: "No", detail: "概念(コンセプト)の公開", point: 0),
    ],
    color: Colors.yellow,
  ),
  SCBCheckList(
    title: "つながりをブランディング",
    question: "つながり・物語・プロセスなどを発信",
    question2: "つながりの公開",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "つながりの公開", point: 5),
      OptionModel(optionId: "B", option: "No", detail: "つながりの公開", point: 0),
    ],
    color: Colors.yellow,
  ),
  SCBCheckList(
    title: "マネタイズ化(セミピュア)",
    question: "利用者・提供者・運営者が存在するか",
    question2: "",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "Yes", detail: "利用者・提供者・運営者が存在するか", point: 5),
      OptionModel(
          optionId: "B", option: "No", detail: "利用者・提供者・運営者が存在するか", point: 0),
    ],
    color: Colors.orange,
  ),
  SCBCheckList(
    title: "マネタイズ化(セミピュア)",
    question: "利益配分(WIN-WIN)インセンティブ",
    question2: "",
    detail: "",
    option: [
      OptionModel(
          optionId: "A",
          option: "Yes",
          detail: "利益配分(WIN-WIN)インセンティブ",
          point: 5),
      OptionModel(
          optionId: "B",
          option: "No",
          detail: "利益配分(WIN-WIN)インセンティブ",
          point: 0),
    ],
    color: Colors.orange,
  ),
  SCBCheckList(
    title: "マネタイズ化(セミピュア)",
    question: "認証・課金機能・販売：トラスト",
    question2: "",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "Yes", detail: "認証・課金機能・販売：トラスト", point: 5),
      OptionModel(
          optionId: "B", option: "No", detail: "認証・課金機能・販売：トラスト", point: 0),
    ],
    color: Colors.orange,
  ),
  SCBCheckList(
    title: "新結合",
    question: "すでにあるユーザ資源(新しいつながりによる新しい価値観)",
    question2: "",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "単一分野・同業種内の融合", detail: "", point: 5),
      OptionModel(optionId: "B", option: "異分野・異業種間の融合", detail: "", point: 8),
    ],
    color: Colors.pink,
  ),
  SCBCheckList(
    title: "新結合",
    question: "すでにあるユーザ資源(新しいつながりによる新しい価値観)",
    question2: "",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "既知(よく知られた分野・存在)", detail: "", point: 5),
      OptionModel(
          optionId: "B", option: "未知（あまり知られていない分野・存在)", detail: "", point: 3),
    ],
    color: Colors.pink,
  ),
  SCBCheckList(
    title: "仮想化",
    question: "地域創生・地域活性化に役立つすべての資源",
    question2:
        "⚫︎専門分野から\n⚫︎成功・成長分野から\n⚫︎よく知られた分野から\n⚫︎日常(当然のこと)/非日常から\n⚫︎常識/非常識から\n",
    detail: "",
    option: [
      OptionModel(
          optionId: "A",
          option: "Yes",
          detail: "地域創生・地域活性化に役立つすべての資源",
          point: 2),
      OptionModel(
          optionId: "B",
          option: "No",
          detail: "地域創生・地域活性化に役立つすべての資源",
          point: 0),
    ],
    color: Colors.teal,
  ),
  SCBCheckList(
    title: "仮想化",
    question: "カプセル化",
    question2: "カプセル化とは隠蔽化、抽象化のこと(それぞれの地域資源に関し、何を見せて、何を見せないかを設計しているか？",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "カプセル化", point: 2),
      OptionModel(optionId: "B", option: "No", detail: "カプセル化", point: 0),
    ],
    color: Colors.teal,
  ),
  SCBCheckList(
    title: "仮想化",
    question: "インターフェース化",
    question2: "",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "インターフェース化", point: 2),
      OptionModel(optionId: "B", option: "No", detail: "インターフェース化", point: 0),
    ],
    color: Colors.teal,
  ),
  SCBCheckList(
    title: "体系化",
    question: "つながる方法がどのような形で繋がっているか？",
    question2: "",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "クライアントサーバモデル(配信型)", detail: "体系化", point: 1),
      OptionModel(
          optionId: "B", option: "クライアントサーバモデル(探索型)", detail: "体系化", point: 1),
      OptionModel(optionId: "C", option: "ハイブリット型", detail: "体系化", point: 3),
      OptionModel(optionId: "D", option: "ピュア型", detail: "体系化", point: 2),
      OptionModel(optionId: "E", option: "セミピュア型", detail: "体系化", point: 5),
    ],
    color: Colors.indigo,
  ),
  SCBCheckList(
    title: "体系化",
    question: "つながる方法がどのような形で繋がっているか？",
    question2: "芋づる式(同時参加モデル)",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "Yes", detail: "芋づる式(同時参加モデル)", point: 5),
      OptionModel(
          optionId: "B", option: "No", detail: "芋づる式(同時参加モデル)", point: 0),
    ],
    color: Colors.indigo,
  ),
  SCBCheckList(
    title: "可視化",
    question: "課題解決活動の共通基盤",
    question2: "プラットフォーム構築",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "プラットフォーム構築", point: 5),
      OptionModel(optionId: "B", option: "No", detail: "プラットフォーム構築", point: 0),
    ],
    color: Colors.lime,
  ),
  SCBCheckList(
    title: "可視化",
    question: "課題解決活動の共通基盤",
    question2: "プラットフォームの役割の明確化",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "Yes", detail: "プラットフォームの役割の明確化", point: 2),
      OptionModel(
          optionId: "B", option: "No", detail: "プラットフォームの役割の明確化", point: 0),
    ],
    color: Colors.lime,
  ),
  SCBCheckList(
    title: "可視化",
    question: "課題解決活動の共通基盤",
    question2: "プラットフォーム運営のインセンティブ",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "Yes", detail: "プラットフォーム運営のインセンティブ", point: 2),
      OptionModel(
          optionId: "B", option: "No", detail: "プラットフォーム運営のインセンティブ", point: 0),
    ],
    color: Colors.lime,
  ),
  SCBCheckList(
    title: "可視化",
    question: "課題解決活動の共通基盤",
    question2: "プラットフォームのトラスト",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "Yes", detail: "プラットフォームのトラスト", point: 2),
      OptionModel(
          optionId: "B", option: "No", detail: "プラットフォームのトラスト", point: 0),
    ],
    color: Colors.lime,
  ),
  SCBCheckList(
    title: "持続性",
    question: "サービス提供者が存在しないほど持続性が高い",
    question2: "",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "高い", detail: "持続性", point: 2),
      OptionModel(optionId: "B", option: "低い", detail: "持続性", point: 1),
    ],
    color: Colors.amberAccent,
  ),
  SCBCheckList(
    title: "再現性・汎用性",
    question: "一過性の抑止",
    question2: "サービスが異なる場所で用いられ、異なる分野に応用させる仕組み（理論化、メソッド化、部品化）となっているか？",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "高い", detail: "再現性・汎用性", point: 2),
      OptionModel(optionId: "B", option: "低い", detail: "再現性・汎用性", point: 1),
    ],
    color: Colors.teal,
  ),
  SCBCheckList(
    title: "サービスのコスト・リスク",
    question: "サービスを持続できるコスト構造となっているか？ スケラビリティの問題に起因する投資リスクを有していないか？",
    question2: "",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "高い", detail: "サービスのコスト・リスク", point: 1),
      OptionModel(
          optionId: "B", option: "低い", detail: "サービスのコスト・リスク", point: 2),
    ],
    color: Colors.cyan,
  ),
  SCBCheckList(
    title: "サービスのインセンティブ",
    question: "サービスを利用したい、ピアグループに参加したいというインセンティブが仕組みとして備わっているか？",
    question2: "",
    detail: "",
    option: [
      OptionModel(
          optionId: "A", option: "高い", detail: "サービスのインセンティブ", point: 2),
      OptionModel(
          optionId: "B", option: "低い", detail: "サービスのインセンティブ", point: 1),
    ],
    color: Colors.cyan,
  ),
  SCBCheckList(
    title: "サービスのトラスト",
    question: "ユーザに対してサービスへの参加や利用継続を判断させるに足りる信用や安心間を提供できているか？",
    question2: "",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "高い", detail: "サービスのトラスト", point: 2),
      OptionModel(optionId: "B", option: "低い", detail: "サービスのトラスト", point: 1),
    ],
    color: Colors.cyan,
  ),
];
