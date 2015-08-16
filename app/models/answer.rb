# == Schema Information
#
# Table name: answers
#
#  id        :integer          not null, primary key
#  correct   :boolean
#  user_id   :integer
#  target_id :integer
#

class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, class_name: "Employee"
  
end
