# require modules here
require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}
  new_new_hash = {}

  emoticons.each do |key, value|
      new_hash[value[1]] = key.to_s
      new_new_hash[value[0]] = value[1]
  end
  emoticon_hash = {"get_meaning" => new_hash, "get_emoticon" => new_new_hash}
end

def get_japanese_emoticon(path, english_emoticon)
  new_hash = load_library(path)
    new_hash["get_emoticon"].each do |key, value|
      if key == english_emoticon
        return value
      elsif !new_hash["get_emoticon"].include?(english_emoticon)
        return "Sorry, that emoticon was not found"
      else
    end
  end
end

=begin
this also works:

def get_japanese_emoticon(path, english_emoticon)
  new_hash = load_library(path)
    new_hash["get_emoticon"].each do |key, value|
    return value if key == english_emoticon
  end
  return "Sorry, that emoticon was not found" if !new_hash["get_emoticon"].include?(english_emoticon)
end

=end

def get_english_meaning(path, japanese_emoticon)
  new_hash = load_library(path)
    new_hash["get_meaning"].each do |key, value|
    return value if key == japanese_emoticon
  end
    return "Sorry, that emoticon was not found" if !new_hash["get_meaning"].include?(japanese_emoticon)
end
