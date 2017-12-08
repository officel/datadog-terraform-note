# About Timeboard note

* terraform 0.11.0 まででは TimeBoard しか作れない（ScreenBoard は作れない）
* datadog_timeboard resource の graph block は記述順が作成順になりボード上の順番になる

    * 順序を入れ替えると terraform 上で差分扱いになり、画面上でも入れ替わる

* graph block は外部ファイルにできないので .tf ファイルが肥大化する可能性がある
* DataDog で用意されているインテグレーションダッシュボードやホストダッシュボードを使えばいいと思われる
* 独自のタイムボードは必要になるまで作らないほうが管理しやすい
* 表示期間（show）をコントロールできれば通常の監視運用に使えそうだけども

