class AdminController < ActionController::Base
  layout = "admin"
  before_action :require_login

  private

  def not_authenticated
    redirect_to admin_login_path, alert: "ログインしてください"
  end
end
