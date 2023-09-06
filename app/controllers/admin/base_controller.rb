class Admin::BaseController < ApplicationController
  bofore_action :check_admin
  
  layout 'admin/layouts/application'

  private

  def not_authenticated
    redirect_to admin_login_path, warning: ''
  end

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end
