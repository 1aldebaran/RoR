require_relative 'ba'
RSpec.describe BankAccount do
  before(:each) do
    @acct1 = BankAccount.new('Alao Thompson')
    @acct1.deposit("checking", 1000)
    @acct1.deposit("saving", 1000)
  end
  it "has a getter method for retrieving the checking account balance" do
    expect(@acct1.checking).to eq(1000)
  end
  it "has a getter method for retrieving the saving account balance" do
    expect(@acct1.saving).to eq(1000)
  end
  it "has a getter method for allows for cash withdrawal" do
    expect(@acct1.withdrawal("saving", 500).saving).to eq(500)
  end
  it "raises an error if a user tries to withdraw more money than they have in the account" do
    expect{@acct1.withdrawal("saving", 1500)}.to raise_error("Insufficient Funds, you have 1000 in this account")
  end
  it "raises an error if a user attempts to retrieve the total number of bank accounts" do
    expect{@acct1.number_of_accounts}.to raise_error(NoMethodError)
  end
  it "raises an error if a user attempts to set the interest rate" do
    expect{@acct1.interest_rate}.to raise_error(NoMethodError)
  end
end
