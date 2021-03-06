#
# Cookbook Name:: wincleanmgr
# Recipe:: default
#
# Copyright 2013, Nathan Faulkner
#
# All rights reserved - Do Not Redistribute
#
include_recipe "windows"

#roll up a batch file to install Disk Cleanup (using sysnative in path due to 32 bit ruby environment path quirks to avoid syswow64 path redirection)

case node['os_version']
when "6.1.7600", "6.1.7601"
  windows_batch "installcleanmgr" do
    code <<-'EOH'
    copy C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe %systemroot%\Sysnative\cleanmgr.exe
    copy C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.1.7600.16385_en-us_b9cb6194b257cc63\cleanmgr.exe.mui %systemroot%\Sysnative\en-US\cleanmgr.exe.mui
    EOH
  action :run
  not_if do File.exists?("#{ENV['systemroot']}\\Sysnative\\cleanmgr.exe") end
  end
when "6.3.9600"
  windows_batch "installcleanmgr" do
    code <<-'EOH'
    copy C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.3.9600.16384_none_5e02966c3182d7a7\cleanmgr.exe %systemroot%\Sysnative\cleanmgr.exe
    copy C:\Windows\WinSxS\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.3.9600.16384_en-us_4e94cff86c9dcc30\cleanmgr.exe.mui %systemroot%\Sysnative\en-US\cleanmgr.exe.mui
    EOH
  action :run
  not_if do File.exists?("#{ENV['systemroot']}\\Sysnative\\cleanmgr.exe") end
  end
end

