desc 'Use this to fire other tasks'
task :screens do
  Rails.env = 'production'
  Rake::Task['delete_files'].invoke
end
