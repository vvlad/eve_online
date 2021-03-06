# EveOnline ESI API.

[![Gem Version](https://badge.fury.io/rb/eve_online.svg)](https://badge.fury.io/rb/eve_online)
[![Gem Downloads](https://img.shields.io/gem/dt/eve_online.svg)](https://rubygems.org/gems/eve_online)
[![Test Coverage](https://codeclimate.com/github/biow0lf/eve_online/badges/coverage.svg)](https://codeclimate.com/github/biow0lf/eve_online/coverage)
[![Build Status](https://travis-ci.org/biow0lf/eve_online.svg?branch=master)](https://travis-ci.org/biow0lf/eve_online)
[![Dependency Status](https://gemnasium.com/biow0lf/eve_online.svg)](https://gemnasium.com/biow0lf/eve_online)
[![security](https://hakiri.io/github/biow0lf/eve_online/master.svg)](https://hakiri.io/github/biow0lf/eve_online/master)

This gem implement Ruby API for EveOnline MMORPG (ESI).

This gem was extracted from [EveMonk](http://evemonk.com). Source code of evemonk backend published [here](https://github.com/biow0lf/evemonk).

## TOC

* [Installation](#installation)
* [Supported ruby versions](#supported-ruby-versions)
* [Usage](#usage)
* [Useful links](#useful-links)
* [Development](#development)
* [Contributing](#contributing)
* [TODO](#todo)
* [Author](#author)
* [Contributors. Thank you everyone!](#contributors-thank-you-everyone)
* [License](#license)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eve_online'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eve_online

## Supported ruby versions

 * MRI 2.3
 * MRI 2.4
 * MRI 2.5
 * MRI (head)
 * JRuby 9.1.16.0
 * JRuby (head)

## Supported rails versions

 * 4.2
 * 5.0
 * 5.1
 * 5.2
 * Edge

## Usage examples

### Alliance

#### List all alliances

```ruby
alliances = EveOnline::ESI::Alliances.new

alliances.scope # => nil

alliances.alliances.size # => 3013

alliances.alliances.first # => 1354830081
```

#### Get alliance information

```ruby
options = { alliance_id: 99005443 }

alliance = EveOnline::ESI::Alliance.new(options)

alliance.scope # => nil

alliance.as_json # => {:name=>"Kids With Guns Alliance",
                 #     :ticker=>"-KWG-",
                 #     :creator_id=>94195096,
                 #     :creator_corporation_id=>98306624,
                 #     :executor_corporation_id=>98306624,
                 #     :date_founded=>Sun, 03 May 2015 19:45:17 UTC +00:00,
                 #     :faction_id=>nil}

alliance.name # => "Kids With Guns Alliance"
alliance.ticker # => "-KWG-"
alliance.creator_id # => 94195096
alliance.creator_corporation_id # => 98306624
alliance.executor_corporation_id # => 98306624
alliance.date_founded # => Sun, 03 May 2015 19:45:17 UTC +00:00
alliance.faction_id # => nil
```

#### List alliance's corporations

```ruby
options = { alliance_id: 99005443 }

alliance_corporations = EveOnline::ESI::AllianceCorporations.new(options)

alliance_corporations.scope # => nil

alliance_corporations.corporations.size # => 33

alliance_corporations.corporations.first # => 98134807
```

#### Get alliance icon

```ruby
options = { alliance_id: 99005443 }

alliance_icon = EveOnline::ESI::AllianceIcon.new(options)

alliance_icon.scope # => nil

alliance_icon.as_json # => {:icon_small=>"http://image.eveonline.com/Alliance/99005443_64.png", :icon_medium=>"http://image.eveonline.com/Alliance/99005443_128.png"}

alliance_icon.icon_small # => "http://image.eveonline.com/Alliance/99005443_64.png"
alliance_icon.icon_medium # => "http://image.eveonline.com/Alliance/99005443_128.png"
```

#### Get alliance names

```ruby
options = { alliance_ids: [99005443, 99005443] }

alliances_names = EveOnline::ESI::AlliancesNames.new(options)

alliances_names.scope # => nil

alliances_names.alliances.size # => 2

alliance = alliances_names.alliances.first

alliance.as_json
# => {:alliance_id=>99005443, :alliance_name=>"Kids With Guns Alliance"}

alliance.alliance_id # => 99005443
alliance.alliance_name # => "Kids With Guns Alliance"
```

### Assets

#### Get character assets

```ruby
options = { token: 'token123', character_id: 90729314 }

character_assets = EveOnline::ESI::CharacterAssets.new(options)

character_assets.scope # => "esi-assets.read_assets.v1"

character_assets.assets.size # => 486

asset = character_assets.assets.first

asset.as_json # => {:type_id=>2629,
              #     :location_id=>60008674,
              #     :location_type=>"station",
              #     :item_id=>1006604012678,
              #     :location_flag=>"Hangar",
              #     :is_singleton=>false,
              #     :quantity=>16156}

asset.type_id # => 2629
asset.location_id # => 60008674
asset.location_type # => "station"
asset.item_id # => 1006604012678
asset.location_flag # => "Hangar"
asset.is_singleton # => false
asset.quantity # => 16156

# TODO: add pagination support
```

#### Get character asset locations

#### Get character asset names

#### Get corporation assets

#### Get corporation asset locations

#### Get coporation asset names (typo in swagger)

### Bookmarks

#### List bookmarks

```ruby
options = { token: 'token123', character_id: 90729314 }

character_bookmarks = EveOnline::ESI::CharacterBookmarks.new(options)

character_bookmarks.scope # => "esi-bookmarks.read_character_bookmarks.v1"

character_bookmarks.bookmarks.size # => 20

bookmark = character_bookmarks.bookmarks.first

bookmark.as_json # => {:bookmark_id=>4,
                 #     :folder_id=>5,
                 #     :created=>Mon, 09 Jul 2012 22:38:31 UTC +00:00,
                 #     :label=>"Stargate",
                 #     :notes=>"This is a stargate",
                 #     :location_id=>30003430,
                 #     :creator_id=>2112625428,
                 #     :item_id=>30003496,
                 #     :item_type_id=>5,
                 #     :coordinate_x=>-144951231521.81625,
                 #     :coordinate_y=>164030047870.25558,
                 #     :coordinate_z=>211467631848.1311}

bookmark.bookmark_id # => 4
bookmark.folder_id # => 5
bookmark.created # => Mon, 09 Jul 2012 22:38:31 UTC +00:00
bookmark.label # => "Stargate"
bookmark.notes # => "This is a stargate"
bookmark.location_id # => 30003430
bookmark.creator_id # => 2112625428
bookmark.item_id # => 30003496
bookmark.item_type_id # => 5
bookmark.coordinate_x # => -144951231521.81625
bookmark.coordinate_y # => 164030047870.25558
bookmark.coordinate_z # => 211467631848.1311
```

#### List bookmark folders

```ruby
options = { token: 'token123', character_id: 90729314 }

character_bookmark_folders = EveOnline::ESI::CharacterBookmarkFolders.new(options)

character_bookmark_folders.scope # => "esi-bookmarks.read_character_bookmarks.v1"

character_bookmark_folders.bookmark_folders.size # => 1

bookmark_folder = character_bookmark_folders.bookmark_folders.first

bookmark_folder.as_json # => {:folder_id=>5,
                        #     :name=>"Icecream"}

bookmark_folder.folder_id # => 5
bookmark_folder.name # => "Icecream"
```

#### List corporation bookmarks

#### List corporation bookmark folders

### Calendar

#### List calendar event summaries

```ruby
options = { token: 'token123', character_id: 90729314 }

character_calendar = EveOnline::ESI::CharacterCalendar.new(options)

character_calendar.scope # => "esi-calendar.read_calendar_events.v1"

character_calendar.events.size # => 22

event = character_calendar.events.first

event.as_json # => {:event_id=>1635240,
              #     :event_date=>Tue, 06 Mar 2018 15:00:59 UTC +00:00,
              #     :title=>"Moon extraction for 66-PMM - GoldMine-5-",
              #     :importance=>0,
              #     :event_response=>"not_responded"}

event.event_id # => 1635240
event.event_date # => Tue, 06 Mar 2018 15:00:59 UTC +00:00
event.title # => "Moon extraction for 66-PMM - GoldMine-5-"
event.importance # => 0
event.event_response # => "not_responded"

# TODO: add from_event support
```

#### Get an event

#### Respond to an event

#### Get attendees

### Character

#### Get character's public information

```ruby
options = { character_id: 90729314 }

character = EveOnline::ESI::Character.new(options)

character.scope # => nil

character.as_json
# => {:corporation_id=>1000168, :birthday=>Fri, 15 Jan 2010 15:26:00 UTC +00:00, :name=>"Green Black", :gender=>"male", :race_id=>2, :bloodline_id=>4, :description=>"", :alliance_id=>12345678, :ancestry_id=>24, :security_status=>1.8694881661345457, :faction_id=>500001}

character.corporation_id # => 1000168
character.birthday # => Fri, 15 Jan 2010 15:26:00 UTC +00:00
character.name # => "Green Black"
character.gender # => "male"
character.race_id # => 2
character.bloodline_id # => 4
character.description  # => ""
character.alliance_id # => 12345678
character.ancestry_id # => 24
character.security_status # => 1.8694881661345457
character.faction_id # => 500001
```

#### Get agents research

#### Get blueprints

```ruby
options = { token: 'token123', character_id: 90729314 }

character_blueprints = EveOnline::ESI::CharacterBlueprints.new(options)

character_blueprints.scope # => "esi-characters.read_blueprints.v1"

character_blueprints.blueprints.size # => 4

blueprint = character_blueprints.blueprints.first

blueprint.as_json # => {:item_id=>716338097,
                  #     :location_flag=>"Hangar",
                  #     :location_id=>61000032,
                  #     :material_efficiency=>10,
                  #     :quantity=>-2,
                  #     :runs=>300,
                  #     :time_efficiency=>0,
                  #     :type_id=>1010}

blueprint.item_id # => 716338097
blueprint.location_flag # => "Hangar"
blueprint.location_id # => 61000032
blueprint.material_efficiency # => 10
blueprint.quantity # => -2
blueprint.runs # => 300
blueprint.time_efficiency # => 0
blueprint.type_id # => 1010

# TODO: add pagination support
```

#### Get chat channels

#### Get corporation history

#### Calculate a CSPA charge cost

#### Get jump fatigue

```ruby
options = { token: 'token123', character_id: 90729314 }

character_fatigue = EveOnline::ESI::CharacterFatigue.new(options)

character_fatigue.scope # => "esi-characters.read_fatigue.v1"

character_fatigue.as_json # => {:jump_fatigue_expire_date=>nil, :last_jump_date=>nil, :last_update_date=>nil}

character_fatigue.jump_fatigue_expire_date # => nil
character_fatigue.last_jump_date # => nil
character_fatigue.last_update_date # => nil

# TODO: add real data here
```

#### Get medals

#### Get character notifications

```ruby
options = { token: 'token123', character_id: 90729314 }

character_notifications = EveOnline::ESI::CharacterNotifications.new(options)

character_notifications.scope # => "esi-characters.read_notifications.v1"

character_notifications.notifications.size # => 500

notification = character_notifications.notifications.first

notification.as_json # => {:notification_id=>774328832,
                     #     :type=>"AllWarDeclaredMsg",
                     #     :sender_id=>1000125,
                     #     :sender_type=>"corporation",
                     #     :timestamp=>Thu, 01 Mar 2018 13:48:00 UTC +00:00,
                     #     :is_read=>nil,
                     #     :text=>"againstID: 99005443\ncost: 0\ndeclaredByID: 98442842\ndelayHours: 24\nhostileState: 0\n"}

notification.notification_id # => 774328832
notification.type # => "AllWarDeclaredMsg"
notification.sender_id # => 1000125
notification.sender_type # => "corporation"
notification.timestamp # => Thu, 01 Mar 2018 13:48:00 UTC +00:00
notification.text # => "againstID: 99005443\ncost: 0\ndeclaredByID: 98442842\ndelayHours: 24\nhostileState: 0\n"
```

#### Get new contact notifications

#### Get character portraits

```ruby
options = { character_id: 90729314 }

character_portrait = EveOnline::ESI::CharacterPortrait.new(options)

character_portrait.scope # => nil

character_portrait.as_json
# => {:small=>"http://image.eveonline.com/Character/90729314_64.jpg", :medium=>"http://image.eveonline.com/Character/90729314_128.jpg", :large=>"http://image.eveonline.com/Character/90729314_256.jpg", :huge=>"http://image.eveonline.com/Character/90729314_512.jpg"}

character_portrait.small # => "http://image.eveonline.com/Character/90729314_64.jpg"
character_portrait.medium # => "http://image.eveonline.com/Character/90729314_128.jpg"
character_portrait.large # => "http://image.eveonline.com/Character/90729314_256.jpg"
character_portrait.huge # => "http://image.eveonline.com/Character/90729314_512.jpg"
```

#### Get character corporation roles

#### Get standings

```ruby
options = { token: 'token123', character_id: 90729314 }

character_standing = EveOnline::ESI::CharacterStandings.new(options)

character_standing.scope # => "esi-characters.read_standings.v1"

character_standing.standings.size # => 37

standing = character_standing.standings.first

standing.as_json # => {:from_id=>500001, :from_type=>"faction", :standing=>0.3303719111639991}

standing.from_id # => 500001
standing.from_type # => "faction"
standing.standing # => 0.3303719111639991
```

#### Yearly aggregate stats

#### Get character corporation titles

#### Character affiliation

#### Get character names

### Clones

#### Get clones

```ruby
options = { token: 'token123', character_id: 90729314 }

character_clones = EveOnline::ESI::CharacterClones.new(options)

character_clones.scope # => "esi-clones.read_clones.v1"

character_clones.last_clone_jump_date # => Fri, 27 Jul 2012 14:50:11 UTC +00:00

character_clones.home_location.as_json # => {:location_id=>61000032, :location_type=>"station"}

character_clones.jump_clones.size # => 2

jump_clone = character_clones.jump_clones.first

jump_clone.as_json
# => {:jump_clone_id=>22357400, :name=>nil, :location_id=>61000032, :location_type=>"station", :implants=>[22118]}

jump_clone.jump_clone_id # => 22357400
jump_clone.name # => nil
jump_clone.location_id # => 61000032
jump_clone.location_type # => "station"
jump_clone.implants # => [22118]

character_clones.last_station_change_date # => Tue, 30 Jun 2015 21:51:13 UTC +00:00
```

#### Get active implants

```ruby
options = { token: 'token123', character_id: 90729314 }

character_implants = EveOnline::ESI::CharacterImplants.new(options)

character_implants.scope # => "esi-clones.read_implants.v1"

character_implants.implants.size # => 5

character_implants.implants # => [9899, 9941, 9942, 9943, 9956]
```

### Contacts

#### Get alliance contacts

#### Delete contacts

#### Get contacts

#### Add contacts

#### Edit contacts

#### Get contact labels

#### Get corporation contacts

### Contracts

#### Get contracts

#### Get contract bids

#### Get contract items

#### Get coporation contracts (typo in swagger)

#### Get corporation contract bids

#### Get corporation contract items

### Corporation

#### Get corporation information

```ruby
options = { corporation_id: 98468592 }

corporation = EveOnline::ESI::Corporation.new(options)

corporation.scope # => nil

corporation.as_json
# => {:name=>"Bullshit Bingo Club",
#     :ticker=>"BUBIC",
#     :member_count=>60,
#     :ceo_id=>1721864142,
#     :alliance_id=>99001258,
#     :description=>"",
#     :tax_rate=>0.1,
#     :date_founded=>Mon, 11 Jul 2016 14:22:17 UTC +00:00,
#     :creator_id=>1721864142,
#     :corporation_url=>"http://",
#     :faction_id=>nil,
#     :home_station_id=>60011893,
#     :shares=>1000}

corporation.name # => "Bullshit Bingo Club"
corporation.ticker # => "BUBIC"
corporation.member_count # => 60
corporation.ceo_id # => 1721864142
corporation.alliance_id # => 99001258
corporation.description # => ""
corporation.tax_rate # => 0.1
corporation.date_founded # => Mon, 11 Jul 2016 14:22:17 UTC +00:00
corporation.creator_id # => 1721864142
corporation.corporation_url # => "http://"
corporation.faction_id # => nil
corporation.home_station_id # => 60011893
corporation.shares # => 1000
```

#### Get alliance history

#### Get corporation blueprints

```ruby
options = options = { token: 'token123', corporation_id: 98260237 }

corporation_blueprints = EveOnline::ESI::CorporationBlueprints.new(options)

corporation_blueprints.scope # => "esi-corporations.read_blueprints.v1"

corporation_blueprints.blueprints.size # => 387

blueprint = corporation_blueprints.blueprints.first

blueprint.as_json # => {:item_id => 1007566533085,
                  #     :location_flag => "CorpSAG2",
                  #     :location_id => 1024637025781,
                  #     :material_efficiency => 10,
                  #     :quantity => -2,
                  #     :runs => 300,
                  #     :time_efficiency => 20,
                  #     :type_id => 31803}

blueprint.item_id # => 1007566533085
blueprint.location_flag # => "CorpSAG2"
blueprint.location_id # => 1024637025781
blueprint.material_efficiency # => 10
blueprint.quantity # => -2
blueprint.runs # => 300
blueprint.time_efficiency # => 20
blueprint.type_id # => 31803

# TODO: add pagination
```

#### Get all corporation ALSC logs

#### Get corporation divisions

#### Get corporation facilities

#### Get corporation icon

#### Get corporation medals

#### Get corporation issued medals

#### Get corporation members

#### Get corporation member limit

#### Get corporation's members' titles

#### Track corporation members

#### Get corporation outposts

#### Get corporation outpost details

#### Get corporation member roles

#### Get corporation member roles history

#### Get corporation shareholders

#### Get corporation standings

#### Get corporation starbases (POSes)

#### Get starbase (POS) detail

#### Get corporation structures

#### Get corporation titles

#### Get corporation names

#### Get npc corporations

### Dogma

#### Get attributes

```ruby
dogma_attributes = EveOnline::ESI::DogmaAttributes.new

dogma_attributes.scope # => nil

dogma_attributes.attributes.size # => 2385

dogma_attributes.attributes.first # => 2
```

#### Get attribute information

```ruby
options = { attribute_id: 2 }

dogma_attribute = EveOnline::ESI::DogmaAttribute.new(options)

dogma_attribute.scope # => nil

dogma_attribute.as_json # => {:id=>2,
                        #     :name=>"isOnline",
                        #     :description=>"Boolean to store status of online effect",
                        #     :icon_id=>nil,
                        #     :default_value=>0.0,
                        #     :published=>nil,
                        #     :display_name=>"",
                        #     :unit_id=>nil,
                        #     :stackable=>true,
                        #     :high_is_good=>true}

dogma_attribute.id # => 2
dogma_attribute.name # => "isOnline"
dogma_attribute.description # => "Boolean to store status of online effect"
dogma_attribute.icon_id # => nil
dogma_attribute.default_value # => 0.0
dogma_attribute.published # => nil
dogma_attribute.display_name # => ""
dogma_attribute.unit_id # => nil
dogma_attribute.stackable # => true
dogma_attribute.high_is_good # => true
```

#### Get effects

#### Get effect information

### Faction Warfare

#### Overview of a character involved in faction warfare

#### Overview of a corporation involved in faction warfare

#### List of the top factions in faction warfare

#### List of the top pilots in faction warfare

#### List of the top corporations in faction warfare

#### An overview of statistics about factions involved in faction warfare

#### Ownership of faction warfare systems

#### Data about which NPC factions are at war

### Fittings

#### Get fitting

#### Create fitting

#### Delete fitting

### Fleets

#### Get character fleet info

#### Get fleet information

#### Update fleet

#### Get fleet members

#### Create fleet invitation

#### Kick fleet member

#### Move fleet member

#### Delete fleet squad

#### Rename fleet squad

#### Get fleet wings

#### Create fleet wing

#### Delete fleet wing

#### Rename fleet wing

#### Create fleet squad

### Incursions

#### List incursions

### Industry

#### List character industry jobs

```ruby
options = { token: 'token123', character_id: 90729314 }

character_jobs = EveOnline::ESI::CharacterIndustryJobs.new(options)

character_jobs.scope => # => "esi-industry.read_character_jobs.v1"

character_jobs.jobs.size # => 3

job = character_jobs.jobs.first

job.as_json # => {:activity_id=>5,
            #     :blueprint_id=>1024839597103,
            #     :blueprint_location_id=>1023579231924,
            #     :blueprint_type_id=>28607,
            #     :completed_character_id=>nil,
            #     :completed_date=>nil,
            #     :cost=>902034.0,
            #     :duration=>625697,
            #     :end_date=>Sat, 25 Nov 2017 16:04:31 UTC +00:00,
            #     :facility_id=>1023579231924,
            #     :installer_id=>93997721,
            #     :job_id=>344732396,
            #     :licensed_runs=>1,
            #     :output_location_id=>1023579231924,
            #     :pause_date=>nil,
            #     :probability=>1.0,
            #     :product_type_id=>28607,
            #     :runs=>2,
            #     :start_date=>Sat, 18 Nov 2017 10:16:14 UTC +00:00,
            #     :station_id=>1023579231924,
            #     :status=>"active",
            #     :successful_runs=>nil}

job.activity_id # => 5
job.blueprint_id # => 1024839597103
job.blueprint_location_id # => 1023579231924
job.blueprint_type_id # => 28607
job.completed_character_id # => nil
job.completed_date # => nil
job.cost # => 902034.0
job.duration # => 625697
job.end_date # => Sat, 25 Nov 2017 16:04:31 UTC +00:00
job.facility_id # => 1023579231924
job.installer_id # => 93997721
job.job_id # => 344732396
job.licensed_runs # => 1
job.output_location_id # => 1023579231924
job.pause_date # => nil
job.probability # => 1.0
job.product_type_id # => 28607
job.runs # => 2
job.start_date # => Sat, 18 Nov 2017 10:16:14 UTC +00:00
job.station_id # => 1023579231924
job.status # => "active"
job.successful_runs # => nil
```

#### Character mining ledger

#### Moon extraction timers

#### Corporation mining observers

#### Observed corporation mining

#### List corporation industry jobs

```ruby
options = { token: 'token123', corporation_id: 98146630 }

corporation_jobs = EveOnline::ESI::CorporationIndustryJobs.new(options)

corporation_jobs.scope # => "esi-industry.read_corporation_jobs.v1"

corporation_jobs.jobs.size # => 23

job = corporation_jobs.jobs.first

job.as_json # => {:activity_id=>1,
            #     :blueprint_id=>1026042055832,
            #     :blueprint_location_id=>1024956764558,
            #     :blueprint_type_id=>28607,
            #     :completed_character_id=>nil,
            #     :completed_date=>nil,
            #     :cost=>19505804.0,
            #     :duration=>424816,
            #     :end_date=>Thu, 23 Nov 2017 09:20:30 UTC +00:00,
            #     :facility_id=>1023579231924,
            #     :installer_id=>93174304,
            #     :job_id=>344736432,
            #     :licensed_runs=>1,
            #     :output_location_id=>1024956764558,
            #     :pause_date=>nil,
            #     :probability=>1.0,
            #     :product_type_id=>28606,
            #     :runs=>1,
            #     :start_date=>Sat, 18 Nov 2017 11:20:14 UTC +00:00,
            #     :station_id=>nil,
            #     :status=>"active",
            #     :successful_runs=>nil}

job.activity_id # => 1
job.blueprint_id # => 1026042055832
job.blueprint_location_id # => 1024956764558
job.job.blueprint_type_id # => 28607
job.completed_character_id # => nil
job.completed_date # => nil
job.cost # => 19505804.0
job.duration # => 424816
job.end_date # => Thu, 23 Nov 2017 09:20:30 UTC +00:00
job.facility_id # => 1023579231924
job.installer_id # => 93174304
job.job_id # => 344736432
job.licensed_runs # => 1
job.output_location_id # => 1024956764558
job.pause_date # => nil
job.probability # => 1.0
job.product_type_id # => 28606
job.runs # => 1
job.start_date # => Sat, 18 Nov 2017 11:20:14 UTC +00:00
job.station_id # => nil
job.status # => "active"
job.successful_runs # => nil

# TODO: add pagination support
```

#### List industry facilities

#### List solar system cost indices

### Insurance

#### List insurance levels

### Killmails

#### Get character kills and losses

#### Get corporation kills and losses

#### Get a single killmail

### Location

#### Get character location

#### Get character online

```ruby
options = { token: 'token123', character_id: 90729314 }

character_online = EveOnline::ESI::CharacterOnline.new(options)

character_online.scope # => "esi-location.read_online.v1"

character_online.as_json
# => {:online=>false, :last_login=>Sun, 15 Jan 2017 11:39:24 UTC +00:00, :last_logout=>Sun, 15 Jan 2017 11:31:22 UTC +00:00, :logins=>370}

character_online.online  # => false
character_online.last_login # => Sun, 15 Jan 2017 11:39:24 UTC +00:00
character_online.last_logout # => Sun, 15 Jan 2017 11:31:22 UTC +00:00
character_online.logins # => 370
```

#### Get current ship

### Loyalty

#### Get loyalty points

```ruby
options = { token: 'token123', character_id: 90729314 }

character_loyalty_points = EveOnline::ESI::CharacterLoyaltyPoints.new(options)

character_loyalty_points.scope # => "esi-characters.read_loyalty.v1"

character_loyalty_points.loyalty_points.size # => 5

loyalty_point = character_loyalty_points.loyalty_points.first

loyalty_point.as_json # => {:corporation_id=>1000035, :loyalty_points=>14163}

loyalty_point.corporation_id # => 1000035
loyalty_point.loyalty_points # => 14163
```

#### List loyalty store offers

### Mail

#### Return mail headers

#### Send a new mail

#### Delete a mail

#### Return a mail

#### Update metadata about a mail

#### Get mail labels and unread counts

#### Create a mail label

#### Delete a mail label

#### Return mailing list subscriptions

### Market

#### List open orders from a character

```ruby
options = { token: 'token123', character_id: 90729314 }

character_orders = EveOnline::ESI::CharacterOrders.new(options)

character_orders.scope

character_orders.orders.size

order = character_orders.orders.first

order.as_json

order.order_id
order.type_id
order.region_id
order.location_id
order.range
order.is_buy_order
order.price
order.volume_total
order.volume_remain
order.issued
order.state
order.min_volume
order.account_id
order.duration
order.is_corp
order.escrow

# TODO: update example
```

#### List historical orders by a character

#### List open orders from a corporation

```ruby
options = { token: 'token123', corporation_id: 1000168 }

corporation_orders = EveOnline::ESI::CorporationOrders.new(options)

corporation_orders.scope

corporation_orders.orders.size

order = corporation_orders.orders.first

order.as_json

order.order_id
order.type_id
order.region_id
order.location_id
order.range
order.is_buy_order
order.price
order.volume_total
order.volume_remain
order.issued
order.state
order.min_volume
order.wallet_division
order.duration
order.escrow

# TODO: update example

# TODO: add pagination support
```

#### List historical orders from a corporation

#### List historical market statistics in a region

```ruby
options = { region_id: 10000002, type_id: 28606 }

market_history = EveOnline::ESI::MarketHistory.new(options)

market_history.scope # => nil

statistics = market_history.history

statistics.size # => 417

stats_today = statistics.last

stats_today.as_json # => {:date=>Fri, 24 Nov 2017 00:00:00 UTC +00:00,
                    #     :order_count=>52,
                    #     :volume=>52,
                    #     :highest=>769999999.99,
                    #     :average=>754702326.19,
                    #     :lowest=>701100002.49}

stats_today.date # => Fri, 24 Nov 2017 00:00:00 UTC +00:00
stats_today.order_count # => 52
stats_today.volume # => 52
stats_today.highest # => 769999999.99
stats_today.average # => 754702326.19
stats_today.lowest # => 701100002.49
```

#### List orders in a region

#### List type IDs relevant to a market

#### Get item groups

#### Get item group information

#### List market prices

#### List orders in a structure

### Opportunities

#### Get a character's completed task

#### Get opportunities groups

#### Get opportunities group

#### Get opportunities tasks

#### Get opportunities task

### Planetary Interaction

#### Get colonies

#### Get colony layout

#### List corporation customs offices

#### Get schematic information

### Routes

#### Get route

### Search

#### Search on a string (search for something in character stuff)

#### Search on a string

### Skills

#### Get character attributes

```ruby
options = { token: 'token123', character_id: 90729314 }

character_attributes = EveOnline::ESI::CharacterAttributes.new(options)

character_attributes.scope # => "esi-skills.read_skills.v1"

character_attributes.as_json # => {:charisma=>20,
                             #     :intelligence=>24,
                             #     :memory=>24,
                             #     :perception=>23,
                             #     :willpower=>23,
                             #     :bonus_remaps=>2,
                             #     :last_remap_date=>Sat, 07 May 2011 12:58:06 UTC +00:00,
                             #     :accrued_remap_cooldown_date=>Sun, 06 May 2012 12:58:06 UTC +00:00}

character_attributes.charisma # => 20
character_attributes.intelligence # => 24
character_attributes.memory # => 24
character_attributes.perception # => 23
character_attributes.willpower # => 23
character_attributes.bonus_remaps # => 2
character_attributes.last_remap_date # => Sat, 07 May 2011 12:58:06 UTC +00:00
character_attributes.accrued_remap_cooldown_date # => Sun, 06 May 2012 12:58:06 UTC +00:00
```

#### Get character's skill queue

```ruby
options = { token: 'token123', character_id: 90729314 }

character_skill_queue = EveOnline::ESI::CharacterSkillQueue.new(options)

character_skill_queue.scope # => "esi-skills.read_skillqueue.v1"

character_skill_queue.skills.size # => 50

skill_queue_entry = character_skill_queue.skills.first

skill_queue_entry.as_json
# => {:skill_id=>12487, :finished_level=>3, :queue_position=>0, :finish_date=>Mon, 16 Jan 2017 03:00:35 UTC +00:00, :start_date=>Sun, 15 Jan 2017 11:38:25 UTC +00:00, :training_start_sp=>7263, :level_end_sp=>40000, :level_start_sp=>7072}

skill_queue_entry.skill_id # => 12487
skill_queue_entry.finished_level # => 3
skill_queue_entry.queue_position # => 0
skill_queue_entry.finish_date # => Mon, 16 Jan 2017 03:00:35 UTC +00:00
skill_queue_entry.start_date # => Sun, 15 Jan 2017 11:38:25 UTC +00:00
skill_queue_entry.training_start_sp # => 7263
skill_queue_entry.level_end_sp # => 40000
skill_queue_entry.level_start_sp # => 7072
```

#### Get character skills

```ruby
options = { token: 'token123', character_id: 90729314 }

character_skills = EveOnline::ESI::CharacterSkills.new(options)

character_skills.scope # => "esi-skills.read_skills.v1"

character_skills.total_sp # => 50362576
character_skills.unallocated_sp # => 656000

character_skills.as_json # => {:total_sp=>50362576, :unallocated_sp=>656000}

character_skills.skills.size # => 179

skill = character_skills.skills.first

skill.as_json
# => {:skill_id=>22536, :skillpoints_in_skill=>500, :trained_skill_level=>1, :active_skill_level=>0}

skill.skill_id # => 22536
skill.skillpoints_in_skill # => 500
skill.trained_skill_level # => 1
skill.active_skill_level # => 0
```

### Sovereignty

#### List sovereignty campaigns

#### List sovereignty of systems

#### List sovereignty structures

### Status

#### Retrieve the uptime and player counts

```ruby
server_status = EveOnline::ESI::ServerStatus.new

server_status.scope # => nil

server_status.as_json # => {:start_time=>Tue, 11 Apr 2017 11:05:35 UTC +00:00, :players=>34545, :server_version=>"1135520", :vip=>nil}

server_status.start_time # => Tue, 11 Apr 2017 11:05:35 UTC +00:00
server_status.players # => 34545
server_status.server_version # => "1135520"
server_status.vip # => nil
```

### Universe

#### Get ancestries

```ruby
ancestries = EveOnline::ESI::Ancestries.new

ancestries.scope # => nil

ancestries.ancestries.size # => 42

ancestry = ancestries.ancestries.first

ancestry.as_json # => {:ancestry_id=>24,
                 #     :name=>"Slave Child",
                 #     :bloodline_id=>4,
                 #     :description=>"Millions of slaves within the Amarr Empire dream of escape...",
                 #     :short_description=>"Torn from the cold and brought to the warmth of a new life.",
                 #     :icon_id=>1664}

ancestry.ancestry_id # => 24
ancestry.name # => "Slave Child"
ancestry.bloodline_id # => 4
ancestry.description # => "Millions of slaves within the Amarr Empire dream of escape..."
ancestry.short_description # => "Torn from the cold and brought to the warmth of a new life."
ancestry.icon_id # => 1664

# TODO: add languages
```

#### Get bloodlines

```ruby
bloodlines = EveOnline::ESI::Bloodlines.new

bloodlines.scope # => nil

bloodlines.bloodlines.size # => 15

bloodline = bloodlines.bloodlines.first

bloodline.as_json # => {:bloodline_id=>4,
                  #     :name=>"Brutor",
                  #     :description=>"A martial, strong-willed people, the Brutor...",
                  #     :race_id=>2,
                  #     :ship_type_id=>588,
                  #     :corporation_id=>1000049,
                  #     :perception=>9,
                  #     :willpower=>7,
                  #     :charisma=>6,
                  #     :memory=>4,
                  #     :intelligence=>4}

bloodline.bloodline_id # => 4
bloodline.name # => "Brutor"
bloodline.description # => "A martial, strong-willed people, the Brutor..."
bloodline.race_id # => 2
bloodline.ship_type_id # => 588
bloodline.corporation_id # => 1000049
bloodline.perception # => 9
bloodline.willpower # => 7
bloodline.charisma # => 6
bloodline.memory # => 4
bloodline.intelligence # => 4

# TODO: add languages
```

#### Get item categories

#### Get item category information

#### Get constellations

#### Get constellation information

#### Get factions

```ruby
factions = EveOnline::ESI::Factions.new

factions.scope # => nil

factions.factions.size # => 22

faction = factions.factions.first

faction.as_json # => {:faction_id=>500002,
                #     :name=>"Minmatar Republic",
                #     :description=>"The Minmatar Republic was formed over a century ago when the Minmatar threw...",
                #     :solar_system_id=>30002544,
                #     :corporation_id=>1000051,
                #     :militia_corporation_id=>1000182,
                #     :size_factor=>5.0,
                #     :station_count=>570,
                #     :station_system_count=>291,
                #     :is_unique=>true}

faction.faction_id # => 500002
faction.name # => "Minmatar Republic"
faction.description # => "The Minmatar Republic was formed over a century ago when the Minmatar threw..."
faction.solar_system_id # => 30002544
faction.corporation_id # => 1000051
faction.militia_corporation_id # => 1000182
faction.size_factor # => 5.0
faction.station_count # => 570
faction.station_system_count # => 291
faction.is_unique # => true

# TODO: add languages
```

#### Get graphics

#### Get graphic information

#### Get item groups

#### Get item group information

#### Bulk names to IDs

#### Get moon information

#### Get names and categories for a set of ID's

#### Get planet information

#### Get character races

```ruby
races = EveOnline::ESI::Races.new

races.scope # => nil

races.races.size # => 4

race = races.races.first

race.as_json # => {:race_id=>2,
             #     :name=>"Minmatar",
             #     :description=>"Once a thriving tribal civilization, the Minmatar...",
             #     :alliance_id=>500002}

race.race_id # => 2
race.name # => "Minmatar"
race.description # => "Once a thriving tribal civilization, the Minmatar..."
race.alliance_id # => 500002

# TODO: add languages

```

#### Get regions

#### Get region information

#### Get stargate information

#### Get star information

#### Get station information

#### List all public structures

#### Get structure information

#### Get system jumps

#### Get system kills

#### Get solar systems

#### Get solar system information

#### Get types

```ruby
types = EveOnline::ESI::UniverseTypes.new

types.scope # => nil

types.universe_types_ids.size # => 1000

types.universe_types_ids.first # => 0

# TODO: add pagination
```

#### Get type information

```ruby
options = { type_id: 192 }

type = EveOnline::ESI::UniverseType.new(options)

type.scope # => nil

type.as_json # => {:type_id=>192,
             #     :name=>"Phased Plasma M",
             #     :description=>"Medium Projectile Ammo...",
             #     :published=>true,
             #     :group_id=>83,
             #     :market_group_id=>112,
             #     :radius=>1.0,
             #     :volume=>0.0125,
             #     :packaged_volume=>0.0125,
             #     :icon_id=>1297,
             #     :capacity=>0.0,
             #     :portion_size=>100,
             #     :mass=>1.0,
             #     :graphic_id=>1297}

type.type_id # => 192
type.name # => "Phased Plasma M"
type.description # => "Medium Projectile Ammo..."
type.published # => true
type.group_id # => 83
type.market_group_id # => 112
type.radius # => 1.0
type.volume # => 0.0125
type.packaged_volume # => 0.0125
type.icon_id # => 1297
type.capacity # => 0.0
type.portion_size # => 100
type.mass # => 1.0
type.graphic_id # => 1297

# TODO: dogma_attributes
# TODO: dogma_effects
# TODO: add localization
```

### User Interface

#### Set Autopilot Waypoint

#### Open Contract Window

#### Open Information Window

#### Open Market Details

#### Open New Mail Window

### Wallet

#### Get a character's wallet balance

```ruby
options = { token: 'token123', character_id: 90729314 }

character_wallet = EveOnline::ESI::CharacterWallet.new(options)

character_wallet.scope # => "esi-wallet.read_character_wallet.v1"

character_wallet.as_json # => {:wallet=>409488252.49}

character_wallet.wallet # => 409488252.49
```

#### Get character wallet journal

```ruby
options = { token: 'token123', character_id: 90729314 }

character_wallet_journal = EveOnline::ESI::CharacterWalletJournal.new(options)

character_wallet_journal.scope # => "esi-wallet.read_character_wallet.v1"

character_wallet_journal.wallet_journal_entries.size # => 1

wallet_journal_entry = character_wallet_journal.wallet_journal_entries.first

wallet_journal_entry.as_json # => {:date=>Tue, 06 Mar 2018 12:43:50 UTC +00:00,
                             #     :ref_id=>15264764711,
                             #     :ref_type=>"market_escrow",
                             #     :first_party_id=>90729314,
                             #     :first_party_type=>"character",
                             #     :second_party_id=>nil,
                             #     :second_party_type=>nil,
                             #     :amount=>-9.5,
                             #     :balance=>4990.5,
                             #     :reason=>nil,
                             #     :tax_receiver_id=>nil,
                             #     :tax=>nil}

wallet_journal_entry.date # => Tue, 06 Mar 2018 12:43:50 UTC +00:00
wallet_journal_entry.ref_id # => 15264764711
wallet_journal_entry.ref_type # => "market_escrow"
wallet_journal_entry.first_party_id # => 90729314
wallet_journal_entry.first_party_type # => "character"
wallet_journal_entry.second_party_id  # => nil
wallet_journal_entry.second_party_type # => nil
wallet_journal_entry.amount # => -9.5
wallet_journal_entry.balance # => 4990.5
wallet_journal_entry.reason # => nil
wallet_journal_entry.tax_receiver_id # => nil
wallet_journal_entry.tax # => nil
```

#### Get wallet transactions

#### Returns a corporation's wallet balance

#### Get corporation wallet journal

#### Get corporation wallet transactions

### Wars

#### List wars

#### Get war information

#### List kills for a war

## Exceptions

If you want to catch all exceptions `rescue` `EveOnline::Exceptions::Base`. E.g.:

```ruby
begin
  key_id = 1234567
  v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
  options = { character_id: 90729314 }

  account_balance = EveOnline::XML::CharacterAccountBalance.new(key_id, v_code, options)

  account_balance.as_json
rescue EveOnline::Exceptions::Base
  # some logic for handle exception
end
```

If api key (XML) have many characters and you miss `character_id` you will get `EveOnline::Exceptions::InvalidCharacterIDException`.

If api key (XML) invalid (wrong key_id/v_code or key is expired) you will get `EveOnline::Exceptions::UnauthorizedException`. E.g.:

```ruby
begin
  key_id = 1234567
  v_code = '9ce9970b18d07586ead3d052e5b83bc8db303171a28a6f754cf35d9e6b66af17'
  options = { character_id: 90729314 }

  account_balance = EveOnline::XML::CharacterAccountBalance.new(key_id, v_code, options)

  account_balance.as_json
rescue EveOnline::Exceptions::UnauthorizedException
  # some logic for handle exception. e.g. mark api keys as invalid
end
```

Timeout. `EveOnline::Exceptions::TimeoutException`.

## Timeouts

`eve_online` gem uses `faraday` for network request. `faraday` configured with:

```ruby
faraday = Faraday.new

faraday.options.timeout = 60
faraday.options.open_timeout = 60
```

## Useful links

* [BREAKING CHANGES AND YOU - HOW TO USE ALT-ROUTES TO ENHANCE YOUR SANITY](https://developers.eveonline.com/blog/article/breaking-changes-and-you)
* [TECHNICAL NOTE: INTEGER SIZES AND THE XML API](https://developers.eveonline.com/blog/article/technical-note-integer-sizes-and-the-xml-api)
* [THE END OF PUBLIC CREST AS WE KNOW IT](https://developers.eveonline.com/blog/article/the-end-of-public-crest-as-we-know-it)
* [CCP, zKillboard (Eve-Kill), and your API](https://docs.google.com/document/d/16YfJwjhuH5A3cS4NTMDFDkprnOVKsvgtuRIKk8xjTM8/edit)
* [JUMP CLONES, IMPLANTS, SKILLS, AND MORE](https://developers.eveonline.com/blog/article/jump-clones-implants-skills-and-more)
* [ESI Swagger](https://esi.tech.ccp.is/latest/)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Issue reports and pull requests are welcome on GitHub at https://github.com/biow0lf/eve_online.

## Author

* Igor Zubkov (@biow0lf)

## Contributors. Thank you everyone!

* Ian Flynn (@monban)
* Mekaret Eriker (@Mekaret)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
