# printjob_listener

## what is this ?
レーザカッターの使用ログを監視できるくんを作ろうとした
![fig01](fig01.png)
![fig02](fig02.png)

最低限の要件としては
- いつ使われたか
- 累計何回使われたか（掃除したらリセット）
を記録する

余力次第で通知を出したりできるといいね

ちなみにdigital fabricationの授業課題に提出するつもりでもある


## Reference
trotec speedyシリーズはプリンタとして登録されているため，winAPIから操作できるぽい

javaでも簡単に操作できるらしいのでprocessingでちゃちゃっと確認してみた
- [パッケージ javax.print](https://docs.oracle.com/javase/jp/8/docs/api/javax/print/package-summary.html)
- [コード付きの解説（さわりだけ）](https://www.eeb.co.jp/wordpress/?p=376)
