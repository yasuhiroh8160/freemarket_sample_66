FactoryBot.define do

  factory :sns_credential do
    provider { "google_oauth2" }
    uid { "12345678" }
    user_id { 2 }
  end

end
