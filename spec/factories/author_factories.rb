FactoryBot.define do
    factory :author do
      full_name { Faker::Name.unique.name }
      nationality { ISO3166::Country.all.map {|country| country.iso_short_name }.sample }
    end
end