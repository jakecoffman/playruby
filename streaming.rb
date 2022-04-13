#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'

# Net::HTTP.start('httpbin.org', 443, use_ssl: true) do |http|
#   request = Net::HTTP::Get.new('/json')
#   request.body_stream = File.open('data.json')
#   http.request request do |response|
#     puts response.body
#   end
# end

req = Net::HTTP::Post.new('https://httpbin.org/post')
req['Content-Type'] = 'application/json'
req['Content-Length'] = File.size('data.json')
req.body_stream = File.open('data.json')

http = Net::HTTP.new('httpbin.org', 443)
http.use_ssl = true
res = http.request(req)
puts res.body
