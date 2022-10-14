class User < ApplicationRecord
    before_save { self.email = email.downcase }         #pairnei to kathe meil pou paei na apothikeutei kai kanei ola tou ta grammata mikra
    has_many :articles  # one to many association
    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i        #all caps einai constant oxi variable
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGEX }
end 




#Some validations:
# 1. validates :name, length: {minimum: 2, maximum: 10} validates the length 
# 2. validates :points, numerically: true  --> numerically: {only_integer: true}    
# 3. validates :name , :login , :email, presence:true  --> it uses the isblank? method
# 4. validates :name , :login , :email, absence:true  --> the opposite it checks if the field is nil or blank 
# 5 validates :email, uniqueness: true  --> validates that the attribute values is unique.It does not create uniqueness constrain in the database.
