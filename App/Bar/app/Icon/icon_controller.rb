require 'rho/rhocontroller'
require 'helpers/browser_helper'

class IconController < Rho::RhoController
  include BrowserHelper
  # GET /Icon
  def index
    @icons = Icon.find(:all,:order=>"created_at")
    $region_id = @params['id']
    puts "REgion ID:#{$region_id}"
    cond1 = {
          :conditions => { 
            {
              :name => 'region_id', 
              :op => '='
            } => $region_id
          }   
    }
    @events = Event.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['name','filename'])
    cond1 = {
      :conditions => {
      {
      :name => 'event_id_id',
      :op => '='
      } => $region_id
      }
    }
    @ads = Advertisement.find(:all,:conditions=>[cond1],:op=>"AND",:select => ['image','link'])
    if @ads.any?
      $ad_image = @ads[0].image
      $website_link = @ads[0].link
    else
      $ad_image =""
    end

    render :back => '/app'
  end

end
