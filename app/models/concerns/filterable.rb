# frozen_string_literal: true

# Filterable concern
module Filterable
  extend ActiveSupport::Concern

  # Adds class methods to the including class
  class_methods do
    def filter(filtering_params)
      results = all
      filtering_params.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value.present?
      end
      results
    end
  end
end
