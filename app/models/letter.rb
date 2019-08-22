class Letter < ActiveRecord::Base
  belongs_to :channel
  belongs_to :user
  validates :body, presence: true, allow_blank: false
  after_create :broadcast_letter

  def from?(some_user)
    user == some_user
  end

  def broadcast_letter
    ActionCable.server.broadcast("channel_#{channel.id}", {
        letter_partial: ApplicationController.renderer.render(partial: 'letters/letter', locals: { letter: self, user_is_letters_author: false }),
        current_user_id: user.id
      })
  end
end
