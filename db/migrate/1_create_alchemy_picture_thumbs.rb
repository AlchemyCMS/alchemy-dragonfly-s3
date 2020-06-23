# frozen_string_literal: true

class CreateAlchemyPictureThumbs < ActiveRecord::Migration
  def change
    create_table :alchemy_picture_thumbs do |t|
      t.integer :picture_id, null: false, index: true
      t.string :signature, null: false
      t.text :uid, null: false
    end
    add_foreign_key :alchemy_picture_thumbs, :alchemy_pictures, column: :picture_id
    add_index :alchemy_picture_thumbs, :signature, unique: true
    add_index :alchemy_picture_thumbs, :uid, unique: true
  end
end
