class ReferralsController < ApplicationController
  def index
    @referrals = current_user.referrals
  end

  def new
    @referral = current_user.referrals.new
  end

  def create
    @referral = current_user.referrals.new
    @referral.firstName = params[:referral][:firstName]
    @referral.lastName = params[:referral][:lastName]
    @referral.email = params[:referral][:email]

    if @referral.save
      flash[:notice] = "Referral Saved"
      redirect_to referrals_path
    else
      flash.now[:alert] = "There was an error saving the referral. Please try again."
      render :new
    end
  end
end
