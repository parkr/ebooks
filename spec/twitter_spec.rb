require 'spec_helper'

module Ebooks
  describe Twitter do
    it 'trunacates text correctly' do
      c = Config.new File.join(File.dirname(__FILE__), 'fixtures/config/ebooks')

      t = Twitter.new c

      t.text = 'Bacon ipsum dolor amet esse laborum sirloin tri-tip consectetur excepteur short loin irure eu. Ham ribeye occaecat, hamburger prosciutto consequat veniam sed irure ut nisi'

      expect(t.text).to eq 'Bacon ipsum dolor amet esse laborum sirloin tri-tip consectetur excepteur short loin irure eu. Ham ribeye occaecat, hamburger prosciutto'
    end
  end
end
