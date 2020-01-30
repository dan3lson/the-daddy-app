# frozen_string_literal: true

# Sign up a Daddy and their children.
class Registration
	include ActiveModel::Model

	attr_accessor :first_name, :email, :password, :city, :babies

	validates :first_name, presence: true
	validates :email, presence: true
	validates :password, presence: true
	validates :city, presence: true
	validates :babies, presence: true
	validate  :complete_babies_info?

	def register
		return false unless valid?

		ActiveRecord::Base.transaction do
			daddy = create_daddy!
			create_babies!(daddy)
		end
		true
	end

	private

	def complete_babies_info?
		return if babies.nil?

		babies.each do |baby|
			next unless baby.values.any?(&:blank?)

			errors.add(:babies, 'baby info incomplete')
		end
	end

	def create_daddy!
		User.create!(
			first_name: first_name,
			email: email,
			password: password,
			city: city
		)
	end

	def create_babies!(daddy)
		babies.each do |baby|
			daddy.babies.create!(
				first_name: baby[:first_name],
				gender: baby[:gender],
				birthdate: baby[:birthdate]
			)
		end
	end
end
