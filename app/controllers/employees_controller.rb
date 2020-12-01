class EmployeesController < ApplicationController
  def index
    matching_employees = Employee.all

    @list_of_employees = matching_employees.order({ :created_at => :desc })

    render({ :template => "employees/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_employees = Employee.where({ :id => the_id })

    @the_employee = matching_employees.at(0)

    render({ :template => "employees/show.html.erb" })
  end

  def create
    the_employee = Employee.new
    the_employee.supervisor_id = session.fetch(:supervisor_id) # params.fetch("query_supervisor_id")
    the_employee.first_name = params.fetch("query_first_name")
    the_employee.last_name = params.fetch("query_last_name")
    the_employee.major = params.fetch("query_major")
    the_employee.minor = params.fetch("query_minor")

    if the_employee.valid?
      the_employee.save
      redirect_to("/employees", { :notice => "Employee created successfully." })
    else
      redirect_to("/employees", { :notice => "Employee failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_employee = Employee.where({ :id => the_id }).at(0)

    the_employee.supervisor_id = session.fetch(:supervisor_id) # params.fetch("query_supervisor_id")
    the_employee.first_name = params.fetch("query_first_name")
    the_employee.last_name = params.fetch("query_last_name")
    the_employee.major = params.fetch("query_major")
    the_employee.minor = params.fetch("query_minor")

    if the_employee.valid?
      the_employee.save
      redirect_to("/employees/#{the_employee.id}", { :notice => "Employee updated successfully."} )
    else
      redirect_to("/employees/#{the_employee.id}", { :alert => "Employee failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_employee = Employee.where({ :id => the_id }).at(0)

    the_employee.destroy

    redirect_to("/employees", { :notice => "Employee deleted successfully."} )
  end
end
