# frozen_string_literal: true

# Model to represent the base class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.implicit_order_column = :created_at
end
