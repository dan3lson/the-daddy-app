# frozen_string_literal: true

class Topic < ApplicationRecord
	has_many :comments, dependent: :destroy

	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
