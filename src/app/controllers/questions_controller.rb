class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[show edit update destroy]

  def index
    @questions = Question.order(id: 'DESC').page(params[:page]).per(15)
  end

  def show; end

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

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: '投稿を編集しました'
    else
      render action: :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to user_path(@question.user)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :answer, :tag_ids)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
