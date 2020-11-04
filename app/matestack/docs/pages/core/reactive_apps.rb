class Docs::Pages::Core::ReactiveApps < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/docs/reactive_apps/#{@file}?ref=#{@branch}"
    @sub_title = "Reactive apps"
  end
end
