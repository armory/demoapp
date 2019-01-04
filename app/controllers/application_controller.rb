class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_action :custom_nr_attr

protected
  def custom_nr_attr
    version = ENV['version']
    run_number = ENV['run_number']
    instance_type = ENV['instance_type']

    logger.info("Setting version = #{version}")
    logger.info("Setting run_number = #{run_number}")
    logger.info("Setting instance_type = #{instance_type}")

    ::NewRelic::Agent.add_custom_attributes({ version: version })
    ::NewRelic::Agent.add_custom_attributes({ run_number: run_number })
    ::NewRelic::Agent.add_custom_attributes({ instance_type: instance_type })
  end
end
