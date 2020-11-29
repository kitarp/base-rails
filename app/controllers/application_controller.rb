class ApplicationController < ActionController::Base
  before_action(:load_current_supervisor)
  
  # Uncomment this if you want to force supervisors to sign in before any other actions
  # before_action(:force_supervisor_sign_in)
  
  def load_current_supervisor
    the_id = session[:supervisor_id]
    @current_supervisor = Supervisor.where({ :id => the_id }).first
  end
  
  def force_supervisor_sign_in
    if @current_supervisor == nil
      redirect_to("/supervisor_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
