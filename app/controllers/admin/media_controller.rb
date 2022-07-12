class Admin::MediaController < ApplicationController
  def index
    # TODO: all辞める, N+1対策
    @medias = ActiveStorage::Blob.all
  end

  def new
  end

  def create
    blob = ActiveStorage::Blob.create_and_upload!(
      io: params[:file],
      filename: params[:file].original_filename,
      content_type: params[:file].content_type
    )

    redirect_to admin_media_path
  end

  def destroy
    # TODO削除機能実装
  end
end
