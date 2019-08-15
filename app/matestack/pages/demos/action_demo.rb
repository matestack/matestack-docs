module Pages
  module Demos

    class ActionDemo < Matestack::Ui::Page

      def prepare
        @users = DemoUser.all
      end

      def response
        components {
          div class: "page-heading" do
           custom_row do
              custom_col desktop: 8, offset: { desktop: 2} do
                div class: "page-content" do
                  heading size: 2, text: "Action Demo"
                  heading size: 5, text: "Handle user interaction dynamically without JavaScript"
                end
              end
            end
          end
         custom_row do
            custom_col desktop: 8, offset: { desktop: 2} do
              div class: "demo" do
                partial :demo_part
              end
            end
          end
         custom_row do
            custom_col desktop: 8, offset: { desktop: 2} do
              custom_md path: "markdown/demos/action_demo"
            end
          end
        }
      end

      def demo_part
        partial {
          div class: "mdl-grid" do
            div class: "mdl-cell" do
              heading size: 4, text: "Demo"
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
              action action_config(user)
            end
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
end
