class CandidatesController < ApplicationController 
    before_action :require_user, except: [:show, :index]
    before_action :set_candidate, only: [:show, :edit, :update, :destroy]
    before_action :set_job_posting

    def show
    end

    def index
        # @job = Job.find(params[:job_id])
        @candidates = Candidate.all
    end

    def new
        # @job = Job.find(params[:job_id])
        @candidate = Candidate.new
    end

    def create
        # @job = Job.find(params[:job_id])
        @candidate = Candidate.new(candidate_params)
        if @candidate.save
            flash[:notice] = "Candidate created successfully"
            redirect_to job_candidates_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @candidate.update(candidate_params)
            flash[:notice] = "Candidate updated successfully"
            redirect_to job_candidates_path
        else
            render 'edit'
        end
    end

    def destroy
    end


    private

    def strong_params
        params.require(:candidate).permit(:name, :phone, :email, :skill, :work_experience, :ctc, :notice_period)
    end

    def set_candidate
        @candidate = Candidate.find(params[:id])
    end

    def candidate_params
        strong_params.merge( job_id: @job_posting.id.to_s )
    end

    def set_job_posting
        @job_posting = Job.find(params[:job_id])
    end


end