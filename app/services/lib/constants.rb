# frozen_string_literal: true

module Lib
  module Constants
    DADDY_TYPES = {
      "The First-timer (one child)": "first_timer",
      "The Juggler (multiple children)": "juggler",
      "The Stepdad": "stepdad",
      "The Adopter": "adopter",
      "The Fosterer": "fosterer",
      Other: "other"
    }.freeze
    public_constant :DADDY_TYPES

    CREATE_COMMENT_EXAMPLES = [
      "My little man just crawled!!",
      "Just saying hello 👋",
      "But why does my 8/mo daughter love pooping when I give her a bath 😩"
    ].freeze
    public_constant :CREATE_COMMENT_EXAMPLES

    CREATE_COMMENT_LABEL_EXAMPLES = [
      "How's it going?",
      "What's on your mind?"
      # "What's up with your little one(s)?"
    ].freeze
    public_constant :CREATE_COMMENT_EXAMPLES
  end
end
