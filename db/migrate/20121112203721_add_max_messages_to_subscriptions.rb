class AddMaxMessagesToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :max_messages, :integer
  end
end
