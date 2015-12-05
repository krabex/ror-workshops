class CreateStudentPayment < ActiveRecord::Migration
  def change
    create_table :student_payments do |t|
      t.date :date_of_payment
      t.date :payment_deadline, null: false
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
