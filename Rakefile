# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "rubygems"
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.identifier             = "com.wickedgoodruby"
  app.name = 'Wicked Good'
  app.deployment_target = "6.0"

  app.interface_orientations = [:portrait]
  app.device_family = [:iphone]

  app.frameworks += %w(CoreLocation MapKit)
  app.pods do
    pod 'MMDrawerController', '~> 0.4.0'
  end
end
