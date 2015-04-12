class MailboxesController < ApplicationController
  def show
    @conversations = current_user.mailbox.conversations
    @conversation = current_user.mailbox.conversations.first
    @receipts = @conversation.receipts_for(current_user)
  end
end
