#!/usr/bin/env ruby
# Copyright (c) Cognitect, Inc.
# All rights reserved.


$LOAD_PATH << 'lib'
require 'transit'

transport = ARGV[0] || "json"

r = Transit::Reader.new(transport.to_sym)
w = Transit::Writer.new(STDOUT, transport.to_sym)
r.read(STDIN) {|o| w.write o}
