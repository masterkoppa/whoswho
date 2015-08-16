# == Schema Information
#
# Table name: companies
#
#  id   :integer          not null, primary key
#  name :string
#

class Company < ActiveRecord::Base
  has_many :employees
  
end
