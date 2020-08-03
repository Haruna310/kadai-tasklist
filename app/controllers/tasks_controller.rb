class TasksController < ApplicationController
before_action :require_user_logged_in
before_action :correct_user, only: [:destroy]

def index
        @tasks = Task.all
    end
    
    def show
        @task = Task.find(params[:id])  
    end
    
    def new
        @task = Task.new
    end
    
    def edit
       @task = Task.find(params[:id])
    end
    
    def create
     @task = current_user.tasks.build(task_params)
       if @task.save
        flash[:success] = '投稿されました'
        redirect_to @task
       else 
           @tasks = current_user.tasks.order(id: :desc)
        flash.now[:danger] = '正常に投稿されませんでした'
        render :new
     end
    end
    
    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            flash[:success] = '更新されました'
            redirect_to tasks_path
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
    
    
    def task_params
        params.require(:task).permit(:content, :status)
    end
    
    def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
   end
end
