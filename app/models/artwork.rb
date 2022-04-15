class Artwork < HerModel
  include Filterable
  belongs_to :user

  scope :filter_by_user_id, ->(user_id) { where(user_id: user_id) }
end
