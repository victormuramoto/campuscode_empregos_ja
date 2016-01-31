module CarouselHelper
  def carousel_for(jobs)
    Carousel.new(self,jobs).html
end

  class Carousel

    attr_accessor :uid
    def initialize(view, jobs)
      @view, @jobs = view, jobs
      @uid = SecureRandom.hex(6)
    end

    def html
      content = view.safe_join([indicators, slides, controls])
      view.content_tag(:div, content, class: 'carousel slide', id: @uid)
    end


  private

    attr_accessor :view, :jobs

    delegate :link_to, :content_tag, :image_tag, :attachment_url, :safe_join, to: :view

    def indicators
      items = jobs.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
     options = {
       class: (index.zero? ? 'active' : ''),
       data: {
         target: uid,
         slide_to: index
       }
     }

     content_tag(:li, '', options)
    end

    def slides
      items = jobs.map.with_index { |job, index| slide_tag(job, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')
    end

    def slide_tag(job, is_active)
      options = {
        class: (is_active ? 'item active' : 'item'),
      }
      context = []

      #Ok, this is not good, but believe me, it works.
      #If you see me after look this `HTML CODE`, remember me to make it DRY....or just be rude with me lol.
      context << "<div class='info'><p><h2>#{job.title}</h2></p>".html_safe + "<p>Localização: #{job.location}</p>".html_safe + "<p>Empresa:#{job.title}</p>".html_safe + "<p>Categoria:#{job.title}</p>".html_safe + "<p>Contrato:#{job.contract.name}</p></div>".html_safe
      if job.company.company_image != nil
        context << image_tag(attachment_url(job.company, :company_image, :fill, 50, 50, format: "jpg"))
      end
      content_tag(:div, safe_join(context), options)
    end

    def controls
        safe_join([control_tag('left'), control_tag('right')])
      end

    def control_tag(direction)
      options = {
        class: "#{direction} carousel-control",
        data: { slide: direction == 'left' ? 'prev' : 'next' }
      }

      icon = content_tag(:i, '', class: "glyphicon glyphicon-chevron-#{direction}")
      control = link_to(icon, "##{uid}", options)
    end
  end
end
