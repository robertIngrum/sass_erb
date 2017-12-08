module SassErb
  module ScssERB
    class Parser < Sass::SCSS::Parser
      # This is rough pseudo code, need to iron it out a bit
      def process_erb(text, node)
        length           = text.length
        comment_start    = @scanner.pos - text.length
        index_before_erb = @scanner.string.rindex('<%', comment_start) || -1
        offset           = comment_start - index_before_erb

        start_pos = Sass::Source::Position.new(length, offset)
        # TODO: Need to create ERBNode
        erb       = node(SassERB::Tree::ERBNode.new(text), start_pos)

        node << erb
      end
    end
  end
end
