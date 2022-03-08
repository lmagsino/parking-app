class ParkingTransactionsController < ApplicationController

  def index
    @parking_transactions = ParkingTransaction.all.order :start_time => :desc
  end

end
