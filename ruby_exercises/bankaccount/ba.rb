class BankAccount
  attr_reader :name, :account_number, :checking, :saving


  @@number_of_accounts = 0
  def initialize name
    @name = name
    @account_number = create_account
    @checking = 0
    @saving = 0
    @interest_rate = 0.01
  end
  def number_of_accounts
    @@number_of_accounts
  end
  def deposit (account, amount)
    if account == "checking"
      @checking += amount
    else
      @saving += amount
    end
    return self
  end
  def withdrawal account, amount
    if account == "checking"
      if @checking < amount
        raise "Insufficient Funds, you have #{@checking} in this account"
      else
        @checking -= amount
      end
    else
      if @saving < amount
        raise "Insufficient Funds, you have #{@saving} in this account"
      else
        @saving -= amount
      end
    end
    return self
  end
  def total
    "Checking Balance: #{@checking}\nSaving Balance: #{@saving}\nTotal Balance: #{@checking + @saving}"
  end
  def account_information
    puts "Account Name: #{@name}\nAccount Number: #{@account_number}\nInterest Rate: #{@interest_rate}\n#{self.total}"
    return self
  end
  private
    def create_account
      Array.new(10).map{rand(1..9)}.join
    end
end
