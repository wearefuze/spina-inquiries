class CreateSpinaClientsTable < ActiveRecord::Migration
  def change
    create_table :spina_clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :service
      t.text :your_goals
      t.text :your_routine
      t.text :your_lifestyle
      t.timestamps
    end
  end
end
