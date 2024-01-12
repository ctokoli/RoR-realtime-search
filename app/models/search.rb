# frozen_string_literal: true

# Search model
class Search < ApplicationRecord
  def self.fetch_data_by_ip_group
    group(:id, :term).pluck(:term)
  end
end
