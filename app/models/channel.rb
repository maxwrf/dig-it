class Channel < ApplicationRecord
  has_many :letters, dependent: :destroy
end
