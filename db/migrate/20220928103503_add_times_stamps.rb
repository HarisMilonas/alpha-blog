class AddTimesStamps < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :isgood, :string
  end
end
