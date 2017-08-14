class Referral < ActiveRecord::Base
  belongs_to :user
  after_create :send_referral_emails

  # validate form fields
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true

  private

  # send email notification to new referral after customer adds new referral
  def send_referral_emails
    user.referrals.each do |ref|
      customer = Referral.find_by(id: user.id)
      ReferralMailer.notify_referral(ref, customer).deliver_now
    end
  end
end
