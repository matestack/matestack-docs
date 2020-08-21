class Docs::Pages::BaseApi < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/#{@branch}/docs/api/1-base/#{@file}"
    @sub_title = "Base API Documentation"
  end
end
