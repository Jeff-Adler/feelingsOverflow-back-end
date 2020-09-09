class UserSerializer < ActiveModel::Serializer
  # May need to remove :id 
  attributes :id, :username, :password, :birthdate, :gender, :location
end
