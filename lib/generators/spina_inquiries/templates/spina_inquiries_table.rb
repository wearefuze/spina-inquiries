class CreateSpinaInquiriesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_inquiries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.boolean :read, default: false
      t.boolean :spam, default: false

      t.timestamps
    end
  end
end