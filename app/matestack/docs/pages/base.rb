require 'rest-client'

class Docs::Pages::Base < Matestack::Ui::Page

  def prepare
    # Final TODO: change branch to master
    # Final TODO: change line below to call GitHub API like in sidebar (?)
    @github_base_url = 'https://raw.githubusercontent.com/matestack/matestack-ui-core'
    @branch = 'master'
    case context[:params][:format]
    when 'md'
      @file = context[:params][:key] + '.md'
    when 'rb'
      @file = context[:params][:key] + '.rb'
      @md_language_wrapper = 'ruby'
    else
      @file = context[:params][:key] + '/README.md'
    end
    @github_api_md_path = nil
    @sub_title = nil
  end

  def response
    hero
    content
  end

  def hero
    section id: 'hero', class: 'pt-5 pb-2 mb-5' do
      div class: 'container' do
        div class: 'row py-3' do
          div class: 'col-md-4 offset-md-3 col-12' do
            # heading size: 2, class: 'my-3 pr-3', text: @file.gsub('.md', '').gsub('.rb', '').gsub('/README', '').camelcase
            # heading size: 5, class: 'my-3', text: @sub_title.upcase
          end
        end
      end
    end
  end

  def content
    section id: 'content' do
      div class: 'container' do
        div class: 'row py-4 px-5' do
          div class: 'col-12' do
           docs_md path: @github_api_md_path, remote: true, lang: @md_language_wrapper
          end
        end
      end
    end
  end

end
