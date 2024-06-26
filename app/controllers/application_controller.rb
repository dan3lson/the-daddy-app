# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller

  after_action :track_action

  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end
end
