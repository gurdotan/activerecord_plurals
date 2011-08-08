ActiveRecord::Schema.define(:version => 0) do
  create_table :mountains, :force => true do |t|
    t.string :name
    t.string :country
    t.datetime :created_at
  end
end
