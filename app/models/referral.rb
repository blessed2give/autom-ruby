class Referral < ActiveRecord::Base
  belongs_to :user
  after_create :send_referral_emails

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true

  private

  def send_referral_emails
    user.referrals.each do |ref|
      customer = Referral.find_by(id: user.id)
      ReferralMailer.notify_referral(ref, customer).deliver_now
    end
  end
end
