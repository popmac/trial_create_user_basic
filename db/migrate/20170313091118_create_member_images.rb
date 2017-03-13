class CreateMemberImages < ActiveRecord::Migration[5.0]
  def change
    create_table :member_images do |t|
      t.references :member, null: false # 外部キー
      t.binary :data                    # 画像データ
      t.string :content_type            # MIMEタイプ
      t.timestamps
    end
  end
end
