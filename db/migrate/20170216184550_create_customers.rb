class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :mobile 
      t.string :email
      t.text   :address
      t.string :city
      t.string :pincode
      t.boolean :cibil_report
      t.string :cibil_score
      t.string :good_time_to_call
      t.string :remarks



      t.timestamps null: false
    end
  end
end
