class JobsController < ApplicationController 
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]

    def show

    end

    def index
        @jobs = Job.all
    end

    def new
        @job = Job.new
    end

    def edit

    end

    def create
        @user = current_user
        @job = @user.jobs.create(job_params)
        if @job.save
            flash[:notice] = "Job created successfully"
            redirect_to jobs_path
        else
            render 'new'
        end
    end

    def update
        if @job.update(job_params)
            flash[:notice] = "Job updated successfully"
            redirect_to jobs_path
        else
            render 'new'
        end
    end

    def destroy
        @job.destroy

        redirect_to jobs_path
    end

    private

    def set_job
        @job = Job.find(params[:id])
    end

    def job_params
        params.require(:job).permit(:title, :openings, :applied, :rejected, :remaining, :experience, :selected, :in_progress)
    end

end