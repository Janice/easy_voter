class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.integer  "user_id"
      t.string   "category1"
      t.string   "product1"
      t.string   "category2"
      t.string   "product2"
      t.string   "category3"
      t.string   "product3"
      t.string   "category4"
      t.string   "product4"
      t.string   "category5"
      t.string   "product5"
      t.string   "category6"
      t.string   "product6"
      t.timestamps
    end
  end
end
