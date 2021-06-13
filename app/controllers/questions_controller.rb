class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to root_path, notice: '投稿しました'
    else
      render :new, alert: '投稿に失敗しました'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :answer, :tag_ids)
  end
end
