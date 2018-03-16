class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Clearance::Authentication
  include Pundit
  before_action :require_login
  # after_action :verify_authorized
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :nao_autorizado

  private

    def authenticate(params)
    User.authenticate(params[:session][:email],
                      params[:session][:password])
    end

    def nao_autorizado
      flash[:alert] = "Você não está autorizado a acessar esta página."
      redirect_to(request.referrer || root_path)
    end
  end
  
  