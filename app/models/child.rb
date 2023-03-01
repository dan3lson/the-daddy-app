# frozen_string_literal: true

class Child < ApplicationRecord
  belongs_to :daddy, class_name: :User, foreign_key: :user_id

  validates :first_name, presence: true
  validates :gender, presence: true
  validates :birthdate, presence: true

  enum gender: {male: 0, female: 1}

  def age
    if age_in_years.positive?
      "#{age_in_years} #{"year".pluralize(age_in_years)}"
    elsif age_in_months.positive?
      "#{age_in_months} #{"month".pluralize(age_in_months)}"
    elsif age_in_weeks.positive?
      "#{age_in_weeks} #{"week".pluralize(age_in_weeks)}"
    else
      "#{age_in_days} #{"day".pluralize(age_in_days)}"
    end
  end

  def age_in_days
    days = (age_in_years_raw * 365).floor
    return 0 if days.negative?

    days
  end

  def age_in_months
    age_in_months_raw.floor
  end

  def age_in_weeks
    (age_in_months_raw * Lib::Constants::AVERAGE_WEEKS_IN_MONTH).floor
  end

  def age_in_years
    age_in_years_raw.floor
  end

  private

  def age_in_months_raw
    ((Date.current - birthdate) / Lib::Constants::AVERAGE_DAYS_IN_MONTH)
  end

  def age_in_years_raw
    (age_in_months_raw / 12)
  end
end
