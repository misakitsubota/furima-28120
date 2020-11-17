FactoryBot.define do
  factory :user do
    nickname            {"test"}
    email               {"test@example"}
    password            {"test1111"}
    password_confirmation    {password}
    family_name         {"山田"}
    first_name          {"太郎"}
    family_name_kana    {"ヤマダ"}
    first_name_kana     {"タロウ"}
    birth_day           {"2000-01-01"}
  end
end