class Admin::MediaController < AdminController
  def index
    # TODO: all辞める, N+1対策
    @attachments = ActiveStorage::Attachment.where.not(record_type: "ActiveStorage::VariantRecord")
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
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge

    redirect_to admin_media_path
  end
end
