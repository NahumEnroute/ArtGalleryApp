class HerModel
  include Her::Model
  scope :by_page, ->(page) { where(page: page) }

  # Parsing options
  # parse_root_in_json true
  # include_root_in_json true

  # Add ActiveRecord style update
  def update(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
    end
    save
  end
end
