# frozen_string_literal: true

class CreateAlchemyPictureThumbs < ActiveRecord::Migration[5.0]
  def change
    create_table :alchemy_picture_thumbs do |t|
      t.references :picture, null: false, foreign_key: { to_table: :alchemy_pictures }
      t.string :signature, null: false
      t.text :uid, null: false
    end
    add_index :alchemy_picture_thumbs, :signature, unique: true
  end
end
