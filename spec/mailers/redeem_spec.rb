require "rails_helper"

RSpec.describe Redeem, type: :mailer do
  describe "redeem_notification" do
    let(:mail) { Redeem.redeem_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Redeem notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
