class ParkingTransactionsController < ApplicationController

  def index
    @parking_transactions = ParkingTransaction.all.ordered_by_start_time
  end

end
