
class Transfer
  # your code here
  attr_accessor :sender, :receiver,  :amount, :status, :bank_account
    def initialize(sender, receiver, amount)
      @receiver = receiver
      @sender = sender
      @amount = amount
      @status = "pending"
    end

    def valid?
       sender.valid? && receiver.valid?
    end
      
    def execute_transaction

      if self.status == "pending" && self.sender.balance >= self.amount && self.valid? 
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else
         self.status = "rejected"
        "Transaction rejected. Please check your account balance."
         
      end
    end
    def reverse_transfer
      if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
      end
    end



end
