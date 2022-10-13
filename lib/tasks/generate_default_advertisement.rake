namespace :default_values do
  desc 'Generates default task'
  task advertisement: :environment do
    ad = Advertisement.find_or_initialize_by(name: 'default_ad') # consider type 'default'
    ad.images.attach(io: File.open('app/assets/images/ad.jpg'), filename: 'ad.jpg')
    ad.save
  end
end
