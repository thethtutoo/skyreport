class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :reporter_name
      t.date :created_at

      t.timestamps null: false
  end
      Report.create :name => "Error 1",
      :category => "design", :description => "UI design is not looking good and photo misplaced.",
      :reporter_name => "May Thu" , :created_at => "2017-07-01 00:00:00"


      Report.create :name => "Error 2",
      :category => "function", :description => "Seller cannot log in",
      :reporter_name => "Win Win Htun" , :created_at => "2017-07-07 00:00:00"
    
  end
end
