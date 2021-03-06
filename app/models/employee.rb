# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  email      :string
#  full_name  :string
#  nickname   :string
#  url        :string
#  company_id :integer
#

class Employee < ActiveRecord::Base
  include GravatarLinkable
  belongs_to :company
  has_one :user

  delegate :answers, to: :user

  before_save :set_company, :set_url
  
  def name
    nickname? ? nickname : full_name
  end

  private

  def set_company
    unless company = Company.find_by(name: email_domain)
      company = Company.create(name: email_domain)
    end
    self.company = company
  end

  def email_domain
    domain = /.+@(.+)/i.match 'test@gmail.com'
    domain[1].downcase
  end

  # Sets the URL to the email about the gravatar 
  # unless set.
  def set_url
    if self.url.nil?
      self.url = self.gravatar_url
    end
  end
end
