module DateHelper

  def format_date(date)
    Chronic.parse(date.to_s).strftime("%Y-%m-%d")
  end

  def format_datetime(date)
    Chronic.parse("#{format_date(date)} 00:00:00").strftime("%Y-%m-%d %H:%M:%S")
  end

  alias_method :format_start_datetime, :format_datetime
  def format_end_datetime(date)
    Chronic.parse("#{format_date(date)} 23:59:59").strftime("%Y-%m-%d %H:%M:%S")
  end
end
