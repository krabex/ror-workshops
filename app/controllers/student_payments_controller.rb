class StudentPaymentsController < ApplicationController
  before_action :authenticate_user!

  expose(:student_payments) { StudentPayment.includes(:student)  }

  def index
  end
end
