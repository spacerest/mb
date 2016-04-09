class Transaction

  attr_reader :transaction_id, :change
  attr_accessor :transaction_id, :change

  def initialize(balance, change)
    @balance = balance
    @change = change
    @time = Time.now.strftime("%Y%m%d")
  end

end
