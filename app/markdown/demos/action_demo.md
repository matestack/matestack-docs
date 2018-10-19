## Description

The following example shows you, how a button click is handled asynchronously:

```ruby
module Pages
  class Users < Page::Cell::Page

    def prepare
      @users = DemoUser.all
    end

    def response
      components {
        div class: "mdl-grid" do
          div class: "mdl-cell" do
            heading size: 2, text: "Demo"
          end
        end
        div dynamic: true, id: "users" do
          @users.each do |user|
            partial :user_row, user
          end
        end
      }
    end

    def user_row user
      partial {
        div class: "mdl-grid" do
          div class: "mdl-cell" do
            plain user.name
          end
          div class: "mdl-cell" do
            action action_config(user.id)
          end
        end
      }
    end

    def action_config(user_id)
      {
        text: "delete",
        type: :button,
        path: :delete_demo_user_path,
        params: { id: user_id },
        method: :delete,
        success: { users: :rerender }
      }
    end

  end
end
```
