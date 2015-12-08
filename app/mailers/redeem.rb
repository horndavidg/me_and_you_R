class Redeem < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.redeem.redeem_notification.subject
  #
  def redeem_notification(match)
    
    @match = match
    @greeting = "Hi"

   mail(to: "<#{match.email}>",
         subject: "Coupon Redeemed!")
  end
end
