class TasksController < ApplicationController

	def create
		@listTask = ListTask.find(params[:listTask_id])
	 	@task = @listTask.tasks.create(params[:task].permit(:name, :comment))
		redirect_to listTask_path(@listTask)	
	end

	def destroy
		@listTask = ListTask.find(params[:listTask_id])
		@task = @listTask.tasks.find(params[:id])
		@task.destroy
		redirect_to listTask_path(@task)
	end
end
