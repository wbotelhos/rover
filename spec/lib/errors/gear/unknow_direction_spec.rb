require 'rails_helper'

describe Errors::Gear::UnknowDirection do
  let(:error) { described_class.new 'direction' }

  it 'builds the right message' do
    expect(error.to_s).to match %r(direction)
  end
end
