class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, { role_ids: [] }, [membro_attributes: [:nome, :cpf, :nome_da_mae, :rg, :cor, :identidade_de_genero, :ano_faculdade]] ) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(user)
    root_path
  end

  rescue_from CanCan::AccessDenied do | exception | 
    flash[:error] = exception.message 
    redirect_to root_url
  end 
end
