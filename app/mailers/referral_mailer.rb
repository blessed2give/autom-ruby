class ReferralMailer < ApplicationMailer
  # set the value of the sender
  default from: 'blessed2give1437@gmail.com'


  def notify_referral(referral, customer)
    @referral = referral
    @customer = customer
    # mail takes a hash and stores email related data and prepares to send
    mail(to: referral.email, subject: "You were referred by #{customer.email}")
  end
end
