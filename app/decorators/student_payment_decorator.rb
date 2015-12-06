class StudentPaymentDecorator < BaseDecorator
  def payment_status
    date_of_payment.nil? ? I18n.t('student_payments.state.unpaid') : I18n.t('student_payments.state.paid')
  end 

  def formatted_date_of_payment
    date_of_payment.nil? ? "" : date_of_payment.strftime('%Y-%m-%d')
  end
end
