FactoryBot.define do
  factory :product do
    association :subcategory
    association :user
    product_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png'), 'image/png') }
  end
end
