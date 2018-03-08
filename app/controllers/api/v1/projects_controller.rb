class Api::V1::ProjectsController < Api::V1::ApiController

	def index
		@projects = Project.all
		render json: @projects
	end

	def show
		@project = Project.find(params[:id])
		# render json: {
		# 	project: @project,
		# 	client: @project.client.name
		# }

		render json: {
			id: @project.id,
			name: @project.name,
			client: @project.client.name,
			status: @project.status,
			start_date: @project.start_date
		}
		
	end

	def create
		@project = Project.new(project_params) 
		if @project.save
			render json: {
				notice: "Successfully created a project",
				project: @project
			}
		else
			render json: {
				notice: "Invalid parameters",
				errors: @project.errors.full_messages 
			}
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		render json: {
			notice: "Successfully deleted the Project",
			project: @project
		}
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			render json: {
				notice: "Successfully updated project",
				project: @project
			}
		else
			render json: {
				notice: "Invalid parameters",
				errors: @project.errors.full_messages
			}
		end
	end


	private
	def project_params
		params[:project].permit(:name, :client_id, :start_date, :status)
	end
end