# frozen_string_literal: true

# Application responder from which all Karafka responders should inherit
# You can rename it if it would conflict with your current code base (in case you're integrating
# Karafka with other frameworks)
require 'karafka'
class ApplicationResponder < Karafka::BaseResponder
  # This method needs to be implemented in each of the responders
  # def respond(data)
  #   respond_to :example2, data.to_json
  # end
end

class HoofprintResponder < ApplicationResponder
  topic :example2
  def respond(message)
    "puts responding to example2"
    processed_message = self.do_something(message)
    respond_to :example2, processed_message
  end
  def do_something(message)
    puts "doing something with #{message}"
    message[:processed] = true
    return message
  end
end