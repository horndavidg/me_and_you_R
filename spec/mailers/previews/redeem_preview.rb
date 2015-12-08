# Preview all emails at http://localhost:3000/rails/mailers/redeem
class RedeemPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/redeem/redeem_notification
  def redeem_notification
    Redeem.redeem_notification
  end

end
