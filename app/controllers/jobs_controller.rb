class JobsController < ApplicationController 
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]

    def show

    end

    def index
        @jobs = Job.all
        @jobshp = Job.where(priority: "High")
        @jobsmp = Job.where(priority: "Medium")
        @jobslp = Job.where(priority: "Low")
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

    def priority
        @priority = Job.find(params[:id])
      
        # if @status.update_attributes(:status => params[:value])
        if  @priority.update(priority: params[:value])
            flash[:notice] = "Status updated successfully"
        else
            flash[:notice] = "Status updated failed"
        end
        render json: { status: (@priority.priority.to_s) }, status: 200
    end

    private

    def set_job
        @job = Job.find(params[:id])
    end

    def job_params
        params.require(:job).permit(:title, :openings, :applied, :rejected, :remaining, :experience, :selected, :in_progress, :employment_type, :joining_type, :priority)
    end

end