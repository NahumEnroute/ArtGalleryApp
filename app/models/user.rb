class User < HerModel
  has_many :artworks

  def self.users_collection
    all.uniq.map { |user| [user.first_name, user.id] }
  end
end
