class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :category
      t.text :tags, array: true, default: []
      t.attachment :image

      t.timestamps
    end
  end
end
