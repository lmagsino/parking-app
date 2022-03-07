class ParkingCalculator < ApplicationService

  FLAT_RATE_HOUR = 3



  def initialize parking_transaction, transaction_time
    @parking_transaction = vehicle
    @transaction_time = transaction_time

  end

  def call
    total_hours =
      get_total_hours(parking_transaction.start_time, transaction_time)

    return parking_transaction.flat_rate if total_hours == FLAT_RATE_HOUR

    whole_day_hour = get_whole_day_hour total_hours
    continuous_hour = get_continous_hour total_hours, whole_day_hour


    get_total_whole_day_amount(whole_day_hour) +
      get_total_continuous_amount(continuous_hour)
  end



  private

  def get_total_hours start_time, end_time
    total = (Time.parse(start_time.to_s) - Time.parse((end_time).to_s))/3600
    total.ceil
  end

  def get_whole_day_hour total_hours
    return 0 if total_hours > 24
    total_hours / 24
  end

  def get_continuous_hour whole_day_hour, total_hours
    actual_whole_day_hour = whole_day_hour * 24
    total_hours - a
  end

  def get_total_whole_day_amount whole_day_hour
    whole_day_hour * 5000
  end

  def get_total_continuous_amount continuous_hour
    continuous_hour * @parking_transaction.continuous_rate
  end

end

