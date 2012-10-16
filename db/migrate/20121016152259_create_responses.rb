#encoding: utf-8
class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :name,default: '匿名'
      t.string :email
      t.text :content
      t.integer :article_id

      t.timestamps
    end
  end
end
