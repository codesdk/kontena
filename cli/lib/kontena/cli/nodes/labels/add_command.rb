module Kontena::Cli::Nodes::Labels
  class AddCommand < Kontena::Command
    include Kontena::Cli::Common

    parameter "NODE", "Node name"
    parameter "LABEL ...", "Labels"

    requires_current_master
    requires_current_master_token
    requires_current_grid

    def execute
      node = client.get("nodes/#{current_grid}/#{self.node}")
      data = { labels: (Array(node['labels']) + label_list).uniq }
      client.put("nodes/#{node['id']}", data)
    end
  end
end
