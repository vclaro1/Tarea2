class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :nombre
      t.string :apellido
      t.string :twitter

      t.timestamps null: false
    end
  end
end
