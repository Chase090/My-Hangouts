class InvitationsController < ApplicationController
  def update
    @invitation = Invitation.find(params[:id])
    @invitation.confirmed = params[:confirmed]
    @invitation.save
    redirect_to @invitation.hangout
  end

end
