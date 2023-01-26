# frozen_string_literal: true

require_relative '../lib/crypto'

describe 'crypto_scrap' do
  it 'check if the result is nil or not' do
    expect(crypto_scrap).to_not be_nil
  end
  it 'check if mail and city match together' do
    expect(crypto_scrap['BTC']).to_not be_nil
    expect(crypto_scrap['ETH']).to_not be_nil
    expect(crypto_scrap['ATOM']).to_not be_nil
    expect(crypto_scrap['DOT']).to_not be_nil
  end
  it 'check if the length of the array match with number of crypto' do
    expect(crypto_scrap.length).to eq(20)
  end
end
