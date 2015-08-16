# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  role                   :integer
#  employee_id            :integer
#

class User < ActiveRecord::Base
  include GravatarLinkable
  enum role: [:user, :vip, :admin]
  
  after_initialize :set_default_role, :if => :new_record?
  before_save :set_employee

  belongs_to :employee
  has_many :answers

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def get_coworkers
    all = self.employee.company.employees

    return all.where.not({id: self.employee.id})
  end

  private

  def set_employee
    unless employee = Employee.find_by(email: email)
      employee = Employee.create(email: email, full_name: name, url: gravatar_url)
    end
    self.employee = employee
  end  
end
