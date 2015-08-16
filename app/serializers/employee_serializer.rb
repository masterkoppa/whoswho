class EmployeeSerializer < ActiveModel::Serializer
  attributes :name, :email, :url
end