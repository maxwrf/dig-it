class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates :body, presence: true, allow_blank: false

  def from?(some_user)
    user == some_user
  end
end
