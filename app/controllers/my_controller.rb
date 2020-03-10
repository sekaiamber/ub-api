class MyController < Api::V1::BaseController
  before_action :authenticate_user!
  layout false
  def invite_page
  end

  def id_documents
    @id_document = current_user.id_document
  end

  def update
    @id_document = current_user.id_document
    if @id_document.update(id_documents_params)
      @id_document.submit!
      flash[:success] = '上传成功，请等待管理员审核。'
      redirect_to '/'
      return
    end
    flash[:error] = @id_document.errors.full_messages.join(', ')
    render action: :id_documents
  end
  private

  def id_documents_params
    params.require(:id_document).permit(:idcard_person_info, :idcard_cover, :person_holding_idcard, :id_document_number, :name)
  end
end
