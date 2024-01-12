# frozen_string_literal: true

# rubocop:disable Style/Documentation
class Article < ApplicationRecord
  validates :title, presence: true
end
# rubocop:enable Style/Documentation
