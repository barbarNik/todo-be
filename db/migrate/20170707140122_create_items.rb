class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :text
      t.boolean :done,default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
