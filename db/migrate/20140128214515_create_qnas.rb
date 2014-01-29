class CreateQnas < ActiveRecord::Migration
  def change
    create_table :qnas do |t|
      t.text :question
      t.string :answer

      t.timestamps
    end
  end
end
