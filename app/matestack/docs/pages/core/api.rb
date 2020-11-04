class Docs::Pages::Core::Api < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/docs/api/100-components/#{@file}?ref=#{@branch}"
    @sub_title = "API"
  end
end
