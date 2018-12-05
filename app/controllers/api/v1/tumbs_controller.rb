require 'open-uri'
require 'digest/md5'
require 'net/http'

class Api::V1::TumbsController < ApplicationController
  before_action :parse_params, only: [:show]
  WHITE_SCREENSHOT_NAME = 'white'
  # GET tumbs/
  def show
    md = Digest::MD5.hexdigest(@url)
    screenshot = Tumb.find_by(screen_url: md)
    if screenshot
      send_file_to_front(md)
    elsif !screenshot && remote_file_exist?
      Tumb.create(screen_url: md)
      make_file(md)
      send_file_to_front(md)
    else
      send_file_to_front(WHITE_SCREENSHOT_NAME)
    end
  end

  private

  def send_file_to_front(file_name)
    send_file "#{Rails.root}/public/screenshots/#{file_name}.png", type: 'image/png', disposition: 'inline'
  end

  def make_file(file_name)
    File.open("#{Rails.root}/public/screenshots/#{file_name}.png", 'wb') do |fo|
      fo.write open("#{ENV['SCREENSHOT_API']}/?url=#{@url}").read
    end
  end

  def remote_file_exist?
    nurl = URI.parse("#{ENV['SCREENSHOT_API']}/?url=#{@url}")
    Net::HTTP.start(nurl.host, nurl.port) do |http|
      return http.head(nurl.request_uri).code == '200'
    end
  end

  def parse_params
    @url = params[:url]
  end
end
