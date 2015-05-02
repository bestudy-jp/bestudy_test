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
end
