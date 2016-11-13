class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_global_search_variable

  def set_global_search_variable
    @q = Movie.search(params[:q])
  end

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	  devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end

  helper_method :redirect_back_or_default
  def redirect_back_or_default(default=root_url, options={})
    redirect_to(session.delete(:return_to) || request.referer || default, options)
  end

  helper_method :link_back_or_default
  def link_back_or_default(default=root_url)
    session.delete((:return_to) || request.referer || default)
  end

  def authenticate_aa_user!
    authenticate_user!
    unless current_user.has_role? :admin
      flash[:alert] = 'You are not authorized to access this resource!'
      redirect_to root_path
    end
  end

  # update search query in session store
  def search_params
    if params[:q] == nil
      params[:q] = session['search_key']
    end
    if params[:q]
      session['search_key'] = params[:q]
    end
    params[:q]
  end

  # delete search parameters from the session
  def clear_search_params
    if params[:search_cancel]
      params.delete(:search_cancel)
      unless search_params.nil?
        search_params.each do |key, param|
          search_params[key] = nil
        end
      end
      # remove from session
      session.delete('search_key')

    end
  end

end
