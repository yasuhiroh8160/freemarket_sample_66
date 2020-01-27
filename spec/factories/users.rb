FactoryBot.define do

  factory :user do
    nickname              {"taitai"}
    last_name             {"津田"}
    first_name            {"大雅"}
    last_name_kana        {"ツダ"}
    first_name_kana       {"タイガ"}
    birth_year            {"1998"}
    birth_month           {"9"}
    birth_day             {"12"}
    email                 {"ttt@gmail.com"}
    password              {"00000000"}
    encrypted_password    {"00000000"}
  end

end