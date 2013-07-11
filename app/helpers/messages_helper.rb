module MessagesHelper
  def count_message
    current_user.messages.not_read.count
  end
end
