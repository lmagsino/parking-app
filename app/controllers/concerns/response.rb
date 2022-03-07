module Response
  def respond_to_json errors, response = {}
    errors.any? ?
      render(:json => { :errors => errors }, :status => 422) :
      render(:json => response, :status => 200)
  end

  def respond_to_all errors
    respond_to do |format|
      format.html
      format.json { respond_to_json errors }
    end
  end
end
