class ReferralMailer < ApplicationMailer
  default from: 'blessed2give1437@gmail.com'

  def notify_referral(referral, customer)

    @referral = referral
    @customer = customer

    mail(to: referral.email, subject: "You were referred by #{customer.email}")
  end
end
