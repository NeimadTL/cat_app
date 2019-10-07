class CollaborationsController < ApplicationController

  def new
    @collaboration = Collaboration.new
  end

  def create
    @collaboration = Collaboration.new(collaboration_params.merge(task_id: params[:task_id]))
    new_collaborator = User.find(collaboration_params[:user_id])
    puts "new_collaborator --> #{new_collaborator.inspect}"
    current_user.add_collaborator(new_collaborator)
    respond_to do |format|
      if @collaboration.save
        format.html { redirect_to tasks_path, notice: 'collaborator was successfully added.' }
        format.json { render :show, status: :created, location: @collaboration }
      else
        format.html { render :new }
        format.json { render json: @collaboration.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def collaboration_params
      params.require(:collaboration).permit(:user_id)
    end
end
