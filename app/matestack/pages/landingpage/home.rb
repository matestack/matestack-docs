require "rest-client"

class Pages::Landingpage::Home < Matestack::Ui::Page

  def prepare
    @features = [
      :plug_into_rails, :ruby_classes, :spa_without_js,
      :interaction_without_js, :custom_components, :extend_with_vue
    ]
  end

  def response
    components {
      partial :hero
      partial :next, :why
      partial :why
      @features.each do |feature|
        partial :next, feature
        partial :feature_section, feature
      end
      partial :cta, :getting_started
      partial :team
      partial :os_attributes
      partial :cta, :gitter
      partial :footer
    }
  end

  def next section_id
    partial {
      link path: "##{section_id}" do
        div class: "next-section-button" do
          icon class: "material-icons", text: "keyboard_arrow_down"
        end
      end
    }
  end

  def hero
    partial {
      section id: 'slider' do
        # custom_video path: 'header_video.mp4', playsinline: true, controls: false, autoplay: true, muted: true, loop: true, id: 'videoBG'
        div class: 'container text-white text-center' do
          div class: 'row' do
            div class: 'col-md-8 col-md-offset-2' do
              heading class: 'h-1 text-uppercase', text: t('landingpage.hero.headline')
              paragraph text: t('landingpage.hero.subheadline')
              link class: 'btn btn-hero btn-transparent', path: '#why', text: t('landingpage.hero.button_one')
              # link class: 'btn btn-hero btn-main', path: :docs_path, params: {key: "install"}, text: t('landingpage.hero.button_two')
            end
          end
        end
        br
        br
        div class: 'container text-white text-center' do
          div class: 'row' do
            div class: 'col-md-8 col-md-offset-2 video-column' do
              custom_landingpage_video
            end
          end
        end
      end
    }
  end

  def why
    partial {
      section id: 'why', class: 'background-lightgrey padded-section' do
        div class: 'container' do
          div class: 'row text-center' do
            div class: 'col-md-12 col-sm-12' do
              heading size: 2, class: 'h-2', text: t('landingpage.why.headline')
              paragraph text: t('landingpage.why.text')
              paragraph text: t('landingpage.why.text_2')
            end
          end
          br
          br
          div class: "row" do
            div class: 'col-md-12 col-sm-12' do
              img path: 'landingpage/simplified_architecture.png', alt: 'Dashboard on a laptop', class: 'centered-75-img'
            end
          end
        end
      end
    }
  end

  def feature_section section_id
    partial {
      section id: section_id, class: "background-white padded-section" do
        div class: "container" do
          div class: "row text-center" do
            div class: "col-md-12 col-sm-12" do
              heading size: 2, class: "h-2", text: t("landingpage.#{section_id}.headline")
              paragraph text: t("landingpage.#{section_id}.text")
            end
          end
          br
          br
          div class: "row" do
            div class: "col-md-12 col-sm-12" do
              custom_md path: "markdown/landingpage/#{section_id}"
            end
          end
        end
      end
    }
  end

  def cta cta_id
    partial {
      section id: cta_id, class: "cta text-center background-grey-gradient light-padded-section" do
        div class: "container" do
          div class: "row" do
            div class: "col-md-12" do
              heading size: 2, class: "h-2", text: t("landingpage.#{cta_id}.headline")
              paragraph text: t("landingpage.#{cta_id}.text")
              if t("landingpage.#{cta_id}.path", default: "") != ""
                link path: t("landingpage.#{cta_id}.path").to_sym, params: t("landingpage.#{cta_id}.params") do
                  div class: "btn btn-main margin-top-20" do
                    plain t("landingpage.#{cta_id}.button_one")
                  end
                end
              end
              if t("landingpage.#{cta_id}.link", default: "") != ""
                link path: t("landingpage.#{cta_id}.link") do
                  div class: "btn btn-main margin-top-20" do
                    plain t("landingpage.#{cta_id}.button_one")
                  end
                end
              end
            end
          end
        end
      end
    }
  end

  def team
    @github_contributors_path = "https://api.github.com/repos/basemate/matestack-ui-core/contributors"
    @github_contributors = ::Rails.cache.fetch("components_md_remote_#{options[:path]}", expires_in: 1.day) do
      JSON.parse(RestClient.get(@github_contributors_path).body).reject{|c| c["type"] == "Bot"}
    end

    partial {
      section id: 'team', class: 'background-white light-padded-section' do
        div class: 'container' do
          heading size: 2, class: 'h-2 text-center', text: t('landingpage.team.headline')
          div class: 'row text-center' do
            @github_contributors.each do |contributor|
              div class: 'col-md-4 col-sm-12 padding-20' do
                div class: 'background-white padding-20' do
                  img path: contributor["avatar_url"], class: 'team-img'
                  heading size: 3, class: 'h-3', text: contributor["login"]
                  paragraph text: "Core Contributor"
                  link path: contributor["html_url"] do
                    icon class: 'ion-logo-github team-img-icon text-red'
                  end
                end
              end
            end
          end
        end
      end
    }
  end

  def os_attributes
    partial {
      section id: 'os-attributes', class: "background-lightgrey padded-section" do
        div class: "container" do
          div class: "row text-center" do
            [:community_driven, :quality_controlled, :contributor_friendly].each do |attr|
              div class: "col-md-4 col-sm-12" do
                heading size: 2, class: "h-2", text: t("landingpage.os.#{attr}.headline")
                paragraph text: t("landingpage.os.#{attr}.text")
              end
            end
          end
        end
      end
    }
  end

  def footer
    partial {
      custom_landingpage_footer
    }
  end



end
