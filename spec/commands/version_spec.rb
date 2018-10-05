require 'spec_helper'
require 'monorepo'

describe 'Command `version`' do
  it 'return gem version' do
    stdout = `monorepo version`
    expect(stdout).to include MONOREPO_VERSION
  end
end
