#Teste Model, criado somente quando tem uma validação customizada
require 'rails_helper'
require 'factories/manager'

RSpec.describe Manager, type: :model do
  it "create success" do
    manager = build(:manager)
    expect(manager)
  end
end