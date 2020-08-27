
class Account
  attr_accessor :name, :balance

  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end

  private

  def pin
    @pin = 789
  end

  def pin_check
    puts "Welcome to the banking system, #{@name}!\n" + "To access your account, input PIN please"
    @input_pin = gets.chomp.to_i
  end

  def pin_error
    "Access denied: incorrect PIN."
  end

  public

  def access
    if pin_check == pin
      puts "Input d: to deposit money, s: to show balance or w: to withdraw money"
      action = gets.chomp.downcase
      case action
      when "d"
        deposit
      when "s"
        display_balance
      when "w"
        withdraw
      else
        puts "Try again"
      end
    else puts pin_error
    end
  end

  def amount
    puts "Input the amount"
    @money = gets.to_i
  end

  def over_error
    print "Your balance is less than the amount of #{amount} money you are tryng to get: $#{@balance}"
  end

  def deposit
    @balance += amount
    puts "Deposited: $#{@money}. Updated balance: $#{@balance}."
  end

  def display_balance
    puts "Balance: $#{@balance}."
  end

  def withdraw
    if  amount <= @balance
      @balance -= @money
      puts "Withdrew: $#{@money}. Updated balance: $#{@balance}."
    else
      puts over_error
    end
  end
end
