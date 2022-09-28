class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
# οριζω το πεδιο title
        t.string :title 
        t.text :description
      t.timestamps
    end
  end
end
