class Pages::Guides::Introduction < Page::Cell::Page

  def prepare
    @title = "Hey mate!"
    @sub_title = "Welcome to our documentation! Work in progess, stay tuned!"

    @comments = DemoComment.last(5)
  end

  def response
    components {
      page_header title: @title, sub_title: @sub_title
      crazy
      row do
        col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
            row do
              col do
                md path: "markdown/guides/introduction"
              end
            end
            row do
              col do
                partial :demo
              end
            end
            row do
              col do
                md path: "markdown/guides/introduction_2"
              end
            end
            row do
              col do
                md path: "markdown/guides/introduction_end"
              end
            end
          end
        end
      end
    }
  end

  def demo
    partial {
      div id: "tasks", dynamic: true, rerender_on: "comments_changed" do
        @comments.each do |comment|
          partial :comment_item, comment
        end
      end
      partial :new_comment_form
    }
  end

  def comment_item comment
    partial {
      div do
        plain comment.content
        action delete_action_config(comment) do
          plain "delete"
        end
      end
    }
  end

  def new_comment_form
    partial {
      # define a form with the "form" core component
      # new_comment_form_config is a method returning the config
      form new_comment_form_config do
        input type: :text, key: :content
        submit do
          # you can put all kinds of components here
          button text: "create comment"
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
      method: :post,
      # rerender component with id=tasks after success
      success: {
        tasks: :rerender
      }
    }
  end

  def delete_action_config comment
    action_config = {
      path: :delete_comment_path,
      params: { id: comment.id },
      method: :delete,
      # rerender component with id=tasks after success
      success: {
        tasks: :rerender
      }
    }
  end

end
