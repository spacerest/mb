require_relative 'transaction'

class Account

  attr_reader :account_id, :transaction_history, :balance, :account_number
  attr_accessor :account_id, :transaction_history, :balance, :account_number
  
  def initialize(account_id)
    @account_id = account_id
    @id
    @account_number
    @balance = 0
    @transaction_history = []
    @transaction_id = 0
  end

  def member_id(member_id)
    @id = member_id
  end

  def assign_account_number
    @account_number = @id.to_s.rjust(4, "0") + account_id.to_s.rjust(4, "0") 
  end
  
  def check_balance
    @balance
  end
  
  def deposit(amount)
    @transaction_history[@transaction_id] = Transaction.new(@balance, amount)
    @transaction_id += 1
    @balance += amount
  end

  def withdraw(amount)
    @transaction_history[@transaction_id] = Transaction.new(@balance, -amount)
    @transaction_id += 1
    @balance -= amount
  end

  def transaction_history
    @transaction_history
  end
end
