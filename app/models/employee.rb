# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  major         :string
#  minor         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  supervisor_id :integer
#
class Employee < ApplicationRecord
end
