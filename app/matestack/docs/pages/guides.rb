class Docs::Pages::Guides < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/docs/guides/#{@file}?ref=#{@branch}"
    @sub_title = "Guides"
  end
end
