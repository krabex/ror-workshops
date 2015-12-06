require 'spec_helper'

feature 'User visits student payments page'  do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Kowalski' }
  let!(:payment) { create :student_payment, 
    student: student,
    payment_deadline: Date.current, 
    date_of_payment: Date.current - 10.days,
    amount: 80
  }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit student_payments_path
  end

  scenario 'should see student payments list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Kowalski'
    expect(page).to have_content '80'
    expect(page).to have_content 'Paid'
  end

  scenario 'only when sign in' do
    logout
    visit students_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
