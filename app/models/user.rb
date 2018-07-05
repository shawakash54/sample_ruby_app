class User < ApplicationRecord
    before_save {self.email = email.downcase}  #Same as   self.email = self.email.downcase or else just email.downcase!
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum:255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    has_secure_password #has_secure_password automatically adds an authenticate method to 
                        #the corresponding model objects. This method determines if a given password is 
                        #valid for a particular user by computing its digest and comparing the result to 
                        #password_digest in the database
    validates :password, length: {minimum: 6}, presence: true
end
