# == Schema Information
#
# Table name: supervisors
#
#  id              :integer          not null, primary key
#  email           :string
#  employees_count :integer
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Supervisor < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
