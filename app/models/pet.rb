class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  def to_h
    h = serializable_hash
    h['photo'] = photo.url
    h
  end
end
