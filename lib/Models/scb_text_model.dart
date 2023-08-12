import 'package:flutter/material.dart';
import 'package:scb_check_list_app_sojo/Models/scb_check_list_model.dart';

final textScbList = [
  SCBCheckList(
    title: "活動について",
    question: "あなたが行なっている活動は、どのようなものですか？",
    question2: "具体的に説明できますか？",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "", detail: "", point: 0),
    ],
    color: Colors.purple,
    text: true,
  ),
  SCBCheckList(
    title: "P2Pについて",
    question: "活動は、P2Pになっていますか？",
    question2: "ブローカレス、サーバントなど活動が仲介者がいなく資源や繋がりを優先しているものですか？",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "P2Pについて", point: 5),
      OptionModel(optionId: "B", option: "No", detail: "P2Pについて", point: 0),
    ],
    color: Colors.green,
  ),
  SCBCheckList(
    title: "地域資源",
    question: "地域資源を仮想化、体系化、可視化は、できていますか？",
    question2: "",
    detail: "",
    option: [
      OptionModel(optionId: "A", option: "Yes", detail: "地域資源", point: 5),
      OptionModel(optionId: "B", option: "No", detail: "地域資源", point: 0),
    ],
    color: Colors.blue,
  ),
  SCBCheckList(
    title: "地域資源",
    question: "地域資源を仮想化は、具体的にどのようなことを行なっていますか？",
    question2: "",
    detail: "",
    option: [
      OptionModel(optionId: "", option: "", detail: "", point: 0),
    ],
    text: true,
    color: Colors.blue,
  ),
  SCBCheckList(
    title: "地域資源",
    question: "地域資源を可視化は、具体的にどのようなことを行なっていますか？",
    question2: "",
    detail: "",
    option: [
      OptionModel(optionId: "", option: "", detail: "", point: 0),
    ],
    text: true,
    color: Colors.blue,
  ),
  SCBCheckList(
    title: "地域資源",
    question: "地域資源を体系化は、具体的にどのようなことを行なっていますか？",
    question2: "",
    detail: "",
    option: [
      OptionModel(optionId: "", option: "", detail: "", point: 0),
    ],
    text: true,
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
    title: "質問",
    question: "地域イノベーションについて何か質問は、ありますか？",
    question2: "",
    detail: "",
    option: [
      OptionModel(optionId: "", option: "", detail: "", point: 0),
    ],text: true,
    color: Colors.red,
  ),
];
