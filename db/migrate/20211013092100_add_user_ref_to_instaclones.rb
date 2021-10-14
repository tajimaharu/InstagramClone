class AddUserRefToInstaclones < ActiveRecord::Migration[6.0]
  def change
    add_reference :instaclones, :user, null: false, foreign_key: true
  end
end
