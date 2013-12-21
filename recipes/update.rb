include_recipe "homebrew::default"

self.extend(Homebrew::Mixin)

homebrew_go = "#{Chef::Config[:file_cache_path]}/homebrew_go"
owner = homebrew_owner

Chef::Log.debug("Homebrew owner is '#{homebrew_owner}'")

package 'git' do
  not_if "which git"
end

execute "update homebrew from github" do
  user owner
  command "/usr/local/bin/brew update || true"
end