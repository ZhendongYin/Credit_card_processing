require "luhn"

module CreditCardSystem
  class TransactionError < RuntimeError; end
  class UnValidUserError < RuntimeError; end

  class Account
    attr_reader :name, :credit_card_num, :limit, :balance

    def initialize(name, credit_card_num, limit)
      @name = name
      @credit_card_num = credit_card_num.to_s
      @limit = Account.parse_amount(limit)
      @balance = 0
      @status = Account.valid?(credit_card_num)
    end

    def charge(amount)
      raise UnValidUserError unless @status

      @balance += Account.parse_amount(amount)

      raise TransactionError if @balance > @limit
    end

    def credit(amount)
      raise UnValidUserError unless @status

      @balance -= Account.parse_amount(amount)
    end

    def balance_formater
      @status ? "$#{@balance}" : 'error'
    end

    def info
      "#{name.capitalize}: #{balance_formater}"
    end

    def self.parse_amount(amount)
      return amount if amount.is_a? Integer

      amount.gsub(/\D/, '').to_i
    end

    def self.valid?(credit_card_num)
      Luhn.valid?(credit_card_num)
    end
  end
end