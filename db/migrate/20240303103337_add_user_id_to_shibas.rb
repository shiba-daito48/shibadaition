class AddUserIdToShibas < ActiveRecord::Migration[6.1]
  def change
    add_column :shibas, :user_id, :integer
  end
end
