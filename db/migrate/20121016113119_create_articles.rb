#encoding: utf-8
class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :variety
      t.string :title
      t.string :name ,default: '匿名'
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
