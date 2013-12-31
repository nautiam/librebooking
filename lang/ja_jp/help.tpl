{* -*-coding:utf-8-*-
Copyright 2011-2013 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*}
{include file='globalheader.tpl'}
<h1>Booked Scheduler Help</h1>

<div id="help">
<h2>ユーザー登録</h2>

<p>
管理者(あなた)が設定していれば、phpScheduleItを使うためにユーザー登録が必要です。
アカウント登録後はログインできるようになり、許可されているリソースの予約ができるようになります。
</p>

<h2>予約</h2>

<p>
メニューの「スケジュール」の中に、予約状況という項目があります。
ここで予約状況や使用不能な時間を確認することができ、許可されているリソースは予約することができます。
</p>

<h3>エクスプレス</h3>

<p>
予約ページで、予約したいリソースと日時を探してください。
時間枠をクリックすれば予約の詳細を変更することができます。
「作成」ボタンは同じじかんに他の予約があるかどうかをチェックし、問題なければ予約を取り、メールを送信します。
後で予約を確認したりするための照会番号が発行されます。
</p>

<p>予約を変更する場合、かならず保存操作をしてください。そうしないと変更が反映されません。</p>

<p>アプリケーション管理者だけは過去の時間の予約を作成することができます。</p>

<h3>複数のリソース</h3>

<p>
一件の予約で、複数のリソースを一度に確保することができます。
複数のリソースを追加したいときは「別のリソースも」リンクをクリックしリソースを表示させます。
そこで追加したいリソースを選択し「決定」ボタンをクリックします。
</p>

<p>
予約から追加のリソースを外したいときは「別のリソースも」リンクをクリックし、外したいリソースの選択を解除し「決定」をクリックします。
</p>

<p>
追加のリソースは最初のリソースと同じ予約ルールが適用されます。例をあげて説明すると、リソース1(最長3時間まで予約できる)とリソース2(1時間しか予約できない)を2時間予約しようとしても、予約は取れないという意味です。
</p>

<p>リソース名にマウスカーソルを重ねるとリソースの詳細な設定(運用規則)を見ることができます。</p>

<h3>繰り返し</h3>

<p>
様々な方法で予約を繰り返して指定することができます。
いずれの繰り返しでも「～まで(Until)」はその日も期間に含みます。
</p>

<p>
繰り返しのオプションは柔軟な設定ができるようになっており、次のような指定ができます。
「日を単位に」を選び毎「2」日を指定すると、指定日まで1日おきの予約を作成します。
「週を単位に」を選び毎「1」週を指定し、『この曜日に』で 「月 水 金」を選ぶと、指定した日までそれぞれの曜日に予約を作成します。
仮に2011年1月15日の予約を作成しているとします。
繰り返しで「月を単位に」を選び、毎「3」か月、「同じ日付」を選ぶと、3か月ごとの15日に予約を作成します。
「同じ曜日」を選んでいたら、2011年1月15日は1月の第3土曜日ですので、3か月ごとの第3土曜日に予約を作成します。
</p>

<h3>出席者の追加</h3>

<p>
予約を取る際に、他のユーザーを出席者もしくは招待者として登録することが出来ます。
出席者として登録されると、そのユーザーは出席者リストに入り招待メールは送信されませんが、通知メールが送
信されます。
招待者として登録されると、そのユーザーには招待メールが送信され受理するか辞退するかを選んでもらいます。
ユーザーが受理すれば出席者リストに入り、辞退すれば招待者リストから消えます。
</p>

<p>
出席者数の上限は、リソースの定員までです。
</p>

<h3>備品</h3>

<p>
このシステムでいう「備品」とは予約時間中に使用する物品のことと考えてかまいません。
例えば、プロジェクターや椅子です。
予約の備品を追加するには、備品名称の右にあるリンクをクリックします。
そこから使用できる備品の数量を選ぶことできます。
すでに予約されている数量によって、同じ時間に使える数が変わります。
</p>

<h3>代理での予約</h3>

<p>アプリケーション管理者およびグループ管理者は他のユーザーの名義で予約を行うことができます。
予約作成時にユーザー名の右の「変更」リンクをクリックします。</p>

<p>アプリケーション管理者およびグループ管理者は、他のユーザーの予約を変更したり削除することができます。</p>

<h2>予約の更新</h2>

<p>自分で作成した予約は(自分名義のものを含め)、自身で更新することができます。</p>

<h3>繰り返して作成した予約の一部修正</h3>

<p>
予約を作成する際に繰り返しを指定すると、一連の予約が作成されます。
そのような予約を訂正・更新しようとすると、どの予約について変更するのかを尋ねられます。
そのとき表示している予約だけ(「この予約だけ」)を変更し、残りはそのままにしておくことができます。
一連の予約すべて(の未だ過ぎていないもの)を変更することもできます。
その予約から先の分だけに適用を選ぶこともでき、そうすると表示している予約を含めて、その先の予約を変更することになります。
</p>

<p>アプリケーション管理者だけが、過去の予約を変更することができます。</p>

<h2>予約の削除</h2>

<p>予約を削除すると、スケジュールから完全に取り除かれます。phpScheduleItのどこからも見えなくなります</p>

<h3>一連の予約から特定のものを削除する</h3>

<p>予約の更新と同じように削除時にも、どれを消すかを選ぶことができます。</p>

<p>過去の予約を削除することができるのはアプリケーション管理者だけです。</p>

<h2>カレンダーアプリ(Outlook&reg;、iClal、Mozilla Lightning、Evolution)に予約を追加する</h2>

<p>予約の表示、更新の際に「Outlookへ追加」ボタンがあるのが分かると思います。
お使いのコンピューターにOutlookがインストールされていれば、ミーティングを追加するかどうか尋ねられることでしょう。
インストールされていない場合は .iscファイルをダウンロードするかどうか尋ねられることになるでしょう。
これはカレンダーアプリの標準的なフォーマットです。
iCalendarファイル形式をサポートしているアプリケーションで使用できます。</p>

<h2>カレンダーの購読</h2>

<p>スケジュール、リソース、ユーザーのカレンダーを公開することができます。
この機能を有効にするには、管理者が設定ファイル中で購読キーワード(subscription key)を設定しなくてはなりません。
スケジュールまたはリソースのカレンダーを購読できるようにするには、そのスケジュールまたはリソースを管理する際に機能をオンにするだけです。
個人のカレンダーを購読できるようにするには「スケジュール」→「マイカレンダー」を開きます。
ページの右側にカレンダーの購読を「許可する」または「禁止する」というリンクがあります。
</p>

<p>スケジュールのカレンダーを購読するには「スケジュール」→「リソースカレンダー」を開き、 希望のスケジュールを選びます。
ページの右側にカレンダーを購読するリンクがあります。
リソースのカレンダーを購読するのも同じ手順です。
あなたの個人カレンダーを購読するには「スケジュール」→「マイカレンダー」を開きます。
ページの右側に、カレンダーを購読するリンクがあります。
</p>

<h3>カレンダークライアント(Outlook&reg;、iClal、Mozilla Lightning、Evolution)</h3>

<p>たいていは「このカレンダーを購読する」をクリックするだけでカレンダークライアントでの購読が、自動的にセットアップされます。
Outlookでカレンダー購読が自動的に追加されない場合、カレンダービューを開いてください。
マイカレンダー(My Calendars)を右クリックし「カレンダーを追加」→「インターネットから」を選択します。
phpScheduleItの「カレンダーを購読する」リンクの下に表示されているURLをペーストします。
</p>

<h3>Google&reg; Calendar</h3>

<p>Googleカレンダーの設定を開きます。
カレンダータブをクリックします。
「他のカレンダー」をクリックします。
「URLで追加」をクリックします。
phpScheduleItの「カレンダーを購読する」リンクの下に表示されているURLをペーストします。
</p>

<h2>予約量の制限</h2>


<p>管理者は色々な条件を使って、予約できる量を制限することができます。
この制限に違反するような予約には警告が表示され、受理されません。</p>

</div>

{include file='globalfooter.tpl'}