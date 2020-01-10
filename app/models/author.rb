class Author < ApplicationRecord
  validates :name, presence: true
  before_save :titialize_var

  has_many :books

  private

  def titialize_var
    self.name = name.titlecase
  end
end
