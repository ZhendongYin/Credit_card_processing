require 'spec_helper'
require 'tempfile'
require 'credit_card_system/cli'

describe CreditCardSystem::Cli do
  let(:expected_output) { "Lisa: $-93\nQuincy: error\nTom: $500\n" }
  subject { described_class.new }
  let(:parse) { subject.parse }
  let(:print_result) { subject.print_result }
  let(:input) { File.join(File.dirname(__FILE__), "../../input.txt") }

  it 'test result' do
    stub_const('ARGV', [input])
    parse
    expect{ print_result }.to output(expected_output).to_stdout
  end
end