class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def new
    @tag_list = Tag.all
    @questions = current_user.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)
    tag_list = params[:question][:tag].split(nil)
    if @question.save
      @question.save_tag(tag_list)
      redirect_to root_path, notice: '投稿しました'
    else
      render :new, alert: '投稿に失敗しました'
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :answer)
  end
end
