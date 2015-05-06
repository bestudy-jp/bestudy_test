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
    choices = params[:choices].split(',').map(&:to_i)
    answers = Answer.where(id: choices)
    done_question_ids = []
    target = nil
    answers.each do |ans|
      done_question_ids.push ans.question.id
      target = ans.target if ans.question.selection?
    end
    @choice = choices.last
    @messages = []

    answer = Answer.where(id: choices.last).first
    unless answer
      @messages.push(
        content: 'そんな分野は知りません・・・',
        delay: 2000
      )
      @not_found = true
      @retry_delay = 4000
      return
    end
    @self_message = answer.body + '！'
    if target
      question = Question.test.where(genre_id: target.target_skills.pluck(:genre_id)).where.not(id: done_question_ids).shuffle.first
    else
      question_pre = QuestionPreAnswer.where(answer_id: answer.id).where.not(question_id: done_question_ids).shuffle.first
      question = Question.where(id: question_pre.question_id).first if question_pre
    end
    if question
      @messages.push(
        delay: 1000,
        content: question.body,
        selections: question.answers_scheme
      )
    else
      choices.map!(&:to_i)
      lessons = {}
      radar_points = Answer.radar_points_from_answer_ids(choices)
      Answer.where(id: choices).each do |answer|
        next unless answer.target
        answer.target.target_skills.each do |ts|
          ts.genre.lesson_skills.each do |ls|
            next if !radar_points[ls.genre.name].nil? && ls.need_point + 1 != radar_points[ls.genre.name]
            lessons[ls.lesson_id] ||= 0
            lessons[ls.lesson_id] += ls.need_point - radar_points[ls.genre.name]
          end
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
          content: 'う〜ん・・・。',
          delay: 3000
        )
        @messages.push(
          content: 'おすすめのレッスンが見つかりませんでした。ごめんね。',
          delay: 7000
        )
        @not_found = true
        @retry_delay = 9000
      end
      session[:recommended_lesson_ids] = JSON.generate(session[:recommended_lesson_ids])
      session[:answer_ids] = JSON.generate(choices)
    end
    render layout: false
  end
end
