# -*- encoding: utf-8 -*-

module WatchTower
  module CLI
    module Install

      def self.included(base)
        base.send :include, InstanceMethods
      end

      module InstanceMethods
        def self.included(base)
          base.class_eval <<-END, __FILE__, __LINE__ + 1
            # This module needs Thor::Actions
            include ::Thor::Actions

            # Mappings (aliases)
            map "-i" => :install

            # Install WatchTower
            desc "install", "Install Watch Tower"
            def install
              # Install the configuration file
              install_config_file
              # Install the bootloader
              install_bootloader
            end

            # Install bootloader
            desc "install_bootloader", "Install Watch Tower's bootloader"
            method_option :force,
              type: :boolean,
              required: false,
              aliases: "-f",
              default: false,
              desc: "Force the installation of the bootloader"
            def install_bootloader
              # Install the bootloader
              install_bootloader_on_os
            end

            # Load bootloader
            desc "load_bootloader", "Load Watch Tower's bootloader"
            def load_bootloader
              # Load the bootloader
              load_bootloader_on_os
            end

            # Unload bootloader
            desc "unload_bootloader", "Unload Watch Tower's bootloader"
            def unload_bootloader
              # Unload the bootloader
              unload_bootloader_on_os
            end

            # Load bootloader
            desc "reload_bootloader", "Reload Watch Tower's bootloader"
            def reload_bootloader
              # Reload the bootloader
              reload_bootloader_on_os
            end

            protected
              # Install the configuration file
              def install_config_file
                self.class.source_root(TEMPLATE_PATH)
                copy_file 'config.yml', File.join(USER_PATH, 'config.yml')
              end

              # Install bootloader
              def install_bootloader_on_os
                require 'rbconfig'
                case RbConfig::CONFIG['target_os']
                when /darwin/
                  install_bootloader_on_mac
                when /linux/
                  install_bootloader_on_linux
                else
                  puts bootloader_not_supported_on_current_os
                end
              end

              # Install bootloader on Mac OS X
              def install_bootloader_on_mac
                self.class.source_root(TEMPLATE_PATH)
                create_file bootloader_path_on_mac, force: options[:force] do
                  template = File.expand_path(find_in_source_paths('watchtower.plist.erb'))
                  ERB.new(File.read(template)).result(binding)
                end

                puts "\nCreated. Now run:\n  watchtower load_bootloader\n\n"
              end

              # Install bootloader on linux
              def install_bootloader_on_linux
                require 'cronedit'
                # Remove any old entries
                uninstall_bootloader_on_linux
                # Define the crontab command
                crontab_command = "\#{ruby_binary} \#{watch_tower_binary} start --bootloader"
                # Create a crontab instance
                crontab = CronEdit::Crontab.new
                # Add the command
                crontab.add Time.now.strftime('%s'), { minute: "@reboot", hour: '', day: '', month: '', weekday: '', command: crontab_command }
                # Commit changes
                crontab.commit
              end

              # Uninstall bootloader on linux
              def uninstall_bootloader_on_linux
                require 'cronedit'
                # Create a crontab instance
                crontab = CronEdit::Crontab.new
                # Iterate over crontab entries and remove any command having watchtower start
                crontab.list.each_pair do |k, c|
                  if c =~ /watchtower start/
                    crontab.remove(k)
                  end
                end
                # Commit changes
                crontab.commit
              end

              # Returns the absolute path to the ruby binary
              #
              # @return [String] The path to ruby
              def ruby_binary
                WatchTower.which('ruby')
              end

              # Returns the absolute path to the watchtower binary
              #
              # @return [String] The path to watch tower binary
              def watch_tower_binary
                File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'bin', 'watchtower'))
              end

              # Load bootloader
              def load_bootloader_on_os
                require 'rbconfig'
                case RbConfig::CONFIG['target_os']
                when /darwin/
                  load_bootloader_on_mac
                else
                  puts bootloader_not_supported_on_current_os
                end
              end

              # Unload bootloader
              def unload_bootloader_on_os
                require 'rbconfig'
                case RbConfig::CONFIG['target_os']
                when /darwin/
                  unload_bootloader_on_mac
                else
                  puts bootloader_not_supported_on_current_os
                end
              end

              # Reload bootloader
              def reload_bootloader_on_os
                require 'rbconfig'
                case RbConfig::CONFIG['target_os']
                when /darwin/
                  reload_bootloader_on_mac
                else
                  puts bootloader_not_supported_on_current_os
                end
              end
              # Load the bootloader
              def load_bootloader_on_mac
                system "launchctl load \#{bootloader_path_on_mac}"
              end

              # Unload the bootloader
              def unload_bootloader_on_mac
                system "launchctl unload \#{bootloader_path_on_mac}"
              end

              # Reload the bootloader
              def reload_bootloader_on_mac
                # Unload bootloader
                unload_bootloader_on_mac
                # Load bootloader
                load_bootloader_on_mac
              end

              # Returns the path of the bootloader on mac
              #
              # @return [String] The path to the bootloader
              def bootloader_path_on_mac
                File.join(ENV['HOME'], 'Library', 'LaunchAgents', 'fr.technogate.WatchTower.plist')
              end

              def bootloader_not_supported_on_current_os
                <<-MSG
WatchTower bootloader is not supported on your OS, you'd have to run it manually
for the time being. Support for many editors and many OSes is planned for the
future, if you would like to help, or drop in an issue please don't hesitate to
do so on the project's Github page: https://github.com/TechnoGate/watch_tower
MSG
              end
          END
        end
      end
    end
  end
end
