desc 'delete screenshots every day'
task delete_files: :environment do
  mas = Tumb.where('created_at < ?', Time.now - 1.day).map { |x| x.screen_url + '.png' }
  image_path = "#{Rails.root}/public/screenshots/"
  Dir.foreach(image_path) do |file|
    if mas.include?(file)
      Tumb.find_by(screen_url: file.gsub(/(\.png)/, '')).delete
      File.delete(image_path + file)
    end
  end
  puts 'Done!'
end
