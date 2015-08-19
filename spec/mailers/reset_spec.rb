require "rails_helper"

RSpec.describe Reset, type: :mailer do
  describe "password_reset" do
    let(:mail) { Reset.password_reset }

    xit "renders the headers" do
      expect(mail.subject).to eq("Password reset")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    xit "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
