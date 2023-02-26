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
      "My 8/mo pooped in the bath...again 😩"
    ].freeze
    public_constant :CREATE_COMMENT_EXAMPLES

    CREATE_FEEDBACK_EXAMPLES = [
      "If I were to rate this app, I'd give it a...",
      "It would be great if we could...",
      "What I don't like is..."
    ].freeze
    public_constant :CREATE_FEEDBACK_EXAMPLES

    CREATE_COMMENT_LABEL_EXAMPLES = [
      "How's it going?",
      "What's on your mind?"
    ].freeze
    public_constant :CREATE_COMMENT_EXAMPLES

    TIME_ZONES = {
      pacific: "Pacific Time (US & Canada)"
    }.freeze
    public_constant :TIME_ZONES
  end
end
