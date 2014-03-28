set['apache']['listen_ports'] = %w(8080)
set['apache']['contact'] = 'devops@evertrue.com'

set['et_verify_app']['deploy_to'] = '/var/www/verify.evertrue.com'
set['et_verify_app']['docroot'] = "#{node['et_verify_app']['deploy_to']}/current"

domain_prefix = ''
domain_prefix = "#{node.chef_environment}-" if node.chef_environment != 'prod'

set['et_verify_app']['server_name'] = "#{domain_prefix}verify.evertrue.com"

# Set Apache modules to enable
set['apache']['default_modules'] = %w(
  status
  alias
  auth_basic
  authn_file
  authz_default
  authz_groupfile
  authz_host
  authz_user
  dir
  env
  mime
  setenvif
  deflate
  expires
  headers
  rewrite
)

# mod_status Allow list, space separated list of allowed entries
set['apache']['status_allow_list'] = '127.0.0.1 localhost ip6-localhost'
# Set ExtendedStatus to true to supply MeetMe New Relic plugin w/ metrics
set['apache']['ext_status'] = true
