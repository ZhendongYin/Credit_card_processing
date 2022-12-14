module CreditCardSystem
  module CommandProcess

    private

    def command_select(command_str)
      command, *args = command_str.split
      send(command.downcase, *args)

    rescue NoMethodError
      puts "Command Error! Command: #{command_str}"
    rescue ArgumentError
      puts "Wrong number of arguments! Command: #{command_str}"
    rescue CreditCardSystem::CannotFindAccountError
      puts "Can't find user! Command: #{command_str}"
    end

    def add(name, credit_card_num, limit)
      @account_map.add(Account.new(name, credit_card_num, limit))
    end

    def charge(name, amount)
      account = @account_map.get(name)
      transaction(account.clone) do
        account.charge(amount)
      end
    end

    def credit(name, amount)
      account = @account_map.get(name)
      transaction(account) do
        account.credit(amount)
      end
    end

    def transaction(account)
      yield
    rescue TransactionError, UnValidUserError
      @account_map.update(account)
    end
  end
end