class Docs::Pages::Core::ReactiveComponents < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/docs/reactive_components/#{@file}?ref=#{@branch}"
    @sub_title = "Reactive components"
  end
end
