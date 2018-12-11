require 'pry'

class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  @@all = [ ]
  
  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver 
    @status = status
    @amount = amount 
    @@all << self
  end
  
  def valid?
    if sender.valid? && receiver.valid? == true 
      self.valid? == true
    else 
      self.valid? == false
    end
  end
  
  def execute_transaction
    if self.valid? == true && status == 'pending'
      receiver.deposit(amount)
      sender.withdraw(amount)
      @status = 'complete'
    else 
       "Transaction rejected. Please check your account balance."
       @status = 'rejected'
    end 
  end
  
  def reverse_transfer
    if self.status == 'complete'
      sender.deposit(amount) 
      receiver.withdraw(amount)
      @status = 'reversed'
    end
  end
  
end
