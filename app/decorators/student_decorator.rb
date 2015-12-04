class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def formatted_birthdate(format = '%Y-%m-%d')
    birthdate.nil? ? "" : birthdate.strftime(format)
  end

  def avg_notes(subject_item)
    avg = subject_item_notes.for_subject_item(subject_item).average(:value)
    avg.nil? ? "0.00" :  "%.2f" % avg 
  end
end
