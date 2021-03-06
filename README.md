This is a personal project of mine designed to address the difficulties of discovering good live, local music. Current is an internet radio that creates playlists entirely from artists performing near your zipcode within a 24hr period. Current searches events from venues within 8 miles of your zipcode using the Jambase API, finds those  perfoming artists and selects songs from them. One song from each artist is then sent to the Soundcloud API for playlist creation and streaming. 

##SETUP: 

Clone this repo.  

##OBTAIN YOUR API KEYS  
In order to develop for this app you will need two API keys, one from JamBase and one from Soundcloud.  

###Registering with Soundcloud 
Soundcloud requires you to register an app with them before receiving an API key--do that [here](http://soundcloud.com/you/apps/new).  Please name your app **"current-github-YOUR-GITHUB-USERNAME"**.  


###Registering with JamBase  
To register with Jambase you will need to apply for a Mashery account and an API key [here](http://developer.jambase.com/).
	
At the "JamBase Developer Network Application Registration" form, please provide the following details:

*Name of your application* 
Please name your application the same as your Soundcloud account, **"current-github-YOUR-GITHUB-USERNAME"**.

*What type of application are you building?* 
**Web application with client-side calls.**

*How many people do you anticipate will use you application?*  
**100-1000.**

*Is your application commercial?*  
**No.**

*Does your application run advertising?*  
**No.**

*What is your preferred protocol?*  
**REST**

*What is your preferred output format?*  
**JSON**

When you have completed this form click the button **"Issue a new key for Jambase V3 API"**, agree to the terms of service, and register your application.


##LOCAL CONFIGURATION

1. Add your Jambase API key to **jam_base.rb**.  Please remove my key and add your own.   
	
	`uri = URI("http://api.jambase.com/events?zipCode=#{zip}&radius=8&startDate=#{start_time}&endDate=#{end_time}&page=0&api_key=YOUR_API_KEY_HERE")`

2. Add your Soundcoud API key (client id, NOT your client secret key) to both **song.rb** and **sound_cloud.rb**:  
	
	`CLIENT = Soundcloud.new(:client_id => 'YOUR_SOUNDCLOUD_API_KEY',`

3. Add your secret key to your bash profile: 
	`$ .open ~/.bash_profile` 
		Paste in your secret key.  It should look something like this: 
		
	`export
		SOUNDCLOUD_APIKEY=YOUR_SECRET_KEY_DIGITS_HERE` 

4. Restart your bash profile for the changes to take effect. 

5. From inside the local repo: `$ bundle install`

6. Migrate your database: `$ rake db:migrate`


##THINGS TO KNOW AS A USER AND/OR CONTRIBUTOR
- Enter your zipcode in the text field.  Current searches local music venues within 8 miles of your zip code for artists scheduled within 24hrs.  If you don't get any results try a different zip code.  

- Autoplay is disabled on mobile (a caveat of the soundcloud widget API).

- Currently there is no skip/next track button.  To skip a track click towards the end of the soundwave and let it finish the track.  
 
###Ideas for future iterations
- Skip track
- "Next Track" display (combined with Skip Track perhaps)
- Dynamic zip radius 
- Google Maps for venue location/directions
- International zip lookup
