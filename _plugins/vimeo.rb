# A plugin for embedding videos from Vimeo using a simple Liquid tag, ie: {% vimeo 12345678 %}.
# Based of the Youtube plugin from http://www.portwaypoint.co.uk/jekyll-youtube-liquid-template-tag-gist/

module Jekyll
  class Vimeo < Liquid::Tag
    def initialize(name, id, tokens)
      super
      splitup = id.gsub(/\s+/m, ' ').strip.split(" ")
      @id = splitup[0] 
      @type = splitup[1] 
    end

    def render(context)
      %(<div class="videocontainer #{@type}"><iframe src="http://player.vimeo.com/video/#{@id}?title=0&byline=0&portrait=0" frameborder="0" allowfullscreen class="video"></iframe></div><br>)
    end
  end
end

Liquid::Template.register_tag('vimeo', Jekyll::Vimeo)
