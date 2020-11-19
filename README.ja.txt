# fpm2_csv

## fpm2_csv とは


Figaro´s Password Manager 2 はパスワードを管理するソフトウェアで GTK2 ベースの GUI を持つソフトウェアです。
Figaro´s Password Manager 2 は fpm2 というパッケージ名で提供されており、 Debian では 9  stretch までパッケージが提供されていました。
以後、 Figaro´s Password Manager 2 と fpm2 呼びます。

このパスワード管理ソフトウェアで管理しているパスワード情報は、 fpm2 からXML 形式でファイルに書き出すことができます。
この XML は、 fpm2 特有の XML スキーマですが、このままインポートできるソフトウェアは皆無です。
そこで、この特有のスキーマに沿った形式のファイルを読み込んで汎用的な CSV 形式に変換する処理系が fpm2_csv です。

fpm2_csv の実体は、XSLT で書かれたスタイルシートです。また、簡単なシェルスクリプトが附属しています。

附属のシェルスクリプトは、この XSLT を使って fpm2 のエクスポートファイルを GNOME Desktop ソフトウェアの一部である コマンドラインツール形式の XSLTプロセッサ xsltproc で処理させるものです。



## 使い方

xsltproc を予めインストールしておきます。

fpm2 からデータベースの内容をエクスポートします。

次の例のように、エクスポートしたファイルを第一引数、出力のCSVファイル名を第二引数にして、 附属の fpm2_csv.sh を実行します。

```
$ sh fpm2_csv.sh /tmp/hkubo_fpm2.xml /tmp/hkubo_fpm2.csv
```

fpm2_csv.xsl は拡張要素など使っていない XSLT ですので他の XSLT の処理系でも動くはずですが、動作確認はしていません。
