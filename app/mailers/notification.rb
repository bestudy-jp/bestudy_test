class Notification < ActionMailer::Base
  default from: "from@bestudy.jp"

  def purchase(lesson)
    @lesson = lesson
    #mail to: "kenji.t.dream@gmail.com"
    mail to: "dolphin.orca@gmail.com"
  end
end
