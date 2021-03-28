# frozen_string_literal: true

class CreateSpinaInquiriesTable < ActiveRecord::Migration[4.2]
  def change
    create_table :spina_inquiries do |t|
      t.boolean :read, default: false
      t.boolean :spam, default: false
      t.string :email
      t.string :name
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
