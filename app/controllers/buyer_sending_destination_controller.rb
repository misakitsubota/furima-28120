class BuyerSendingDestinationController < ApplicationController
def index
end

def new
  @buyer_sending_destination = BuyerSendingDestination.new
end

def create
  @buyer_sending_destination = BuyerSendingDestination.new(buyer_params)
  if @buyer_sending_destination.valid?
    @buyer_sending_destination.save
    redirect_to action: :index
  else
    render action: :new
  end
end

private
def buyer_params
  params.requre(:)
