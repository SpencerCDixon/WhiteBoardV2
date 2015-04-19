class ConversationBuilder
  attr_reader :params, :sender

  def initialize(params, current_user)
    @sender = current_user
    @params = params
  end

  def send_message
    convo = create_conversation
    create_participants(convo)
    PrivateMessage.create(conversation: convo, body: params[:body], user: sender)
  end

  def create_conversation
    Conversation.create(sender_id: sender.id, subject: params[:subject])
  end

  def create_participants(convo)
    recipient = User.find(params[:to])
    Participant.create(user: recipient, conversation: convo)
    Participant.create(user: sender, conversation: convo)
  end
end
