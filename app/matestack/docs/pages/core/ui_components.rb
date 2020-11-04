class Docs::Pages::Core::UiComponents < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/docs/ui_components/#{@file}?ref=#{@branch}"
    @sub_title = "UI components"
  end
end
