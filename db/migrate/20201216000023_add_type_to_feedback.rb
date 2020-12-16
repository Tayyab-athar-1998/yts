class AddTypeToFeedback < ActiveRecord::Migration[5.1]
  def change
    add_column :feedbacks, :type, :string
  end
end
