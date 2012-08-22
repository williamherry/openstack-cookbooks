#
# Cookbook Name:: rsyslog
# Recipe:: openstack
#
# Copyright 2012, Rackspace US, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

template "/etc/rsyslog.d/35-server-per-host.conf" do
  source "35-server-per-host.conf_openstack.erb"
  backup false
  variables(
    :log_dir => node["rsyslog"]["log_dir"],
    :per_host_dir => node["rsyslog"]["per_host_dir"],
    :nova_facility => node["nova"]["syslog"]["facility"].split('_').last.downcase,
    :glance_facility => node["glance"]["syslog"]["facility"].split('_').last.downcase,
    :keystone_facility => node["keystone"]["syslog"]["facility"].split('_').last.downcase
  )
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[rsyslog]", :immediately
end
