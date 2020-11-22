FactoryBot.define do
  factory :product do
    product_name  {'product'}
    description  {Faker::Lorem.sentence}
    cost   {'1000'}
    product_category_id  {'2'}
    product_condition_id {'2'}
    delivery_fee_id {'2'}
    prefecture_id {'2'}
    arrival_date_id {'2'}

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
