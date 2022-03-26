# email:string
# password_digest:string # This will be automatically filled by the has_secure_password method within the password/password_confirmation values
#
# password:string (virtual)
# password_confirmation:string (virtual)

class User < ApplicationRecord
  # has_secure_password is a rails method that will add the virtual fields password and password_confirmation to process the entered passwrod and fill the real field password_digest with an encrypted version of the string we assigned to the password/password_confirmation fields
  # has_secure_password requires the gem "bcrypt"
  has_secure_password

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
end
