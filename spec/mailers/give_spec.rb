require "rails_helper"

RSpec.describe Give, type: :mailer do
  describe "give_notification" do
    let(:mail) { Give.give_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Give notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
