require 'spec_helper'
require 'credit_card_system/account'

describe CreditCardSystem::Account do

  subject { described_class.new('Tom', '4111111111111111', '$1000') }

  describe '::new' do
    it 'returns the account`s name' do
      expect(subject.name).to eq('Tom')
    end

    it 'returns the account`s credit card number' do
      expect(subject.credit_card_num).to eq('4111111111111111')
    end

    it 'returns the account`s limit' do
      expect(subject.limit).to eq(1000)
    end

    it 'starting balance is 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#parse_amount' do
    it { expect(described_class.parse_amount('$1000')).to eq(1000) }

    it { expect(described_class.parse_amount('1000')).to eq(1000) }

    it { expect(described_class.parse_amount(1000)).to eq(1000) }
  end

  describe '#valid?' do
    it { expect(described_class.valid?('4111111111111111')).to eq(true) }

    it { expect(described_class.valid?('1234567890123456')).to eq(false) }
  end

  describe '#charge' do
    it 'change under the limit' do
      subject.charge('$600')
      expect(subject.balance).to eq(600)
    end

    it 'charge beyond the limit' do
      expect{ subject.charge('$1500') }.to raise_error(CreditCardSystem::TransactionError)
    end
  end

  describe '#credit' do
    let(:credit) { subject.credit('$100') }

    it 'credit $100' do
      credit
      expect(subject.balance).to eq(-100)
    end
  end

  it '#info' do
    expect(subject.info).to eq('Tom: $0')
  end
end