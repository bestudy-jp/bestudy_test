class HomeController < ApplicationController
  def index
  end

  def genre
  end

  def done
    @user = current_user
  end

  def question
    if params[:id].nil?
      @answer_id = 0
    else
      @answer_id = params[:id]
    end

    if Question.find_by(pre_answer_id: @answer_id).nil?
      redirect_to action: 'lesson', :id => @answer_id
    end
  end

  def lesson
    @answer_id = params[:id]
  end

  def judge
    choices = params[:choices].split(',')
    @messages = []

    answer = Answer.where(id: choices.last.to_i).first
    unless answer
      @messages.push(
        content: 'そんな分野は知りません・・・'
      )
      return
    end
    @self_message = answer.body + '！'
    question_pre = QuestionPreAnswer.where(answer_id: answer.id).shuffle.first
    question = Question.where(id: question_pre.question_id).first if question_pre
    if question
      @messages.push(
        delay: 1000,
        content: question.body,
        selections: question.answers_scheme
      )
    else
      choices.map!(&:to_i)
      lessons = {}
      Answer.where(id: choices).includes(:match_rates).each do |answer|
        answer.match_rates.each do |mr|
          lessons[mr.lesson_id] ||= 0
          lessons[mr.lesson_id] += mr.rate
        end
      end
      lesson_hashes = []
      lessons.keys.each do |lesson_id|
        lesson_hashes.push(id: lesson_id, rate: lessons[lesson_id])
      end
      lesson_hashes.sort! do |a, b|
        a[:rate] <=> b[:rate]
      end
      lesson_hashes.reverse!

      session[:recommended_lesson_ids] = []
      if lesson_hashes.length > 0
        @lessons = []
        lesson_hashes.each do |lesson|
          @lessons.push Lesson.find(lesson[:id])
          session[:recommended_lesson_ids].push(lesson[:id])
        end
      else
        @messages.push(
          content: 'おすすめのレッスンが見つかりませんでした。ごめんね。'
        )
      end
      session[:recommended_lesson_ids] = JSON.generate(session[:recommended_lesson_ids])
    end
    render layout: false
  end
end
