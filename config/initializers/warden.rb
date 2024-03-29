WhiteBoardV2::Application.middleware.use Warden::Manager

Warden::Manager.after_set_user do |user, auth, opts|
  invitation = auth.request.session[:invitation_token]
  if invitation.present?
    InvitationRedemption.new(user, invitation).persist!
    auth.request.session[:invitation_token] = ''
  end
end
