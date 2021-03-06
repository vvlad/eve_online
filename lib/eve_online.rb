# frozen_string_literal: true

require 'eve_online/version'

# Exceptions
require 'eve_online/exceptions/base'
require 'eve_online/exceptions/timeout_exception'
require 'eve_online/exceptions/unauthorized_exception'
require 'eve_online/exceptions/invalid_character_id_exception'

# ESI API
require 'eve_online/esi/base'

require 'eve_online/esi/character'
require 'eve_online/esi/character_portrait'
require 'eve_online/esi/character_skills'
require 'eve_online/esi/character_skill_queue'
require 'eve_online/esi/character_loyalty_points'
require 'eve_online/esi/character_wallet'
require 'eve_online/esi/character_wallet_journal'
require 'eve_online/esi/character_assets'
require 'eve_online/esi/character_attributes'
require 'eve_online/esi/character_industry_jobs'
require 'eve_online/esi/character_clones'
require 'eve_online/esi/character_implants'
require 'eve_online/esi/character_blueprints'
require 'eve_online/esi/character_standings'
require 'eve_online/esi/character_fatigue'
require 'eve_online/esi/character_online'
require 'eve_online/esi/character_orders'
require 'eve_online/esi/character_bookmarks'
require 'eve_online/esi/character_bookmark_folders'
require 'eve_online/esi/character_notifications'
require 'eve_online/esi/character_calendar'

require 'eve_online/esi/market_history'

require 'eve_online/esi/corporation'
require 'eve_online/esi/corporation_industry_jobs'
require 'eve_online/esi/corporation_blueprints'
require 'eve_online/esi/corporation_orders'

require 'eve_online/esi/alliances'
require 'eve_online/esi/alliance'
require 'eve_online/esi/alliance_corporations'
require 'eve_online/esi/alliance_icon'
require 'eve_online/esi/alliances_names'

require 'eve_online/esi/dogma_attributes'
require 'eve_online/esi/dogma_attribute'

require 'eve_online/esi/server_status'
require 'eve_online/esi/races'
require 'eve_online/esi/bloodlines'
require 'eve_online/esi/factions'
require 'eve_online/esi/ancestries'
require 'eve_online/esi/universe_types'
require 'eve_online/esi/universe_type'

require 'eve_online/esi/models/base'
require 'eve_online/esi/models/loyalty_point'
require 'eve_online/esi/models/skill_queue_entry'
require 'eve_online/esi/models/skill'
require 'eve_online/esi/models/asset'
require 'eve_online/esi/models/online'
require 'eve_online/esi/models/attributes'
require 'eve_online/esi/models/character'
require 'eve_online/esi/models/industry_job'
require 'eve_online/esi/models/character_portrait'
require 'eve_online/esi/models/character_order'
require 'eve_online/esi/models/blueprint'
require 'eve_online/esi/models/bookmark'
require 'eve_online/esi/models/bookmark_folder'
require 'eve_online/esi/models/standing'
require 'eve_online/esi/models/fatigue'
require 'eve_online/esi/models/notification'
require 'eve_online/esi/models/event'
require 'eve_online/esi/models/type'
require 'eve_online/esi/models/jump_clone'
require 'eve_online/esi/models/wallet_journal_entry'
require 'eve_online/esi/models/corporation_order'
require 'eve_online/esi/models/home_location'
require 'eve_online/esi/models/server_status'

require 'eve_online/esi/models/market_history'

require 'eve_online/esi/models/corporation'

require 'eve_online/esi/models/alliance'
require 'eve_online/esi/models/alliance_short'
require 'eve_online/esi/models/alliance_icon'

require 'eve_online/esi/models/dogma_attribute'

require 'eve_online/esi/models/race'
require 'eve_online/esi/models/bloodline'
require 'eve_online/esi/models/faction'
require 'eve_online/esi/models/ancestry'

module EveOnline
end
