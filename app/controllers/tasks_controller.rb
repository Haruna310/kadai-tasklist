class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    def index
        @tasks = Task.all
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def edit
    end
    
    def create
     @task = Task.create(task_params)
       if @task.save
        flash[:success] = '投稿されました'
        redirect_to tasks_path
       else 
        flash.now[:danger] = '正常に投稿されませんでした'
        render :new
    end
    end
    
    def update
        if @task.update(task_params)
            flash[:success] = '更新されました'
            redirect_to @task
        else
            flash.now[:danger] = '更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        @task.destroy
        
        flash[:success] = '削除されました'
        redirect_to tasks_url
    end
    
    private
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:content, :status)
    end
end
