#!/usr/bin/env ruby -w
VERSION_FILES = [
  '.node-version',
  '.nvmrc'
].freeze

def find_up(directory = Dir.getwd, &block)
  result = yield(directory) if block_given?
  return result if result

  parent_directory = File.expand_path('..', directory)
  return if parent_directory == directory
  find_up(parent_directory, &block)
end

def current_node_version
  parse(`node -v`)
end

def desired_node_version(file)
  parse(File.read(file))
end

def build_command(version)
  "nvm use \"#{version}\" --silent"
end

def parse(version)
  version.gsub(/^v/, '').strip
end

def run
  chosen_version_file = find_up do |directory|
    found_version_file = VERSION_FILES.find do |version_file|
      File.exist?(File.join(directory, version_file))
    end
    break File.join(directory, found_version_file) if found_version_file
  end

  if chosen_version_file.nil?
    exit(0)
  end

  current = current_node_version
  desired = desired_node_version(chosen_version_file)
  puts build_command(desired) if current != desired
end

run
