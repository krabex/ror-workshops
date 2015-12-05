class StudentPaymentsController < ApplicationController
  expose(:students) { Student.includes(:student_payments)  }

  def index
  end
end
