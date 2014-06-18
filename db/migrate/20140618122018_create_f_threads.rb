class CreateFThreads < ActiveRecord::Migration
  def change
    create_table :f_threads do |t|
      t.string :subject
      t.datetime :date
      t.references :sub_category, index: true

      t.timestamps
    end
  end
end
