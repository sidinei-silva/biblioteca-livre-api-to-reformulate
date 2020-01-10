class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :avaliable
  belongs_to :author
end
