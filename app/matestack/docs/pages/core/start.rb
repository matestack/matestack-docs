class Docs::Pages::Core::Start < Docs::Pages::Base
  def prepare
    super
    @github_api_md_path = "#{@github_base_url}/docs/start/#{@file}?ref=#{@branch}"
    @sub_title = "Start"
  end
end
