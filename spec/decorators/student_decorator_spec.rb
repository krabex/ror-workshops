require 'rails_helper'

describe StudentDecorator do
  let(:teacher) { create :teacher, first_name: 'John', last_name: 'Smith' }
  let(:student) { create :student, 'first_name': 'John', last_name: 'Smith', birthdate: nil }
  let(:student_with_birthdate) { create :student, first_name: 'John', last_name: 'Smith', birthdate: Date.new(1990, 11, 24) }
  let(:subject_item) { create :subject_item, teacher: teacher }
  let(:second_subject_item) { create :subject_item }
  let!(:note_1) { create :subject_item_note, value: 5, student: student, subject_item: second_subject_item }
  let!(:note_2) { create :subject_item_note, value: 4, student: student, subject_item: second_subject_item }

  describe "#full_name" do
    subject { student.decorate.full_name }
    it { is_expected.to eq 'John Smith' }
  end

  describe "#formatted_birthdate" do
    describe "default date format" do
      subject { student_with_birthdate.decorate.formatted_birthdate }
      it { is_expected.to eq '1990-11-24' }
    end

    describe "custom date format" do
      subject { student_with_birthdate.decorate.formatted_birthdate("%m-%d-%y") }
      it { is_expected.to eq '11-24-90' }
    end

    describe "when student has empty birthdate" do
      subject { student.decorate.formatted_birthdate }
      it { is_expected.to eq "" }
    end
  end

  describe "#avg_notes" do
    describe "when student doesn't have notes assigned" do
      subject { student.decorate.avg_notes(subject_item) }

      it "returns 0.00" do
        is_expected.to eq '0.00'
      end
    end

    describe 'when student has notes assigned' do
      subject { student.decorate.avg_notes(second_subject_item) }

      it 'calculates avg of student notes' do
        is_expected.to eq '4.50'
      end
    end
  end
end
