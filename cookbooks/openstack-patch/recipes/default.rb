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

  cookbook_file "/tmp/pssh-2.3-1.el6.rf.noarch.rpm" do
    source "pssh-2.3-1.el6.rf.noarch.rpm"
    action :create_if_missing
  end

  rpm_package "/tmp/pssh-2.3-1.el6.rf.noarch.rpm" do
    action :install
  end

  # remove rabbitmq-server cause we will install from another place
  package "rabbitmq-server" do
    action :remove
  end
end
