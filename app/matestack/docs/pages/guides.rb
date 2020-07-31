class Docs::Pages::Guides < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/#{@branch}/docs/guides/#{@file}"
    p @github_api_md_path
    @sub_title = "Guides"
  end
end
