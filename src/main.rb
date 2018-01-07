require 'bundler/setup'
require 'Thor'

class JwelboxCLI < Thor
  # partial definition
end

require_relative './commands/bootstrap'
require_relative './commands/run'
