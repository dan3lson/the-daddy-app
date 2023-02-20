# frozen_string_literal: true

module UserHelper
  def children_names(user)
    names = user.children.pluck(:first_name)
    num_children = names.count
    case num_children
    when 0 then ""
    when 1 then	names.first
    when 2 then	names.join(" and ")
    else
      names.to_sentence
    end
  end

  def first_initial(user)
    user.first_name[0].upcase
  end
end
