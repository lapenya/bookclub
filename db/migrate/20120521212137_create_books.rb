class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.date :published_date
      t.string :url

      t.timestamps
    end
  end
end
