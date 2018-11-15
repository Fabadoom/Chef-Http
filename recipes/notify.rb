include_recipe 'chef_handler'

Chef.event_handler do 
  on :run_started do 
    http_request 'notify_run_start' do
      url 'http://teamcity.com:8111/httpAuth/app/rest/buildQueue'
      message '<build><buildType id="Mesh_Test_NotifyBuildCompletion"/></build>'
      headers ({
        'AUTHORIZATION' => "Basic #{Base64.encode64('obfuscate:obfuscate')}",
        'CONTENT-TYPE' => 'application/xml'
        })
      action :post
    end
  end
end
