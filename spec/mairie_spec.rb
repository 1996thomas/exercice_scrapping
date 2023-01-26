# frozen_string_literal: true

require_relative '../lib/mairie'

describe 'get_town' do
  it 'check if the result is nil or not' do
    expect(get_townhall_email(mairie_url)['Ableiges - 95450']).to_not be_nil
  end
  it 'check if mail and city match together' do
    expect(get_townhall_email(mairie_url)['Ableiges - 95450']).to eq('mairie.ableiges95@wanadoo.fr')
    expect(get_townhall_email(mairie_url)['Vaudherland - 95500']).to eq('Adresse email indisponible')
  end
  it 'check if the length of the array match with number of cities' do
    expect(get_townhall_email(mairie_url).length).to eq(185)
  end
end
