class AddResolveTimeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :resolvetime, :datetime
  end
end
