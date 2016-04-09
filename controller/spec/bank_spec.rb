require 'spec_helper'
require 'bank'

describe Bank do
  let(:bank){ Bank.new }
  
  let(:member1){ ["ozzy", "giral"] }
  let(:member2){ ["mickey", "rourke"] }

  it "has one member" do
    bank.new_member(member1)
    expect(bank.members).to eq ["ozzy_giral"]
  end

  it "has two members" do
    bank.new_member(member1)
    bank.new_member(member2)
    expect(bank.members).to eq ["ozzy_giral", "mickey_rourke"]
  end

  it "can retrieve existing members" do
    bank.new_member(member1)
    expect(bank.get_member(0).class).to eq Member
  end

  it "member can make an account with 0 balance" do
    bank.new_member(member1)
    bank.get_member(0).new_account
    expect(bank.get_member(0).get_account(0).check_balance).to eq 0
  end

  it "member can deposit in account" do
    bank.new_member(member1)
    bank.get_member(0).new_account
    bank.get_member(0).get_account(0).deposit(5)
    expect(bank.get_member(0).get_account(0).check_balance).to eq 5
  end
 
  it "member can withdraw from account" do
    bank.new_member(member1)
    bank.get_member(0).new_account
    bank.get_member(0).get_account(0).deposit(5)
    bank.get_member(0).get_account(0).withdraw(2)
    expect(bank.get_member(0).get_account(0).check_balance).to eq 3
  end

  it "deposits and withdrawals for each account are saved in transaction history" do
    bank.new_member(member1)
    bank.get_member(0).new_account
    bank.get_member(0).get_account(0).deposit(1)
    expect(bank.get_member(0).get_account(0).transaction_history.class).to eq Array
  end

  it "can read a history of a member's transactions in different accounts" do
    bank.new_member(member1)
    bank.get_member(0).new_account
    bank.get_member(0).new_account
    bank.get_member(0).get_account(0).deposit(5)
    2.times do
      bank.get_member(0).get_account(1).deposit(2)
    end
    expect(bank.get_member(0).transaction_history.length).to eq 3
  end

  it "can read a history of all members transactions" do
    bank.new_member(member1)
    2.times do
      bank.get_member(0).new_account
    end
    bank.new_member(member2)
    2.times do
      bank.get_member(1).new_account
    end
    bank.get_member(0).get_account(0).deposit(10)
    bank.get_member(0).get_account(1).withdraw(5)
    bank.get_member(1).get_account(0).deposit(3)
    bank.get_member(1).get_account(1).deposit(10)
    expect(bank.transaction_history.length).to eq 4
  end

  it "account has an account number with 8 digits" do
    bank.new_member(member1)
    bank.get_member(0).new_account
    
    expect(bank.get_member(0).get_account(0).account_number).to eq "00000000"
  end

  it "each account has a different account number" do
    bank.new_member(member1)
    bank.get_member(0).new_account
    bank.get_member(0).new_account

    expect(bank.get_member(0).get_account(0).account_number).not_to eq bank.get_member(0).get_account(1).account_number
  end

  it "each members account numbers are different" do
    bank.new_member(member1)
    bank.new_member(member2)
    bank.get_member(0).new_account
    bank.get_member(1).new_account

    expect(bank.get_member(0).get_account(0).account_number).not_to eq bank.get_member(1).get_account(0).account_number
  end
    
end
