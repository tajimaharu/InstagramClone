class CreateInstaclones < ActiveRecord::Migration[6.0]
  def change
    create_table :instaclones do |t|
      t.text :image
      t.text :content
    end
  end
end
