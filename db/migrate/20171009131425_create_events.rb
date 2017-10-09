class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :text
      t.string :status
      t.datetime :datetime
      t.boolean :resolved

      t.timestamps
    end
  end
end
