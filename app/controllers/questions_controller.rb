class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.order(id: 'DESC').page(params[:page]).per(15)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path, notice: '投稿しました'
    else
      render :new, alert: '投稿に失敗しました'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :answer, :tag_ids)
  end
end
