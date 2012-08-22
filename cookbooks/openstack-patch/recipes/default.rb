#
# Cookbook Name:: openstack-patch
# Recipe:: default
#
# Copyright 2012, Gamewave, Inc.
#
# All rights reserved - Do Not Redistribute
#


case node[:platform]
when "centos"
  include_recipe "selinux::disabled"

  remote_file "/tmp/pssh-2.3-1.el6.rf.noarch.rpm" do
    source "ftp://fr2.rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/pssh-2.3-1.el6.rf.noarch.rpm"
    action :create_if_missing
  end

  rpm_package "/tmp/pssh-2.3-1.el6.rf.noarch.rpm" do
    action :install
  end
end
