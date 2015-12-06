class StudentPayment < ActiveRecord::Base
  belongs_to :student

  validates :payment_deadline, presence: true

  scope :unpaid, -> () { where('date_of_payment IS ?', nil) }
  scope :paid, -> () { where('date_of_payment IS NOT ?', nil) }
end 
