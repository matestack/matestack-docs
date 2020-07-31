class Docs::Pages::Spec < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/#{@branch}/spec/#{@file}"
    @sub_title = "Specification"
  end
end
