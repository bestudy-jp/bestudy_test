class Notification < ActionMailer::Base
  default from: "from@bestudy.jp"

  def purchase(lesson)
    @lesson = lesson
    mail to: "kenji.t.dream@gmail.com", cc: [ 'dolphin.orca@gmail.com', 'cpu.cpu.cpu9@gmail.com' ]
  end
end
