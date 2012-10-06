require 'cgi' unless defined?(CGI)
require 'digest' unless defined?(Digest)

def url2png_v6(url, options={})
  url2png_apikey = 'P506FEE39A4A03'
  url2png_secret = 'S4A436E5FB796D'

  query = {
    :url       => url,
    :force     => options[:force],     # [false,always,timestamp] Default: false
    :fullpage  => options[:fullpage],  # [true,false] Default: false
    :thumbnail_max_width => "300", # scaled img width px; Default no-scaling
    :viewport  => options[:viewport],  # Max 5000x5000; Default 1280x1024
  }

  query_string = query.
    sort_by {|s| s[0].to_s }. # sort query by keys for uniformity
    select {|s| s[1] }.       # skip empty options
    map {|s| s.map {|v| CGI::escape(v.to_s) }.join('=') }. # escape keys & vals
    join('&')

  token = Digest::MD5.hexdigest(query_string + url2png_secret)

  "http://beta.url2png.com/v6/#{url2png_apikey}/#{token}/png/?#{query_string}"
end

