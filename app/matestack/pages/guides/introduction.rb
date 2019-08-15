class Pages::Guides::Introduction < Matestack::Ui::Page

  def prepare
    @title = "Matestack: Escape the frontend hustle"
    @sub_title = "Create maintainable, dynamic and beautiful UIs easily in pure Ruby"

    @comments = DemoComment.last(5)
  end

  def response
    components {
     custom_page_header title: @title, sub_title: @sub_title
     custom_row do
        custom_col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
           custom_row do
              custom_col do
               custom_md path: "markdown/guides/introduction"
              end
            end
           custom_row do
              custom_col do
                partial :demo
              end
            end
           custom_row do
              custom_col do
               custom_md path: "markdown/guides/introduction_2"
              end
            end
           custom_row do
              custom_col do
               custom_md path: "markdown/guides/introduction_end"
              end
            end
          end
        end
      end
    }
  end

  def demo
    partial {
      async rerender_on: "comments_changed" do
        div id: "tasks" do
          ul class: "mdl-list" do
            @comments.each do |comment|
              partial :comment_item, comment
            end
          end
        end
      end
      partial :new_comment_form
    }
  end

  def comment_item comment
    partial {
      li class: "mdl-list__item demo-list" do
        span class: "mdl-list__item-primary-content" do
          plain comment.content
        end
        action delete_action_config(comment) do
          icon class:"material-icons", text: "clear"
        end
      end
    }
  end

  def new_comment_form
    partial {
      # define a form with the "form" core component
      # new_comment_form_config is a method returning the config
      form new_comment_form_config, :include do
        div class: "mdl-textfield mdl-js-textfield" do
          form_input class: "mdl-textfield__input", type: :text, key: :content
          label class: "mdl-textfield__label", text: "type comment and hit enter!"
        end
        div do
          form_submit do
            button class: "mdl-button mdl-js-button mdl-button--raised mdl-button--colored", text: "create comment"
          end
        end
      end
    }
  end

  def new_comment_form_config
    form_config = {
      # the input values will be wrapped in an object
      # with key "comment". That's what our backend action
      # is expecting
      for: :comment,
      path: :create_comment_path,
      method: :post
    }
  end

  def delete_action_config comment
    action_config = {
      path: :delete_comment_path,
      params: { id: comment.id },
      method: :delete,
      class: "mdl-list__item-secondary-action",
      success:  {
        emit: "action_success"
      }
    }
  end

end
