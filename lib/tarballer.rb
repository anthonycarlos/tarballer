require 'settings'

class Tarballer

  def self.show
    settings = Settings.new
    puts "Showing project configurations"
    settings.keys.each do |proj|
      puts "'#{proj}'=>#{settings[proj]}"
    end
  end

  def initialize
    @settings = Settings.new
  end
  # settings = {
  #   'proj1' = {
  #     'proj_path'    = '/path/to/proj1',
  #     'branch'       = 'release',
  #     'tarball_path' = '/path/to/proj1/tarball',
  #   },
  #   'proj2' = {
  #     'proj_path'    = '/path/to/proj2',
  #     'branch'       = 'develop',
  #     'tarball_path' = '/path/to/proj2/tarball',
  #   }
  # }

  def create(proj)
    s = @settings[proj]
    puts s
    tarball = File.join(s[:tarball_path], "#{proj}.tgz")
    if s[:branch]
      git_update_result = `cd #{s[:proj_path]}; git fetch; git checkout #{s[:branch]}`
    end
    tar_result = `tar -czf #{tarball} #{s[:proj_path]}`
  end

  def create_all
    @settings.keys.each do |proj|
      create(proj)
    end
  end

end
