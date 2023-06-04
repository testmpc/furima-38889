FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    explanation {Faker::Lorem.sentence}
    category {Category.where.not(id: Category.first.id).sample}
    situation {Situation.where.not(id: Situation.first.id).sample}
    shippingfee {Shippingfee.where.not(id: Shippingfee.first.id).sample}
    prefecture {Prefecture.where.not(id: Prefecture.first.id).sample}
    deliveryskd {Deliveryskd.where.not(id: Deliveryskd.first.id).sample}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end