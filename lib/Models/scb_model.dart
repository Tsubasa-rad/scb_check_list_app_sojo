
import 'package:flutter/material.dart';

class SCB {
  final String title;
  final List<String> detail;
  final Color color;

  SCB({
    required this.title,
    required this.detail,
    required this.color,
  });
}

final scb = [
  SCB(
    title: "地域活性化プラットフォームの導入",
    detail: [
      "地域課題解決や地域活動を効率的に行うために、プラットフォームとアプリケーションに分けます。",
      "プラットフォームは共通の部分で、アプリケーションは地域ごとの特徴や個別の活動です。",
    ],
    color: Colors.red
  ),
  SCB(
    title: "P2P技術によるプラットフォーム構築",
    detail: [
      "プラットフォームを構築するために、ブローカレス理論やSIONet（シオネット）と呼ばれるP2P技術を使います。",
      "P2P技術は持続的で安定したネットワークを作る方法の一つです。",
    ],
    color: Colors.yellow
  ),
  SCB(
    title: "地域資源の仮想化（ピア化）",
    detail: [
      "地域の資源をピアとして仮想化し、結びつけます。",
      "オブジェクト指向設計法を使って、地域の資源を効果的に組み合わせることができます。",
    ],
    color: Colors.cyanAccent
  ),
  SCB(
    title:
        "地域コミュニティブランドは、地域の持続的な発展や活気づくためのアプローチです。ICTの考え方を取り入れつつ、地域の特徴や課題に合わせて取り組むことが重要です。これを活用することで、地域の魅力やビジネスの創出が期待できます。",
    detail: [],
    color: Colors.purple
  ),
];
