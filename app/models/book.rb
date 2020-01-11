class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :cover
  has_one_attached :file

  validates_presence_of :name, :year, :author

  before_save :titialize_var

  private

  def titialize_var
    self.name = name.titlecase
  end
end
