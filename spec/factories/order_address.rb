FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { 'あああ' }
    block_number { 'あああ１−１−１' }
    building { 'あああビル１０２' }
    tel_number { '09012345678' }
    user_id { @item.user_id }
    item_id { @item.id }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
