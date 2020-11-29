Rails.application.routes.draw do


  get("/", { :controller => "supervisor_authentication", :action => "sign_in_form" })


  # Routes for the Employee resource:

  # CREATE
  post("/insert_employee", { :controller => "employees", :action => "create" })
          
  # READ
  get("/employees", { :controller => "employees", :action => "index" })
  
  get("/employees/:path_id", { :controller => "employees", :action => "show" })
  
  # UPDATE
  
  post("/modify_employee/:path_id", { :controller => "employees", :action => "update" })
  
  # DELETE
  get("/delete_employee/:path_id", { :controller => "employees", :action => "destroy" })

  #------------------------------

  # Routes for the Supervisor account:

  # SIGN UP FORM
  get("/supervisor_sign_up", { :controller => "supervisor_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_supervisor", { :controller => "supervisor_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_supervisor_profile", { :controller => "supervisor_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_supervisor", { :controller => "supervisor_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_supervisor_account", { :controller => "supervisor_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/supervisor_sign_in", { :controller => "supervisor_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/supervisor_verify_credentials", { :controller => "supervisor_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/supervisor_sign_out", { :controller => "supervisor_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
