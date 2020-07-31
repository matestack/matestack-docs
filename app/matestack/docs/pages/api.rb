class Docs::Pages::Api < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/#{@branch}/docs/api/#{@file}"
    @sub_title = "API Documentation"
  end
end
