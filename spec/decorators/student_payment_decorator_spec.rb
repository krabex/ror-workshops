require 'rails_helper'

describe StudentPaymentDecorator do
  let(:paid_payment) { create :student_payment, 'payment_deadline': Date.current + 1.day, 'date_of_payment': Date.new(2010,12,24) }
  let(:unpaid_payment) { create :student_payment, 'payment_deadline': Date.current + 1.day }

  describe "#payment_status" do
    describe "when payment is paid" do
      subject { paid_payment.decorate.payment_status }
      it { is_expected.to eq I18n.t('student_payments.state.paid') }
    end

    describe "when payment is unapid" do
      subject { unpaid_payment.decorate.payment_status }
      it { is_expected.to eq I18n.t('student_payments.state.unpaid') }
    end
  end

  describe "#date_of_payment" do
    describe "when payment is paid" do
      subject { paid_payment.decorate.formatted_date_of_payment }
      it { is_expected.to eq "2010-12-24" }
    end

    describe "when payment is unapid" do
      subject { unpaid_payment.decorate.formatted_date_of_payment }
      it { is_expected.to eq "" }
    end
  end
end
