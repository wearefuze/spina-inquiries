class CreateSpinaInquiriesTable < ActiveRecord::Migration[4.2]
  def change
    create_table :spina_inquiries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.boolean :archived, default: false
      t.timestamps
    end
  end
end
