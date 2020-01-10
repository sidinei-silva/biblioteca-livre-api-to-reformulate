class BookSerializer < ActiveModel::Serializer
  #Helpers for urls in blob active storage
  include Rails.application.routes.url_helpers


  attributes :id, :name, :year, :avaliable, :cover, :file
  belongs_to :author

  def cover
    rails_blob_url(object.cover, only_path: true) if object.cover.attached?
  end

  def file
    rails_blob_url(object.file, only_path: true) if object.file.attached?
  end

end
