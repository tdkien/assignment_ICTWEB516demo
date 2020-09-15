class ListTaskController < ApplicationController
	 # before_action :find_post, only: [:show, :update, :edit, :destroy]

	def index
		@listTasks = ListTask.all.order("created_at DESC")
	end

	def new
		@listTask = ListTask.new
	end

	def create
		@listTask = ListTask.new(listTask_params)

		if @listTasks.save
			redirect_to @listTasks
		else
			render 'new'
		end
	end

	def show
	end

	def update

		if @listTask.update(listTask_params)
			redirect_to @listTasks
		else
			render 'edit'
		end
	end

	def edit
		@listTask = ListTask.find(params[:id])
	end

	def destroy
		@listTask = ListTask.find(params[:id])
		@listTask.destroy

		redirect_to listTasks_path

	end

	public

	def listTask_params
		params.require(:listTask).permit(:title, :content)
	end

	# def find_post
	# 	@post = Post.find(params[:id])
	# end

end
