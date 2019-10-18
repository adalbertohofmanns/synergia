namespace :gen do
  desc "Criar tabela de cores e tamanhos"
  task color_size: :environment do
    30.times do |i|
      Color.create!(
        name: Faker::Color.color_name
      )
    end

    Size.create!(name: 'Pequeno')
    Size.create!(name: 'Médio')
    Size.create!(name: 'Grande')

  end

end
