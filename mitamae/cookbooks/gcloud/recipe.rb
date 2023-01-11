cask 'google-cloud-sdk'

execute "update gcloud components" do
    command "gcloud components update"
    user: 'root'
end

execute "install gke auth plugin for gcloud" do
    command "gcloud components install gke-gcloud-auth-plugin"
    user: 'root'
end