require 'spec_helper'

module Ebooks
  describe Twitter do
    it 'truncates text correctly' do
      c = Config.new File.join(File.dirname(__FILE__), 'fixtures/config/ebooks')
      t = Twitter.new c
      t.text = 'Bacon ipsum dolor amet esse laborum sirloin tri-tip consectetur excepteur short loin irure eu. Ham ribeye occaecat, hamburger prosciutto consequat veniam sed irure ut nisi'

      expect(t.text).to eq 'Bacon ipsum dolor amet esse laborum sirloin tri-tip consectetur excepteur short loin irure eu. Ham ribeye occaecat, hamburger prosciutto'
    end

    it 'can be initialized with no text' do
      c = Config.new File.join(File.dirname(__FILE__), 'fixtures/config/ebooks')
      t = Twitter.new c

      expect(t.text).to eq nil
    end

    it 'can be initialized with some text' do
      c = Config.new File.join(File.dirname(__FILE__), 'fixtures/config/ebooks')
      t = Twitter.new c, 'Words words words'

      expect(t.text).to eq 'Words words words'
    end

    it 'can have its text set later' do
      c = Config.new File.join(File.dirname(__FILE__), 'fixtures/config/ebooks')
      t = Twitter.new c
      t.text = 'Rspec rspec rspec'

      expect(t.text).to eq 'Rspec rspec rspec'
    end

    it 'can have its text changed' do
      c = Config.new File.join(File.dirname(__FILE__), 'fixtures/config/ebooks')
      t = Twitter.new c, "I'm forever blowing bubbles"
      t.text = 'Pretty bubbles in the air'

      expect(t.text).to eq 'Pretty bubbles in the air'
    end
  end
end
