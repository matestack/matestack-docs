class Pages::Landingpage::Rubyconfth < Matestack::Ui::Page

  def response
    components {
      partial :hero
      partial :details
      partial :cta, :getting_started
      partial :summary
      partial :cta, :questions
      partial :footer
    }
  end

  def hero
    partial {
      section id: 'slider' do
        div class: 'container text-white text-center' do
          div class: 'row' do
            div class: 'col-md-8 col-md-offset-2' do
              heading class: 'h-1 text-uppercase', text: t('challenge.hero.headline')
              paragraph text: t('challenge.hero.subheadline')
              link class: 'btn btn-hero btn-transparent', path: '#details', text: t('challenge.hero.button_one')
            end
          end
        end
      end
    }
  end

  def details
    partial {
      section id: 'details', class: 'background-lightgrey padded-section' do
        div class: 'container' do
          div class: 'row text-center' do
            div class: 'col-md-12 col-sm-12' do
              heading size: 2, class: 'h-2', text: t('challenge.details.headline')
              paragraph text: t('challenge.details.text')
              paragraph do
                icon text: t('challenge.details.text_1')
              end
              paragraph text: t('challenge.details.text_2')
            end
            div class: 'col-md-12 col-sm-12' do
              heading size: 2, class: 'h-2', text: t('challenge.faq.headline')
              t('challenge.faq.questions').each do |question|
                paragraph do
                  strong text: question[:question]
                  br
                  plain question[:answer]
                end
              end
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
              heading size: 2, class: "h-2", text: t("challenge.#{cta_id}.headline")
              paragraph text: t("challenge.#{cta_id}.text")
              if t("challenge.#{cta_id}.link", default: "") != ""
                link path: t("challenge.#{cta_id}.link") do
                  div class: "btn btn-main margin-top-20" do
                    plain t("challenge.#{cta_id}.button_one")
                  end
                end
              end
            end
          end
        end
      end
    }
  end

  def summary
    partial {
      section id: 'summary', class: "background-white padded-section" do
        div class: "container" do
          div class: "row text-center" do
            t("challenge.details.summary").each do |key, attr|
              div class: "col-md-4 col-sm-12" do
                heading size: 2, class: "h-2", text: attr[:headline]
                paragraph text: attr[:text]
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
