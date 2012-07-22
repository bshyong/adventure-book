module ApplicationHelper
  include Authentication::HelperMethods

  def fb_graph_url
    'http://github.com/nov/fb_graph'
  end

  def fb_graph_sample_url
    'http://github.com/nov/fb_graph_sample'
  end
      
  def random_spacing
     (rand(4)*500) * (rand() < 0.5 ? -1 : 1)
  end

end
