#!/usr/bin/env jruby

include Java

Base_Dir = File.expand_path(File.dirname(__FILE__) + '/../..')
Build_Dir = Base_Dir + '/build/'
$CLASSPATH << Build_Dir

require_relative './util.rb'
require_relative './gentlemen.rb'
require_relative './joy.rb'

save 'joy.wav', Joy::Song
