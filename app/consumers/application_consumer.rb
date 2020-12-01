# frozen_string_literal: true

# Application consumer from which all Karafka consumers should inherit
# You can rename it if it would conflict with your current code base (in case you're integrating
# Karafka with other frameworks)
class ApplicationConsumer < Karafka::BaseConsumer
end


class HoofprintConsumer < ApplicationConsumer
  def initialize(&process_message)
    super
  end
  def consume
    puts "consuming from #{topic.name}"
    puts "message is #{params.payload}"
    #do something with the message
    
    respond_with params.payload
  end
 
end


