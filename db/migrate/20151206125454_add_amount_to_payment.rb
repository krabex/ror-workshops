class AddAmountToPayment < ActiveRecord::Migration
  def change
    change_table(:student_payments) do |t|
      t.decimal :amount, precision: 8, scale: 2, default: 0
    end
  end
end
