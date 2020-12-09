FactoryBot.define do
  factory :product_transaction do
    zip_code    { '123-4567' }
    prefecture_id   { '4' }
    city   { '横浜市' }
    address   { '青山1−2−３' }
    building  { 'ステートビル' }
    phone_number   { '09012345678' }
  end
end