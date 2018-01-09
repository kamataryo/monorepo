require 'spec_helper'
require 'monorepo'

describe 'Command `version`' do
  it 'return gem version' do
    MonorepoCLI.start(['version'])
  end
end
