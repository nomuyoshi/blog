class Admin::UsersController < AdminController
  before_action :set_admin_user, only: %i[ show edit update destroy ]

  # GET /admin/users or /admin/users.json
  def index
    @admin_users = Admin::User.all
  end

  # GET /admin/users/1 or /admin/users/1.json
  def show
  end

  # GET /admin/users/1/edit
  def edit
  end

  # PATCH/PUT /admin/users/1 or /admin/users/1.json
  def update
    if @admin_user.update(admin_user_params)
      redirect_to admin_user_url(@admin_user), notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/users/1 or /admin/users/1.json
  def destroy
    @admin_user.destroy

    redirect_to admin_users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = Admin::User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_user_params
      params.require(:admin_user).permit(:email, :crypted_password, :salt)
    end
end
