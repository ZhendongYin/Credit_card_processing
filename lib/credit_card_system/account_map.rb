module CreditCardSystem
  class CannotFindAccountError < RuntimeError; end

  class AccountMap

    def initialize
      @account_map = {}
    end

    def add(account)
      return unless account.is_a? Account

      @account_map[account.name] = account
    end

    def get(name)
      account = @account_map[name]

      raise CannotFindAccountError if account.nil?

      account
    end

    def update(account)
      add(account)
    end

    # print final results
    def print_info
      @account_map.keys.sort.each do |name|
        puts @account_map[name].info
      end
    end
  end
end