class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.string :looking
      t.string :partnerrole
      t.string :industry
      t.string :aboutfounder
      t.string :aboutbusiness
      t.timestamps

    end
  end
end
