#Teste Model, criado somente quando tem uma validação customizada
require 'rails_helper'
require 'factories/admin'

RSpec.describe Admin, type: :model do
  it "create success" do
    admin = build(:admin)
    expect(admin)
  end
end