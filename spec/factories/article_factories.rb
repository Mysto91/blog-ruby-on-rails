FactoryBot.define do
    factory :article do
      title { Faker::Sports::Football.team }
      body { Faker::Lorem.paragraph }
      status { Visible::VALID_STATUSES.sample }

      author { association :author }
    end
end