class DashboardController < ApplicationController
  before_filter :require_authentication
  
  def show   

    # @posts = current_user.profile.home 
    
   #@user = FbGraph::User.fetch('bshyong', :access_token => current_user.access_token )   
   #  @photos = FbGraph::Query.new('SELECT pid, src_big, caption, created FROM photo WHERE pid IN (SELECT pid FROM photo_tag WHERE subject=me()) AND pid IN ( SELECT pid FROM photo_tag WHERE subject=1248270527)').fetch(current_user.access_token)
          
  end      
  
  def display      
    
    id = params[:userText]
    id ||= '536280087'
       
    @user = FbGraph::User.fetch('legend.of.mirage', :access_token => current_user.access_token )   

    @photos = FbGraph::Query.new("SELECT pid, src_big, caption, created FROM photo WHERE pid IN (SELECT pid FROM photo_tag WHERE subject=me()) AND pid IN ( SELECT pid FROM photo_tag WHERE subject=#{id}) limit 15").fetch(current_user.access_token)
    @events =  FbGraph::Query.new('select name, start_time, pic, description,location from event where eid in (select eid from event_member where uid=me()) limit 5').fetch(current_user.access_token) 
    @her = FbGraph::User.fetch('pudjeeb', :access_token => current_user.access_token)
    @herMusic = @her.music
    @music = @user.music | @her.music
    @music.shuffle!
    @movies = @user.movies.shuffle

    render :layout => false
  end    
  
  def display1  
       
    @user = FbGraph::User.fetch('bshyong', :access_token => current_user.access_token )   

    @photos = FbGraph::Query.new('SELECT pid, src_big, caption, created FROM photo WHERE pid IN (SELECT pid FROM photo_tag WHERE subject=me()) AND pid IN ( SELECT pid FROM photo_tag WHERE subject=1248270527)').fetch(current_user.access_token)
    @events =  FbGraph::Query.new('select name, start_time, pic, description,location from event where eid in (select eid from event_member where uid=706053441)').fetch(current_user.access_token) 
    @her = FbGraph::User.fetch('kentchen915', :access_token => current_user.access_token)
    @herMusic = @her.music
    @music = @user.music | @her.music
    @music.shuffle!
    @movies = @user.movies.shuffle
    @books = @user.books 
    @checkins = @user.checkins

    render :layout => false
  end
  
  def display2  
       
    @user = FbGraph::User.fetch('bshyong', :access_token => current_user.access_token )   

    @photos = FbGraph::Query.new('SELECT pid, src_big, caption, created FROM photo WHERE pid IN (SELECT pid FROM photo_tag WHERE subject=me()) AND pid IN ( SELECT pid FROM photo_tag WHERE subject=1248270527)').fetch(current_user.access_token)
    @events =  FbGraph::Query.new('select name, start_time, pic, description,location from event where eid in (select eid from event_member where uid=706053441)').fetch(current_user.access_token) 
    @her = FbGraph::User.fetch('kentchen915', :access_token => current_user.access_token)
    @herMusic = @her.music
    @music = @user.music | @her.music
    @music.shuffle!
    @movies = @user.movies.shuffle
    @books = @user.books 
    @checkins = @user.checkins

    render :layout => false
  end

end
