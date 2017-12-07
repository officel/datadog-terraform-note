# About Monitor note

* 画面とAPIとterraformとで項目の名前に差異があるので、なるべく画面の並び順に合わせて設定を記述する

* query

    * 画面上の edit で表示される形式とは少し異なる（そのままでは使えない）

* Trigger

    * 画面にあるTriggerはquery内の条件を展開したものになる
    * https://docs.datadoghq.com/api/?lang=console#monitor-create

* thresholds

    * 画面上ではokは処理されない？（表示されない）
    * 画面側で弄ると次から terraform がエラーになるので注意（画面側で削除して作り直すことになる）
    * 画面側で弄れないように restrict （オプションとしては locked）にした
    * コンディションの数値は適宜修正

* notify_no_data

    * オートスケーリングなどで削除されるマシンがある時は false にする
    * 削除されたマシンの分のアラートがたくさん飛ぶことになる
    * true にするべきなのは常時起動のマシンの場合

* tags

    * https://www.terraform.io/docs/providers/datadog/r/monitor.html#tags
    * 画面で検索に使用できるらしいけど表示されない？

