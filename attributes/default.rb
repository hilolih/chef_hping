default['hping']['site_url']  = "http://www.hping.org/"
default['hping']['arch_file'] = "hping3-20051105.tar.gz"

## for tempolary working
default['hping']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'hping')
default['hping']['configure_flags'] = ' --prefix=/usr/local'
