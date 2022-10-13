namespace :counter_caches do
  desc 'Resets all counter caches.'
  task reset_dogs: :environment do
    dog_associations = [:likes]

    Dog.includes(dog_associations).in_batches(of: 1000, load: true).each_record do |record|
      Dog.reset_counters(record.id, *dog_associations)
    end
  end
end
