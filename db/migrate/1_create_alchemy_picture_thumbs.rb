# frozen_string_literal: true

class CreateAlchemyPictureThumbs < ActiveRecord::Migration
  def change
    create_table :alchemy_picture_thumbs do |t|
      t.references :picture, foreign_key: { to_table: :alchemy_pictures }, null: false
      t.string :signature, null: false
      t.text :uid, null: false
    end
    add_index :alchemy_picture_thumbs, :signature, unique: true
    add_index :alchemy_picture_thumbs, :uid, unique: true
  end
end
