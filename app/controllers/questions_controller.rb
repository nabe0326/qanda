class QuestionsController < ApplicationController
    # 質問一覧表示
    def index
        @questions = Question.all
    end

    # 質問詳細表示
    def show
        @question = Question.find(params[:id])
    end

    def new
        @question = Question.new
    end

    def edit
        @question = Question.find(params[:id])
    end

    def update
        @question = Question.find(params[:id])
        if @question.update(question_params)
            redirect_to @question
        else
            render "edit" , status: :unprocessable_entity
        end
    end

    def create
        @question = Question.new(question_params)
        if @question.save
            redirect_to @question
        else
            render 'new' , status: :unprocessable_entity
        end
    end

    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to questions_path
    end

    private
    def question_params
        params.require(:question).permit(:title, :name, :content)
    end
end
