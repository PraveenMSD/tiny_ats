class CommentsController < ApplicationController

    def show
        @candidate = Candidate.find(params[:candidate_id])
        @comment = @candidate.comments.all
    end

    def index
        @candidate = Candidate.find(params[:candidate_id])
        @comment = @candidate.comments.all
    end

    def create
        @candidate = Candidate.find(params[:candidate_id])
        @comment = @candidate.comments.create(comment_params)
        @comment.save

        respond_to do |format|
            if @comment.save
              format.js
            end
        end
    end

    def destroy
        @candidate = Candidate.find(params[:candidate_id])
        @comment = @candidate.comments.find(params[:id])
        @comment.destroy

        respond_to do |format|
            if @comment.destroy
              format.js
            end
        end

    end

    private


    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end

end