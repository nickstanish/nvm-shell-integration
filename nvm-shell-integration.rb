#!/usr/bin/env ruby -w
require 'logger'
require 'shellwords'

VERSION_FILES = [
  '.node-version',
  '.nvmrc'
].freeze

LOGGER = Logger.new(STDERR)
LOGGER_ENABLED = ENV['NVM_SHELL_INTEGRATION_LOGGER'] == '1'

def log(level, message)
  LOGGER.send(level, message) if LOGGER_ENABLED
end

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
  # Redirecting stdout to /dev/null instead of using --silent flag which loses error message when desired version is not installed.
  "nvm use #{Shellwords.escape(version)} > /dev/null"
end

def parse(version)
  version.gsub(/^v/, '').strip
end

def run
  log(:info, "Finding version file")
  chosen_version_file = find_up do |directory|
    found_version_file = VERSION_FILES.find do |version_file|
      File.exist?(File.join(directory, version_file))
    end
    break File.join(directory, found_version_file) if found_version_file
  end

  if chosen_version_file.nil?
    log(:info, "No version file found")
    exit(0)
  end

  current = current_node_version
  desired = desired_node_version(chosen_version_file)
  log(:info, "current version: #{current}, expected version: #{desired}")
  if current != desired
    result = build_command(desired)
    log(:info, result)
    puts result
  end
end

run
