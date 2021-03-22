class CandidatesController < ApplicationController 
    before_action :require_user, except: [:show, :index]
    before_action :set_candidate, only: [:show, :edit, :update, :destroy]
    # before_action :set_job_posting

    def show
        # @job = Job.find(params[:job_id])
        @candidate = Candidate.find(params[:id])
    end

    def index
        # @job = Job.find(params[:job_id])
        # @job = Job.find(params[:job_id])

        @candidates = Candidate.all
    end

    def new
        @candidate = Candidate.new
    end

    # def new
    #     # @job = Job.find(params[:job_id])
    #     @candidate = Candidate.new
    # end

    def create
        # @job = Job.find(params[:job_id])
        @candidate = Candidate.create(strong_params)
        if @candidate.save
            flash[:notice] = "Candidate created successfully"
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        @candidate = Candidate.find(params[:id])
    end

    def update
        if @candidate.update(strong_params)
            flash[:notice] = "Candidate updated successfully"
            redirect_to job_candidates_path
        else
            render 'edit'
        end
    end

    def destroy
        @candidate = Candidates.find(params[:id])
        redirect_to job_candidates_path
    end


    private

    def strong_params
        params.require(:candidate).permit(:name, :phone, :email, :skill, :work_experience, :ctc, :notice_period, :job_id)
    end

    def set_candidate
        @candidate = Candidate.find(params[:id])
    end

    # def candidate_params
    #     strong_params.merge( job_id: @job_posting.id.to_s )
    # end

    # def set_job_posting
    #     @job_posting = Job.find(params[:job_id])
    # end


end