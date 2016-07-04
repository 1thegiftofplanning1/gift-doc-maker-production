ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
       column do
         panel "Import from Wufoo" do
           ul do
               li link_to("Pull People from Wufoo",  pull_from_wufoo_admin_people_path )
           end
         end
       end

       column do
         panel "Info" do
           para "The backend"
         end
       end
     end
  end # content
end
