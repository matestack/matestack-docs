class Pages::Components::GithubDoc < Pages::Base::GithubDoc

  def prepare
    super
    @github_api_md_path = "https://raw.githubusercontent.com/basemate/matestack-ui-core/#{@branch}/docs/components/#{@file}"
    @sub_title = "Component Documentation"
  end


end
