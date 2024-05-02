class TransactionsController < ApplicationController
    def index
      @transactions = Transaction.all
      render json: @transactions
    end
  
    def create
      @transaction = Transaction.new(transaction_params)
      if @transaction.save
        render json: @transaction, status: :created, location: @transaction
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def transaction_params
      params.require(:transaction).permit(:product_id, :transaction_type, :quantity, :transaction_date, :operator)
    end
  end
  