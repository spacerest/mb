require 'sinatra'
require 'yaml/store'
require_relative 'controller/lib/bank'

def initialize
  @title = 'moon bank'
  @subtitle = 'yo'
  @bank = Bank.new
end

get '/' do
  @subtitle = 'welcome'
  @subsubtitle = 'please choose from the options on your right'
  erb :index
end

get '/signup' do
  erb :signup
end
  
post '/signup_confirm' do
  @first_name = params['first_name']
  @last_name = params['last_name']
  @create_member = @bank.new_member([@first_name, @last_name])
  @member = @bank.get_member(Session[:members].length)
  Session[:members] << @member.access_name
  Session[:member_id] = Session[:members].index(@member.access_name)
  Session[@member.access_name] = []

  erb :signup_confirm
end

get '/accounts' do


  erb :accounts
end

post '/new_account' do
  @member = @bank.get_member(Session[:member_id])
  @member.new_account
  Session[:account_id] = Session[@member.access_name].length
  @account = @bank.get_member(Session[:member_id]).get_account(Session[:account_id])
  Session[@bank.get_member(Session[:member_id]).access_name] << @account
  erb :new_account
end

post '/show_account' do
  @deposit_amount = params['deposit_amount'].to_i
  @member = @bank.get_member(Session[:member_id])
  @account = @member.get_account(Session[:account_id])

  @account.deposit(@deposit_amount)

  erb :show_account
end

Options = {
  'home' => '/',
  'new member' => '/signup',
  'manage accounts' => '/accounts'
}

Session = Hash.new
Session[:members] = []
Session[:member_id] = 0
Session[:account_id] = 0 


