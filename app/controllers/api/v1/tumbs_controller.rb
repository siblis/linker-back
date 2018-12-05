require 'open-uri'
require 'digest/md5'
require 'net/http'

class Api::V1::TumbsController < ApplicationController
  before_action :parse_params, only: [:show]
  # GET tumbs/
  def show
    md = Digest::MD5.hexdigest(@url)
    screenshot = Tumb.find_by(screen_url: md)
    if screenshot
      send_file "#{Rails.root}/public/screenshots/#{md}.png", type: 'image/png', disposition: 'inline'
    elsif !screenshot && remote_file_exist?
        screenshot = Tumb.create(screen_url: md)
        File.open("#{Rails.root}/public/screenshots/#{md}.png", 'wb') do |fo|
          fo.write open("http://127.0.0.1:3030/?url=#{@url}", read_timeout: 60).read
        end
        send_file "#{Rails.root}/public/screenshots/#{md}.png", type: 'image/png', disposition: 'inline'
    else
        send_file "#{Rails.root}/public/screenshots/white.png", type: 'image/png', disposition: 'inline'
    end
  end

  private

  def remote_file_exist?
    nurl = URI.parse("http://127.0.0.1:3030/?url=#{@url}")
    Net::HTTP.start(nurl.host, nurl.port) do |http|
      return http.head(nurl.request_uri).code == "200"
    end
  end

  def parse_params
    @url = params[:url]
  end
end
