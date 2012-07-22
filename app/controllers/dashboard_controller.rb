class DashboardController < ApplicationController
  before_filter :require_authentication
  
  def show   

     @posts = current_user.profile.home 
    
     @user = FbGraph::User.fetch('bshyong', :access_token => current_user.access_token )   
     @photos = FbGraph::Query.new('SELECT pid, src_big, caption, created FROM photo WHERE pid IN (SELECT pid FROM photo_tag WHERE subject=me()) AND pid IN ( SELECT pid FROM photo_tag WHERE subject=1248270527)').fetch(current_user.access_token)
          
  end      
  
  def display  
       
    @user = FbGraph::User.fetch('bshyong', :access_token => current_user.access_token )   

    @photos = FbGraph::Query.new('SELECT pid, src_big, caption, created FROM photo WHERE pid IN (SELECT pid FROM photo_tag WHERE subject=me()) AND pid IN ( SELECT pid FROM photo_tag WHERE subject=1248270527)').fetch(current_user.access_token)
    @events =  FbGraph::Query.new('select name, start_time, pic, description,location from event where eid in (select eid from event_member where uid=1084230387)').fetch(current_user.access_token) 


    render :layout => false
  end

end
