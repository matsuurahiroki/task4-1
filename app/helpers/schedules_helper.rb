# app/helpers/schedules_helper.rb
module SchedulesHelper
  def fmt_date(d)
    d.present? ? d.strftime("%Y/%m/%d") : ""
  end

  def fmt_datetime(dt)
    dt.present? ? dt.strftime("%Y/%m/%d %H:%M") : ""
  end

  def mark_all_day(flag)
    flag ? "○" : ""
  end
end
