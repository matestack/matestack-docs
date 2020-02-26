class Apps::Landingpage < Matestack::Ui::App

  def response
    components {
      header do
        div class:'container' do
          div class:'row' do
            div class:'col-md-12' do
              nav class:'navbar navbar-default sticky-top' do
                div class:'container-fluid' do
                  div class:'navbar-header' do
                    button class:'navbar-toggle collapsed', attributes: { "data-target":'#bs-example-navbar-collapse-1', "data-toggle":'collapse'}, type:'button' do
                      span class:'sr-only' do plain "Toggle navigation" end
                      span class:'icon-bar'
                      span class:'icon-bar'
                      span class:'icon-bar'
                    end
                    link class:'navbar-brand', path: :root_path do
                      img alt:"basemate. keep it simple", path:"matestack_logo.png"
                    end
                  end
                  div class:'collapse navbar-collapse', id:'bs-example-navbar-collapse-1' do
                    ul class:'nav navbar-nav navbar-right text-uppercase' do
                      li do
                        link path: :root_path
                      end
                      li do
                        link path: "https://github.com/basemate/matestack-ui-core" do
                          plain "Show on Github"
                        end
                      end
                      li do
                        link path: :docs_path, params: {key: 'install'}, class: "btn btn-main nav-button" do
                          plain "Get started"
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      main do
        page_content
      end
      # custom_footer
    }
  end

end
