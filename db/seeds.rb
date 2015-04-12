# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

q = Question.create({pre_answer_id: 0, body: "学びたいジャンルを選んでください"})
proguram = Answer.create({question_id: q.id, body: "プログラミング"})
Answer.create({question_id: q.id, body: "英語"})
Answer.create({question_id: q.id, body: "ビジネス"})

q1 = Question.create({pre_answer_id: proguram.id , body: "プログラミングをしたことがありますか"})
qa1 = Answer.create({question_id: q1.id, body: "未経験"})
qa2 = Answer.create({question_id: q1.id, body: "分岐・繰り返し・関数くらいは理解している"})
qa3 = Answer.create({question_id: q1.id, body: "何かものが作れる"})
qa4 = Answer.create({question_id: q1.id, body: "オブジェクト指向を理解している"})

q2 = Question.create({pre_answer_id: qa1.id, body: "作りたいものは決まってますか？"})
a0 = Answer.create({question_id: q2.id, body: "特にない"})
a1 = Answer.create({question_id: q2.id, body: "ショッピングサイトやSNSのような「Webサービス」"})
a2 = Answer.create({question_id: q2.id, body: "地図を使ったりカメラを使う「スマホアプリ」"})
a3 = Answer.create({question_id: q2.id, body: "スマホでできるシューティングやRPGのような「スマホゲーム」"})
a4 = Answer.create({question_id: q2.id, body: "PCでできるシューティングやRPGのような「PCゲーム」"})
a5 = Answer.create({question_id: q2.id, body: "インターネット上から自動で情報を集めてくれる「収集ツール」"})
a6 = Answer.create({question_id: q2.id, body: "天気情報から場所ごとの傾向を調べてくれる「分析ツール」"})
a7 = Answer.create({question_id: q2.id, body: "迷路を解いたり、将棋やトランプの相手をしてくれる「人工知能」"})


l_r = Lesson.create(title: "Rで覚えるプログラミング")
MatchRate.create(answer_id: a6.id , lesson_id: l_r.id ,rate: 1)

l_python = Lesson.create(title: "Pythonで覚えるプログラミング")
MatchRate.create(answer_id: a1.id, lesson_id: l_python.id ,rate: 1)
MatchRate.create(answer_id: a6.id, lesson_id: l_python.id ,rate: 1)

l_ruby = Lesson.create(title: "Rubyで覚えるプログラミング")
MatchRate.create(answer_id: a1.id, lesson_id: l_ruby.id ,rate: 1)
MatchRate.create(answer_id: a5.id, lesson_id: l_ruby.id ,rate: 1)
MatchRate.create(answer_id: a7.id, lesson_id: l_ruby.id ,rate: 1)

l_php = Lesson.create(title: "PHPで覚えるプログラミング")
MatchRate.create(answer_id: a1.id, lesson_id: l_php.id ,rate: 1)

l_objc = Lesson.create(title: "Objective-Cで覚えるプログラミング")
MatchRate.create(answer_id: a2.id, lesson_id: l_objc.id ,rate: 1)
MatchRate.create(answer_id: a3.id, lesson_id: l_objc.id ,rate: 1)

l_swift = Lesson.create(title: "Swiftで覚えるプログラミング")
MatchRate.create(answer_id: a2.id, lesson_id: l_swift.id ,rate: 1)
MatchRate.create(answer_id: a3.id, lesson_id: l_swift.id ,rate: 1)

l_ajava = Lesson.create(title: "AndroidJavaで覚えるプログラミング")
MatchRate.create(answer_id: a2.id, lesson_id: l_ajava.id ,rate: 1)
MatchRate.create(answer_id: a3.id, lesson_id: l_ajava.id ,rate: 1)

l_unity = Lesson.create(title: "Unityで覚えるプログラミング")
MatchRate.create(answer_id: a3.id, lesson_id: l_unity.id ,rate: 1)
MatchRate.create(answer_id: a4.id, lesson_id: l_unity.id ,rate: 1)

l_cpp = Lesson.create(title: "C++で覚えるプログラミング")
MatchRate.create(answer_id: a3.id, lesson_id: l_cpp.id ,rate: 1)
MatchRate.create(answer_id: a4.id, lesson_id: l_cpp.id ,rate: 1)

l_java = Lesson.create(title: "Javaで覚えるプログラミング")
MatchRate.create(answer_id: a4.id, lesson_id: l_java.id ,rate: 1)
MatchRate.create(answer_id: a5.id, lesson_id: l_java.id ,rate: 1)

l_hsp = Lesson.create(title: "HSPで覚えるプログラミング")
MatchRate.create(answer_id: a4.id, lesson_id: l_hsp.id ,rate: 1)

l_lisp = Lesson.create(title: "Lispで覚えるプログラミング")
MatchRate.create(answer_id: a7.id , lesson_id: l_lisp.id ,rate: 1)











