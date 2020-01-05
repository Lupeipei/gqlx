class CreateAllTables < ActiveRecord::Migration[5.2]
  def change
    create_table :works, force: :cascade do |t|
      t.string :title
      t.string :dynasty
      t.string :author
      t.string :prelude
      t.text :content, default: [], array: true
      t.string :translate, default: [], array: true
      t.string :translate_res, default: [], array: true
      t.string :notes, default: [], array: true
      t.string :type
      t.string :category
      t.timestamps
    end

    create_table :entries do |t|
      t.text :content
      t.belongs_to :work
      t.timestamps
    end

    create_table :plants do |t|
      t.string :fragment
      t.belongs_to :work
      t.timestamps
    end

    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false

      ## more details
      t.string :nickname
      t.string :avatar
      t.string :type
      t.boolean :superadmin, default: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true

    create_table :suggestions do |t|
      t.string :email
      t.text :comments
      t.belongs_to :work
      t.belongs_to :user
      t.timestamps
    end

    create_table :flips do |t|
      t.belongs_to :work
      t.belongs_to :user
      t.timestamps
    end
  end
end
