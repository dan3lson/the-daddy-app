# frozen_string_literal: true

module UserHelper
  def children_names(user)
    user.children.pluck(:first_name).to_sentence
  end

  def children_names_with_ages(user)
    user
      .children
      .map { |child| "#{child.first_name} (#{child.age})" }
      .to_sentence
  end

  def first_initial(user)
    user.first_name[0].upcase
  end
end
