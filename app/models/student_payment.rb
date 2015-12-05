class StudentPayment < ActiveRecord::Base
  belongs_to :student

  validates :payment_deadline, presence: true
end 
