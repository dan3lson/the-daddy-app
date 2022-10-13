# frozen_string_literal: true

module SignUpHelper
  def referral_code_readonly?(referral_code)
    referral_code.present?
  end

  def referral_code_readonly_class(referral_code)
    return unless referral_code_readonly?(referral_code)

    "readonly-input"
  end

  def referral_code_value(referral_code)
    referral_code.presence
  end
end
