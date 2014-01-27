class CreateMoocs < ActiveRecord::Migration
  def change
    create_table :moocs do |t|
      t.string :name
      t.string :platform
      t.string :provider
      t.string :course_link
      t.string :statement_link
      t.datetime :finish_date

      t.timestamps
    end
  end
end
