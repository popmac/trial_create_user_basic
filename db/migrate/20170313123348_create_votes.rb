class CreateVotes < ActiveRecord::Migration[5.0]
  create_table :votes do |t|
    t.references :entry, null: false  # 外部キー
    t.references :member, null: false # 外部キー
    t.timestamps
  end
end
