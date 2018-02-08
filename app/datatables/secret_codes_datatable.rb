class SecretCodesDatatable
  delegate :params, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: SecretCode.count,
      iTotalDisplayRecords: secret_codes.total_entries,
      aaData: data
    }
  end

private

  def data
    secret_codes.map do |secret_code|
      [
        link_to(secret_code.email, secret_code),
        ERB::Util.h(secret_code.code),
        ERB::Util.h(secret_code.created_at.strftime("%B %e, %Y")),
        link_to("show", secret_code),
        link_to("edit", "secret_codes/#{secret_code.id}/edit"),
        link_to("destroy", secret_code, method: :delete)
      ]
    end
  end

  def secret_codes
    @secret_codes ||= fetch_secret_codes
  end

  def fetch_secret_codes
    secret_codes = SecretCode.order("#{sort_column} #{sort_direction}")
    secret_codes = secret_codes.page(page).per_page(per_page)
    if params[:sSearch].present?
      secret_codes = secret_codes.where("email like :search", search: "%#{params[:sSearch]}%")
    end
    secret_codes
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[email code created_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end