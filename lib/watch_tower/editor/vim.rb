# -*- encoding: utf-8 -*-

require 'open3'

module WatchTower
  module Editor
    class Vim
      include BasePs

      VIM_EXTENSION_PATH = File.join(EDITOR_EXTENSIONS_PATH, 'watchtower.vim')

      def initialize
        # Get the list of supported vims
        supported_vims
      end

      # Return the name of the Editor
      #
      # @return [String] The editor's name
      def name
        "ViM"
      end

      # Return the version of the editor
      #
      # @return [String] The editor's version
      def version
        version = nil
        if is_running?
          Open3.popen2 "#{editor} --version" do |stdin, stdout, wait_thr|
            version = stdout.read.scan(/^VIM - Vi IMproved (\d+\.\d+).*/).first.first
          end
        end

        version
      end

      # Is it running ?
      #
      # @return [Boolean] Is ViM running ?
      def is_running?
        servers && servers.any?
      end

      # Return the open documents of all vim servers
      #
      # @return [Array] Absolute paths to all open documents
      def current_paths
        if is_running?
          # Init documents
          documents = []
          servers.each do |server|
            stdin, stdout, stderr, wait_thr = Open3.popen3 "#{editor} --servername #{server} --remote-expr 'watchtower#ls()'"

            if stderr.read =~ /Invalid expression received: Send expression failed/i
              # Close the pipes
              [stdin, stdout, stderr].each { |p| p.try(:close) }
              # Send the extenstion to the ViM server
              send_extensions_to_editor
              # Ask ViM for the documents again
              stdin, stdout, stderr, wait_thr = Open3.popen3 "#{editor} --servername #{server} --remote-expr 'watchtower#ls()'"
            end

            documents += stdout.read.split("\n")

            # Close the pipes
            [stdin, stdout, stderr].each { |p| p.try(:close) }
          end

          documents.uniq
        end
      end

      protected
      # Return a list of supported vim commands
      #
      # @return [Array] A list of supported vim commands.
      def supported_vims
        @vims ||= ['mvim', 'gvim', 'vim'].collect do |vim|
          # Get the absolute path of the command
          vim_path = WatchTower.which(vim)
          # Print the help of the command
          stdin, stdout, wait_thr = Open3.popen2 "#{vim_path} --help" if vim_path
          # This command is compatible if it exists and if it respond to --remote
          r = vim_path && (vim != 'vim' || stdout.read =~ %r(--remote)) ? vim_path : nil
          # Close the pipes
          [stdin, stdout].each { |p| p.try(:close) }
          r
        end.reject { |vim| vim.nil? }
      end

      # Return the editor
      #
      # @return [String|nil] The editor command
      def editor
        @vims && @vims.any? && @vims.first
      end

      # Returns the running servers
      #
      # @return [Array] Name of running ViM Servers
      def servers
        servers = nil
        # Tell vim to print the server list
        Open3.popen2 "#{editor} --serverlist" do |stdin, stdout, wait_thr|
          # Read the server list
          servers = stdout.read.split("\n")
        end
        servers
      end

      # Send WatchTower extensions to vim
      def send_extensions_to_editor
        servers.each do |server|
          # Tell vim to source the extensions
          stdin, stdout, wait_thr = Open3.popen2 "#{editor} --servername #{server} --remote-send '<ESC>:source #{VIM_EXTENSION_PATH}<CR>'"
          # Close the pipes
          [stdin, stdout].each { |p| p.try(:close) }
        end
      end
    end
  end
end
