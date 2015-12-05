class StudentPaymentsController < ApplicationController
  expose(:student_payments) { StudentPayment.includes(:student)  }

  def index
  end
end
