class ReferralsController < ApplicationController
  def index
    #query current user's referrals and store them
    @referrals = current_user.referrals
    @user = current_user.id
  end

  def new
    @user = current_user
    #create an empty referral object
    @referral = current_user.referrals.new
  end

  def create
    @referral = current_user.referrals.new

    # variables used to store form input values
    @referral.firstName = params[:referral][:firstName]
    @referral.lastName = params[:referral][:lastName]
    @referral.email = params[:referral][:email]

    # if form successfully saves, render a notice then redirect, if not try again
    if @referral.save
      flash[:notice] = "Referral Saved"
      redirect_to user_referrals_path
    else
      flash.now[:alert] = "There was an error saving the referral. Please try again."
      render :new
    end
  end
end
