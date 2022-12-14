require "spec_helper"

describe CreditCardSystem do
  it "has a version number" do
    expect(CreditCardSystem::VERSION).not_to be nil
  end

  describe "new" do
    it "takes a command, a person, a credit card number and an amount" do
      CreditCardSystem
    end
  end
end