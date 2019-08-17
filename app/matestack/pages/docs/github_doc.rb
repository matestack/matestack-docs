class Pages::Docs::GithubDoc < Pages::Base::GithubDoc

  def prepare
    super
    @github_api_md_path = "https://raw.githubusercontent.com/basemate/matestack-ui-core/#{@branch}/docs/#{@file}"
    @sub_title = "Documentation"
  end

end
