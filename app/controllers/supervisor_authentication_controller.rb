class SupervisorAuthenticationController < ApplicationController
  # Uncomment this if you want to force supervisors to sign in before any other actions
  # skip_before_action(:force_supervisor_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "supervisor_authentication/sign_in.html.erb" })
  end

  def create_cookie
    supervisor = Supervisor.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if supervisor != nil
      are_they_legit = supervisor.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/supervisor_sign_in", { :alert => "Incorrect password." })
      else
        session[:supervisor_id] = supervisor.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/supervisor_sign_in", { :alert => "No supervisor with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "supervisor_authentication/sign_up.html.erb" })
  end

  def create
    @supervisor = Supervisor.new
    @supervisor.email = params.fetch("query_email")
    @supervisor.password = params.fetch("query_password")
    @supervisor.password_confirmation = params.fetch("query_password_confirmation")
    @supervisor.first_name = params.fetch("query_first_name")
    @supervisor.last_name = params.fetch("query_last_name")
    @supervisor.employees_count = params.fetch("query_employees_count")

    save_status = @supervisor.save

    if save_status == true
      session[:supervisor_id] = @supervisor.id
   
      redirect_to("/employees", { :notice => "Supervisor account created successfully."})
    else
      redirect_to("/supervisor_sign_up", { :alert => "Supervisor account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "supervisor_authentication/edit_profile.html.erb" })
  end

  def update
    @supervisor = @current_supervisor
    @supervisor.email = params.fetch("query_email")
    @supervisor.password = params.fetch("query_password")
    @supervisor.password_confirmation = params.fetch("query_password_confirmation")
    @supervisor.first_name = params.fetch("query_first_name")
    @supervisor.last_name = params.fetch("query_last_name")
    @supervisor.employees_count = params.fetch("query_employees_count")
    
    if @supervisor.valid?
      @supervisor.save

      redirect_to("/", { :notice => "Supervisor account updated successfully."})
    else
      render({ :template => "supervisor_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_supervisor.destroy
    reset_session
    
    redirect_to("/", { :notice => "Supervisor account cancelled" })
  end
 
end
