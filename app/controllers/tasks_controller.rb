class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end
    
    def show
        @tasks = Task.find(params[:id])
    end
    
    def new
        @task = Task.new
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def show
        @task = Task.find(params[:id])
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
        @task = Task.find(params[:id])
        
        if @task.update(task_params)
            flash[:success] = '更新されました'
            redirect_to @task
        else
            flash.now[:danger] = '更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        flash[:success] = '削除されました'
        redirect_to tasks_url
    end
    
    private
    def task_params
        params.require(:task).permit(:content)
    end
end
