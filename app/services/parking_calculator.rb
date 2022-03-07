class ParkingCalculator < ApplicationService

  OVERNIGHT_HOUR = 24
  SECONDS_IN_HOUR = 3600



  def initialize parking_transaction
    @parking_transaction = parking_transaction

  end

  def call
    total_hours = get_total_hours

    if !@parking_transaction.returning &&
      (total_hours <= @parking_transaction.flat_rate_duration)

      return @parking_transaction.flat_rate
    end

    whole_day_duration = get_whole_day_duration total_hours
    continuous_duration =
      get_continuous_duration total_hours, whole_day_duration

    get_total_amount whole_day_duration, continuous_duration
  end



  private

  def get_total_hours
    start_time = Time.parse(@parking_transaction.start_time.to_s)
    end_time = Time.parse(@parking_transaction.end_time.to_s)

    total = (end_time - start_time)/SECONDS_IN_HOUR
    total.ceil
  end

  def get_whole_day_duration total_hours
    return 0 if total_hours < OVERNIGHT_HOUR
    total_hours / OVERNIGHT_HOUR
  end

  def get_continuous_duration total_hours, whole_day_duration
    if whole_day_duration == 0
      continuous =
        @parking_transaction.returning ?
          total_hours :
          (total_hours - 3)

    else
      continuous = total_hours % OVERNIGHT_HOUR
    end

    continuous
  end

  def get_total_whole_day_amount duration
    duration * @parking_transaction.whole_day_rate
  end

  def get_total_continuous_amount duration
    duration * @parking_transaction.continuous_rate
  end

  def get_flat_rate whole_day_duration
    return 0 if whole_day_duration > 0 || @parking_transaction.returning
    @parking_transaction.flat_rate
  end

  def get_total_amount whole_day_duration, continuous_duration
    get_total_whole_day_amount(whole_day_duration) +
      get_total_continuous_amount(continuous_duration) +
      get_flat_rate(whole_day_duration)
  end

end

