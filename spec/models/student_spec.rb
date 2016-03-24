describe Student do
  it 'has a valid factory' do
    expect(build(:student)).to be_valid
  end

  it 'is invalid without a name' do
  expect(build(:student, name: nil)).to_not be_valid
  end
end
