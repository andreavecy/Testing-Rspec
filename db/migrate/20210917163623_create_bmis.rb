class CreateBmis < ActiveRecord::Migration[6.0]
  def change
    create_table :bmis do |t|
      t.float    :mass
      t.float    :height
      t.references :user
      t.timestamps
    end
  end
end
