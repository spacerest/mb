require_relative 'member'
require_relative 'account'
require_relative 'transaction'


class Bank

  attr_accessor :member_list
  attr_reader :member_list

  def initialize
    @member_list = []
    @member_id = -1
  end

  def new_member(ary)  
    @member_id += 1
    @member_list[@member_id] = Member.new(ary)
    @member_list[@member_id].assign_member_id(@member_id)
  end
    
  def members
    @new_array = []
    i = 0
    @member_list.length.times do
      @new_array[i] = @member_list[i].access_name
      i += 1
    end
    return @new_array
  end

  def get_member(member_id)
    @member_list[member_id]
  end
  
  def transaction_history
    transaction_history = []
    @member_list.each { |j|
      transaction_history << j.transaction_history
     }
    transaction_history.flatten
  end

end

