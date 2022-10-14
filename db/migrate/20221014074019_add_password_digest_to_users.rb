class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string            #to column prepei na exei to onoma: password:digest gia na doulepsei to BCrypt
  end
end
