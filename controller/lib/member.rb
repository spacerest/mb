require_relative 'account'
class Member

  attr_reader :name, :access_name, :transaction_history, :account_list, :account_id, :account_number, :id
  attr_accessor :name, :transaction_history, :account_list, :account_id, :account_number, :id

  def initialize(name)
    @name = name
    @access_name = name.join("_")
    @account_list = []
    @account_id = 0
    @id
  end

  def assign_member_id(member_id)
    @id = member_id
  end

  def new_account
    @account_list[@account_id] = Account.new(@account_id)
    @account_list[@account_id].member_id(@id)
    @account_list[@account_id].assign_account_number
    @account_id += 1
  end

  def get_account(account_id)
    @account_list[account_id]
  end

  def transaction_history
    transaction_history = []
    @account_list.each { |j|
	transaction_history << j.transaction_history
    }
    transaction_history.flatten
  end
    


  
end
