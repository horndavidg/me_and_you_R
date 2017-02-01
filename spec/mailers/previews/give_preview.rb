# Preview all emails at http://localhost:3000/rails/mailers/give
class GivePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/give/give_notification
  def give_notification
    Give.give_notification
  end

end
