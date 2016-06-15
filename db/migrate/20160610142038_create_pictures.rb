class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :Subject
      t.string :Comment
      t.string :Date
      t.string :image_url
      

      t.timestamps null: false
    end
  end
end
