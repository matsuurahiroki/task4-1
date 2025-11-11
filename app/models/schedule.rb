# app/models/schedule.rb
class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_on, :end_on, presence: true
  validates :memo, length: { maximum: 500 }, allow_blank: true
  validate  :end_on_not_before_start_on

  private

  def end_on_not_before_start_on
    return if start_on.blank? || end_on.blank?
    errors.add(:end_on, "は開始日以降にしてください") if end_on < start_on
  end
end
