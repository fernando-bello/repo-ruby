class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end

    # Garante no banco que não existam dois usuários com o mesmo e-mail
    add_index :users, :email, unique: true
  end
end
