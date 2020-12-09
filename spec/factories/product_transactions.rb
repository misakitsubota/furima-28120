FactoryBot.define do
  factory :product_transaction do
    token   {"tok_abcdefghijk00000000000000000"}
    zip_code    { '123-4567' }
    prefecture_id   { 4 }
    city   { '横浜市' }
    address   { '青山1−2−３' }
    building  { 'ステートビル' }
    phone_number   { '09012345678' }
    user_id  { 2 }
    product_id { 2 }
  end
end
