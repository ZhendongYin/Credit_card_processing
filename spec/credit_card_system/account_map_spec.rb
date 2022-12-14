require 'spec_helper'
require 'credit_card_system/account'
require 'credit_card_system/account_map'

describe CreditCardSystem::AccountMap do
  subject { described_class.new() }

  it '#add & #get' do
    account = CreditCardSystem::Account.new('Tom', '4111111111111111', '$1000')
    subject.add(account)
    expect(subject.get('Tom')).to eq(account)
  end

  it '#update' do
    account = CreditCardSystem::Account.new('Tom', '4111111111111111', '$1000')
    subject.add(account)
    account.charge('$500')
    subject.update(account)
    expect(subject.get('Tom').balance).to eq(500)
  end
end