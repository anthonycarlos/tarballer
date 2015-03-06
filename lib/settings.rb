require 'yaml'

class Settings
  SETTINGS_FILE = File.join(File.dirname(__FILE__), '..', 'config', 'tarballer.yml')

  def initialize
    @s = YAML.load_file(SETTINGS_FILE)
    @s ||= {}
  end

  def [](key)
    @s[key]
  end

  def []=(key, value)
    @s[key] = value
  end

  def keys
    @s.keys
  end

  def save!
    File.open(SETTINGS_FILE, 'w') do |h|
      h.write @s.to_yaml
    end
  end

end
