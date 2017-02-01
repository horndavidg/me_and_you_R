class Give < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.give.give_notification.subject
  #
  def give_notification(match,kudo)
    
    @match = match
    @kudo = kudo

   mail(to: "<#{match.email}>",
         subject: "You were given a Kudo!")
  end
end
