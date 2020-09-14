class Docs::Pages::BaseApi < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/docs/api/1-base/#{@file}?ref=#{@branch}"
    @sub_title = "Base API Documentation"
  end
end
