class Author < ApplicationRecord
  validates :name, presence: true
  before_save :titialize_var

  private

  def titialize_var
    self.name = name.titlecase
  end
end
