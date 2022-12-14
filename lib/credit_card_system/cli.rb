require './lib/credit_card_system'

module CreditCardSystem
  class Cli
    class FileNotFound < RuntimeError; end

    include CreditCardSystem::CommandProcess

    def initialize
      @account_map = AccountMap.new
    end

    def parse
      # STDIN mode
      if ARGV.empty?
        while (command_str = gets.chomp.downcase) != 'exit'
          next if command_str == ''

          command_select command_str
        end
      # File reading mode
      elsif ARGV && File.exist?(ARGV[0])
        File.readlines(ARGV[0]).each do |command_str|
          command_select(command_str)
        end
      else
        puts 'Please input currect commands!'
      end
    end

    # print final results
    def print_result
      @account_map.print_info
    end
  end
end