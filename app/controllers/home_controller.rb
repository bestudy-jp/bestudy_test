class HomeController < ApplicationController
  def index
  end

  def genre
  end

  def done
    @user = current_user
    params[:genre].each{|k,v|
      GenreUserRelation.create(genre_id: k.to_i, user_id: @user.id)
    }
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
    question = Question.where(pre_answer_id: answer.id).first
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
      lesson_titles = []
      lesson_hashes.each do |lesson|
        break if lesson_titles.length >= 3
        lesson_titles.push Lesson.find(lesson[:id]).title
      end

      if lesson_titles.length > 0
        @messages.push(
          content: 'おすすめのレッスンは、' + lesson_titles.join(', ') + 'です！'
        )
      else
        @messages.push(
          content: 'おすすめのレッスンが見つかりませんでした。ごめんね。'
        )
      end
    end
    render layout: false
  end
end
