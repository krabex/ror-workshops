class AddBirthdayToStudent < ActiveRecord::Migration
  def change
    change_table(:students) do |t|
      t.datetime :birthdate
    end
  end
end
