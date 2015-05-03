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
      @messages.push(
        content: 'ごめんなさい、現在鋭意製作中です！'
      )
    end
    render layout: false
  end
end
