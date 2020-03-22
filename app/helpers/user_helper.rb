module UserHelper
	def baby_names(user)
		names = user.babies.pluck(:first_name)
		num_babies = names.size
		case num_babies
		when 0 then ''
		when 1 then	names.first
		when 2 then	names.join(' and ')
		else
			names.to_sentence
		end
	end

	def first_initial(user)
		user.first_name[0].upcase
	end
end
