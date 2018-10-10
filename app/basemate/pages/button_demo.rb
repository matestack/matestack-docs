module Pages
  class ButtonDemo < Page::Cell::Page

    def prepare
      @users = DemoUser.all
    end

    def response
      components {
        div class: "mdl-grid" do
          div class: "mdl-cell" do
            heading size: 1, text: "Users"
          end
        end
        div dynamic: true, id: "users" do
          @users.each do |user|
            partial :user_row, user
          end
        end
        partial :notice_bar
        partial :alert_bar
      }
    end

    def user_row user
      partial {
        div class: "mdl-grid" do
          div class: "mdl-cell" do
            plain user.name
          end
          div class: "col" do
            action action_config(user)
          end
        end
      }
    end

    def notice_bar
      partial {
        partial :snackbar, "notice_bar", "mdl-snackbar--notice"
      }
    end

    def alert_bar
      partial {
        partial :snackbar, "alert_bar", "mdl-snackbar--alert"
      }
    end

    def snackbar id, custom_class
      partial {
        div id: id, class: "mdl-js-snackbar mdl-snackbar #{custom_class}" do
          div class: "mdl-snackbar__text"
          div class: "mdl-snackbar__action"
        end
      }
    end

    def action_config(user_id)
      {
        type: "link",
        text: "delete",
        path: "delete_demo_user_path",
        params: { id: user_id },
        method: "delete",
        success: { users: "rerender" }
      }
    end

  end
end
