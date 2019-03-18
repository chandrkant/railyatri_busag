# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 201513051611181) do

  create_table "RY_SCHEDULE_MASTER_TEMP", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "TRAIN_NUMBER", limit: 50
    t.string "TRAIN_NAME"
    t.string "TRAIN_TYPE", limit: 25
    t.string "TRAIN_SOURCE", limit: 25
    t.string "TRAIN_DESTINATION", limit: 25
    t.string "TRAIN_RUN_DAY", limit: 25
    t.integer "TRAIN_DEP_TIME_SRC_Day"
    t.time "TRAIN_DEP_TIME_SRC"
    t.integer "TRAIN_ARR_TIME_DSTN_Day"
    t.time "TRAIN_ARR_TIME_DSTN"
    t.decimal "TOTAL_DISTANCE", precision: 10, scale: 2
    t.string "TRAIN_UP_DOWN_FLAG", limit: 50
    t.date "TRAIN_VALID_FROM"
    t.date "TRAIN_VALID_TO"
  end

  create_table "RY_TIME_TABLE_MASTER_TEMP", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "TRAIN_NUMBER", limit: 50
    t.decimal "Stoppage", precision: 10, scale: 1
    t.string "STATION_CODE", limit: 50
    t.time "ARRIVAL"
    t.time "DEPARTURE"
    t.integer "DAY_OF_JOURNEY"
    t.decimal "DISTANCE_FROM_SOURCE", precision: 10, scale: 2
  end

  create_table "accidents", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "from_station", null: false
    t.string "to_station"
    t.date "date_of_accident"
    t.text "disruption"
    t.integer "death"
    t.integer "injured"
    t.text "others"
    t.text "cause"
    t.text "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "train_number_id"
    t.integer "collid_train_id"
    t.string "train_type"
  end

  create_table "additional_capacities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "additional_offers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "display_ecomm"
    t.decimal "amount", precision: 10, scale: 2
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "user_id"
    t.string "email"
    t.string "addressable_type"
    t.integer "addressable_id"
    t.string "house_no"
    t.string "address1"
    t.string "address2"
    t.string "land_mark"
    t.integer "city_id"
    t.string "city_name"
    t.integer "state_id"
    t.string "state_name"
    t.string "zip_code"
    t.string "phone_no"
    t.string "alternative_phone"
    t.boolean "profile_address", default: false
    t.boolean "active", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["addressable_id"], name: "index_addresses_on_addressable_id"
    t.index ["addressable_type"], name: "index_addresses_on_addressable_type"
  end

  create_table "ads_txts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "adstxt"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", null: false
  end

  create_table "adsinters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "page_id"
    t.string "ads_name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advertisment_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "categorie_type"
  end

  create_table "advertisment_categories_advertisments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "advertisment_id"
    t.integer "advertisment_category_id"
    t.index ["advertisment_category_id"], name: "idx_advertisment_categories_category_id"
  end

  create_table "advertisment_delivery_services", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "advertisment_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advertisment_lead_for_travels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "source_type"
    t.integer "advertisment_category_id"
    t.string "advertisment_lead_name"
    t.string "prospect_mobile_number"
    t.string "station_code"
    t.string "train_number"
    t.datetime "service_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.integer "pick_up"
    t.integer "ad_identifier"
    t.integer "counter"
    t.string "app_id"
  end

  create_table "advertisment_leads", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "prospect_mobile_number"
    t.string "station_code"
    t.string "train_number"
    t.datetime "service_date"
    t.integer "advertisment_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "source_type"
    t.integer "ad_identifier"
    t.integer "counter"
    t.string "advertisment_lead_name"
    t.string "city"
    t.integer "pick_up"
    t.string "app_id"
    t.index ["prospect_mobile_number"], name: "idx_advertisment_leads_prospect_mobile_number"
  end

  create_table "advertisment_specialities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "type_name"
    t.integer "advertisment_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advertisment_specialities_advertisments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "advertisment_id"
    t.integer "advertisment_speciality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advertisment_stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "advertisment_id"
    t.string "station_code"
    t.index ["station_code"], name: "idx_advertisment_stations_station_code"
  end

  create_table "advertisment_sub_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "advertisment_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advertisment_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "advertisment_type"
  end

  create_table "advertisments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_on"
    t.integer "created_by"
    t.integer "advertisment_type_id"
    t.string "advertisment_title"
    t.text "customer_advertisment_text"
    t.text "admin_advertisment_text"
    t.string "advertisment_destination_url"
    t.string "advertisment_destination_number"
    t.string "modified_by"
    t.datetime "modified_on"
    t.string "advertisment_status"
    t.date "start_date"
    t.date "end_date"
    t.string "image_name"
    t.string "email"
    t.string "image_url"
    t.string "term_condition_desc"
    t.integer "advertisment_delivery_service_id"
    t.integer "advertisment_sub_category_id"
    t.string "category_data_type"
    t.integer "category_data_id"
    t.integer "ad_identifier"
    t.decimal "default_rating", precision: 4, scale: 2
  end

  create_table "alert_requests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "train_name"
    t.datetime "departure_date"
    t.string "boarding_station_code"
    t.string "destination_station_code"
    t.string "email"
    t.string "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "train_schedule_id"
    t.date "boarding_date"
    t.string "user_id"
  end

  create_table "algo_user_location_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action", limit: 45
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track", default: false
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.index ["cisr_id"], name: "index_algo_user_location_logs_on_cisr_id"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "alternate_bus_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.string "pnr_number", limit: 45
    t.string "from_station_code"
    t.string "to_station_code"
    t.text "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "android_app_releases", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "version_code", limit: 10
    t.integer "version_number"
    t.string "description", limit: 1000
    t.integer "store_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "is_deleted"
  end

  create_table "anrs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal "anr_counts", precision: 10, scale: 2
    t.decimal "crash_counts", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_request_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "pnr_number"
    t.string "api_name"
    t.text "request_url"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "response"
    t.text "post_params"
    t.string "response_from"
    t.index ["pnr_number"], name: "pnr_number"
    t.index ["response_from"], name: "idx_response_from"
  end

  create_table "apks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "v_name"
    t.string "v_code"
    t.string "apk_type"
    t.string "map_url"
    t.string "apk_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_deep_links", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "activity_name"
    t.text "deep_link"
    t.text "description"
    t.string "parameter"
    t.string "tag"
    t.integer "device_type_id", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_download_reports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "for_date"
    t.integer "android_installs"
    t.integer "reinstalls"
    t.integer "uninstall"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "google_play_st_installs"
    t.integer "uc_web"
    t.integer "uc_web_paid"
    t.integer "referral"
    t.integer "google_play_st_uninstall"
    t.integer "uc_web_uninstall"
    t.integer "uc_web_paid_uninstall"
    t.integer "referral_uninstall"
    t.integer "iOS_installs"
    t.integer "window_installs"
    t.integer "unregistered_play_st"
    t.integer "unregister_ucweb_free", default: 0
    t.integer "unregistered_ucweb_paid", default: 0
    t.integer "total_user", default: 0
    t.integer "random_uc", default: 0
  end

  create_table "app_menu_translations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "app_menu_id"
    t.text "title"
    t.text "meta1"
    t.text "meta2"
    t.text "description"
    t.string "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_menu_id"], name: "index_app_menu_translations_on_app_menu_id"
  end

  create_table "app_menus", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "menu_item"
    t.integer "parent_id"
    t.string "tagline"
    t.string "font_color"
    t.string "deal_box"
    t.text "description"
    t.string "deep_link"
    t.string "device_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.timestamp "image_updated_at"
    t.string "icon_color"
    t.string "menu_item_color"
    t.string "tag"
    t.string "meta1_bck_color"
    t.string "meta2"
    t.string "meta2_color"
    t.string "meta2_bck_color"
    t.integer "android_app_release_id", default: 391
    t.integer "offer_type", default: 0
    t.integer "to_android_app_release_id", default: 0
  end

  create_table "app_nefts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "order_id"
    t.string "ecommerce_type"
    t.string "account_name_holder"
    t.integer "account_number"
    t.integer "retype_account_number"
    t.string "ifsc_code"
    t.float "refund_amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apps", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "userID"
    t.string "app_name", limit: 100
    t.string "from_name", limit: 100
    t.string "from_email", limit: 100
    t.string "reply_to", limit: 100
    t.string "currency", limit: 100
    t.string "delivery_fee", limit: 100
    t.string "cost_per_recipient", limit: 100
    t.string "smtp_host", limit: 100
    t.string "smtp_port", limit: 100
    t.string "smtp_ssl", limit: 100
    t.string "smtp_username", limit: 100
    t.string "smtp_password", limit: 100
    t.integer "bounce_setup", default: 0
    t.integer "complaint_setup", default: 0
    t.string "app_key", limit: 100
    t.integer "allocated_quota", default: -1
    t.integer "current_quota", default: 0
    t.integer "day_of_reset", default: 1
    t.string "month_of_next_reset", limit: 3
    t.string "test_email", limit: 100
  end

  create_table "ares", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 100
    t.integer "type"
    t.integer "list"
    t.string "custom_field", limit: 100
  end

  create_table "ares_emails", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ares_id"
    t.string "from_name", limit: 100
    t.string "from_email", limit: 100
    t.string "reply_to", limit: 100
    t.string "title", limit: 500
    t.text "plain_text", limit: 16777215
    t.text "html_text", limit: 16777215
    t.string "time_condition", limit: 100
    t.string "timezone", limit: 100
    t.integer "created"
    t.integer "recipients", default: 0
    t.text "opens", limit: 4294967295
    t.integer "wysiwyg", default: 0
  end

  create_table "astro_rules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "zodiac_element", limit: 20, collation: "latin1_swedish_ci"
    t.string "day", limit: 20, collation: "latin1_swedish_ci"
    t.string "direction", limit: 20, collation: "latin1_swedish_ci"
    t.text "en_message1", collation: "latin1_swedish_ci"
    t.text "en_message2", collation: "latin1_swedish_ci"
    t.text "en_message3", collation: "latin1_swedish_ci"
    t.text "hi_message1"
    t.text "hi_message2"
    t.text "hi_message3"
    t.integer "ratings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "astro_zodiac_signs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "date_from"
    t.date "date_to"
    t.string "zodiac_sign", limit: 20
    t.string "element", limit: 20
    t.string "zodiac_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authentications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "author_agreements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "author_name"
    t.string "author_email"
    t.text "author_address"
    t.boolean "is_approved", default: false
    t.string "approved_by"
    t.date "approved_date"
    t.string "proof_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author_signature_file_name"
    t.string "author_signature_content_type"
    t.integer "author_signature_file_size"
    t.datetime "author_signature_updated_at"
    t.string "proof_file_name"
    t.string "proof_content_type"
    t.integer "proof_file_size"
    t.datetime "proof_updated_at"
    t.string "ip_details"
  end

  create_table "awis_users", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "uid"
    t.string "provider", limit: 50
    t.string "provider_id"
    t.string "email", limit: 100
    t.string "name", limit: 100
    t.string "oauth_token", default: ""
    t.datetime "oauth_expires_at"
    t.integer "current_status", limit: 1, default: 0, comment: "0=logged_out,1=logged_in, 2=banned,3=admin"
    t.datetime "last_loggedin_at"
  end

  create_table "b2b_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banner_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.string "alt_tag"
    t.string "point_to_url"
    t.integer "priority"
  end

  create_table "bi_available_trips", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "source_city_id"
    t.integer "destination_city_id"
    t.string "source_name", limit: 100
    t.string "destination_name"
    t.integer "provider_rtc_id"
    t.string "rtc", limit: 50
    t.date "journey_date"
    t.text "service_provider_response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["provider_rtc_id"], name: "provider_rtc_id"
  end

  create_table "bitla_booking_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "trip_id", default: 0
    t.string "seat_number", limit: 50
    t.float "fare", limit: 24, default: 0.0
    t.float "our_commission", limit: 24, default: 0.0
    t.float "service_tax", limit: 24, default: 0.0
    t.float "convenience_charge", limit: 24, default: 0.0
    t.float "offer_discount", limit: 24, default: 0.0
    t.float "discount", limit: 24, default: 0.0
    t.float "additional_fare", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ecomm_source_id", default: 1, comment: "1 for ANDROID, 2 for WEB, 3 for IOS, 4 for WINDOWS"
    t.string "layout_id", limit: 50, collation: "latin1_swedish_ci"
    t.string "book_id", limit: 50, collation: "latin1_swedish_ci"
    t.bigint "user_id"
    t.string "tx_id", collation: "latin1_swedish_ci"
    t.float "amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_status", default: 0
    t.text "author_name"
    t.string "book_name"
    t.string "image_url", collation: "latin1_swedish_ci"
    t.integer "page_count", default: 0
    t.string "time_duration", collation: "latin1_swedish_ci"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
  end

  create_table "btb_emp_configured_journeys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number", collation: "utf8_unicode_ci"
    t.string "train_number"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.date "train_boarding_date"
    t.date "train_start_date"
    t.date "train_end_date"
    t.string "mobile_number", collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message_counter", collation: "utf8_unicode_ci"
    t.datetime "scheduled_boarding_time"
    t.datetime "alert_start_time"
    t.string "to_station_code"
    t.string "reserved_upto"
    t.string "total_distance"
    t.string "total_time"
    t.integer "pnr_number_id"
    t.boolean "is_deleted", default: false
    t.string "slip_train_number"
    t.string "slip_from_station_code"
    t.integer "btb_organisation_id"
    t.integer "btb_user_id"
    t.boolean "is_booked_meal", default: false
    t.string "seat_no"
    t.index ["pnr_number"], name: "idx_user_configured_journeys_pnr_number"
    t.index ["train_boarding_date"], name: "idx_user_configured_journeys_train_boarding_date"
    t.index ["train_end_date"], name: "idx_user_configured_journeys_train_end_date"
    t.index ["train_start_date"], name: "idx_user_configured_journeys_train_start_date"
  end

  create_table "btb_invoices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "btb_organisation_id"
    t.integer "btb_user_id"
    t.integer "invoice_id"
    t.integer "ecomm_type"
    t.boolean "is_approved"
    t.string "invoice_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dynamic_field_value"
    t.string "dynamic_field_value_2"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "railyatri_user_id"
    t.string "call_sid"
    t.boolean "is_paid_by_company"
  end

  create_table "btb_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "date"
    t.string "no_of_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "btb_organisations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain_name"
    t.string "site_url"
    t.string "logo_url"
    t.text "address_1"
    t.text "address_2"
    t.string "city"
    t.string "pin"
    t.string "phone"
    t.string "email_id"
    t.string "mobile"
    t.string "city_1"
    t.string "city_2"
    t.string "icon_file_name"
    t.string "icon_content_type"
    t.integer "icon_file_size"
    t.datetime "icon_updated_at"
    t.string "login_url"
    t.boolean "is_active", default: false
    t.string "dynamic_field_name"
    t.string "dynamic_field_name_2"
    t.string "access_key"
  end

  create_table "btb_payment_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tx_id"
    t.integer "pg_res_code"
    t.string "tx_status"
    t.string "pg_tx_no"
    t.string "tx_ref_no"
    t.float "amount", limit: 24
    t.string "payment_mode"
    t.integer "btb_user_id"
    t.integer "btb_emp_configured_journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "btb_save_order_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "invoice_id"
    t.float "order_value", limit: 24
    t.integer "btb_user_id"
    t.integer "btb_emp_configured_journey_id"
    t.integer "payment_type"
    t.float "delivery_charge", limit: 24
    t.float "adjusted_amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "btb_solutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "req_type"
    t.string "person_name"
    t.string "person_email"
    t.string "phone"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "btb_user_carts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "vendor_id"
    t.integer "btb_user_id"
    t.integer "item_id"
    t.integer "btb_organisation_id"
    t.string "item_name"
    t.string "item_image_url"
    t.float "item_price", limit: 24
    t.boolean "is_orderd", default: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pnr_number", limit: 45
    t.integer "item_count"
    t.integer "btb_emp_configured_journey_id"
    t.string "station_code", limit: 45
    t.integer "meal_type"
    t.integer "food_type"
    t.date "delivery_date"
    t.string "real_day_time", limit: 45
    t.float "bulk_order_min_value", limit: 24
  end

  create_table "btb_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "btb_organisation_id"
    t.string "otp_secret_key"
    t.string "mobile_number"
    t.boolean "approved", default: false, null: false
    t.integer "android_app_release_id"
    t.string "os_v_code"
    t.string "os_v_name"
    t.string "employee_id"
    t.string "designation"
    t.string "rp_person"
    t.string "rp_person_mobile"
    t.integer "pay_to_company", default: 0
    t.string "user_name"
    t.boolean "is_active", default: true
    t.boolean "is_approval_require", default: false
    t.string "rp_person_email"
    t.index ["approved"], name: "index_btb_users_on_approved"
    t.index ["email"], name: "index_btb_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_btb_users_on_reset_password_token", unique: true
  end

  create_table "btb_users_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "btb_user_id"
    t.integer "role_id"
    t.index ["btb_user_id", "role_id"], name: "index_btb_users_roles_on_btb_user_id_and_role_id"
  end

  create_table "btbs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "req_type"
    t.string "person_name"
    t.string "person_email"
    t.integer "phone"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bulk_templates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "campaign_name"
    t.integer "campaign_id"
    t.string "octane_template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_amenities", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "amenities_id"
    t.string "amenities_name", default: "null"
    t.integer "provider_id"
    t.string "amenities_img_url"
  end

  create_table "bus_boarding_point_addresses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.string "redbus_trip_id", limit: 100
    t.string "source_city_name", limit: 100
    t.string "destination_city_name", limit: 100
    t.integer "boarding_point_id", default: 0
    t.string "address", limit: 250
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "travel"
    t.string "landmark"
    t.string "bpname"
    t.integer "ac", limit: 1, default: 0
    t.time "arrival_time"
    t.integer "bus_type_id"
    t.time "departure_time"
    t.time "duration_time"
    t.integer "non_ac", limit: 1, default: 0
    t.integer "operator_id"
    t.integer "route_id"
    t.integer "seater", limit: 1
    t.integer "sleeper", limit: 1
    t.string "bus_type"
    t.string "vehicle_type"
  end

  create_table "bus_bp_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.string "redbus_trip_id", limit: 100
    t.integer "boarding_point_id", default: 0
    t.string "address", limit: 250
    t.string "location"
    t.string "landmark"
    t.string "boarding_point_name"
    t.decimal "lat", precision: 15, scale: 10, default: "0.0"
    t.decimal "lng", precision: 15, scale: 10, default: "0.0"
    t.string "station_code"
    t.integer "ry_city_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ry_city_id"], name: "idx_bus_bp_locations_ry_city_id"
  end

  create_table "bus_bp_locations_temps", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", default: 0, null: false
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.string "redbus_trip_id", limit: 100
    t.integer "boarding_point_id", default: 0
    t.string "address", limit: 250
    t.string "location"
    t.string "landmark"
    t.string "boarding_point_name"
    t.decimal "lat", precision: 15, scale: 10, default: "0.0"
    t.decimal "lng", precision: 15, scale: 10, default: "0.0"
    t.string "station_code"
    t.integer "ry_city_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_cancellation_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "event_type"
    t.string "event_name"
    t.string "event_title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_cancellation_histories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bus_trip_id"
    t.integer "bus_cancellation_event_id"
    t.string "title"
    t.text "message"
    t.boolean "show_user", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cancel_policy_details"
    t.text "cancel_ticket_details"
    t.text "cancel_policy_response"
    t.text "cancel_ticket_response"
    t.integer "user_id"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "bus_city_station_mappings", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "station_code"
    t.integer "count"
    t.text "station_name"
    t.text "bus_city_name"
    t.integer "bus_city_id"
    t.integer "count_dup"
    t.integer "number_of_trains"
    t.text "primary"
    t.text "new_city_name"
    t.text "new_city_id"
  end

  create_table "bus_drivers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "age"
    t.string "image"
    t.string "address"
    t.string "known_language"
    t.integer "total_trips"
    t.string "experience"
    t.string "evaluation"
    t.integer "smart_bus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["smart_bus_id"], name: "index_bus_drivers_on_smart_bus_id"
  end

  create_table "bus_failed_confirm_tickets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bus_trip_id"
    t.datetime "journey_date"
    t.integer "provider_id"
    t.integer "status", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status_details"
  end

  create_table "bus_fare_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bus_trip_id"
    t.float "base_fare", limit: 24, default: 0.0
    t.float "markup_fare", limit: 24, default: 0.0
    t.float "markup_fare_percent", limit: 24, default: 0.0
    t.float "operator_service_charge", limit: 24, default: 0.0
    t.float "operator_service_charge_percent", limit: 24, default: 0.0
    t.float "service_tax", limit: 24, default: 0.0
    t.float "service_tax_percent", limit: 24, default: 0.0
    t.integer "provider"
    t.float "actual_base_fare", limit: 24, default: 0.0
    t.float "reduced_base_fare_amt", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "last_row_discount", limit: 24, default: 0.0
    t.float "real_base_fare", limit: 24, default: 0.0
  end

  create_table "bus_feedback_answeres", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "question_id"
    t.boolean "answere"
    t.string "trip_id", limit: 100
    t.integer "user_id"
    t.boolean "status"
    t.integer "bus_trip_id"
    t.integer "operator_id"
    t.integer "provider_id"
    t.string "seat_no"
    t.integer "from_city_id", default: 0
    t.integer "to_city_id", default: 0
    t.time "departure_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["operator_id", "provider_id", "from_city_id", "to_city_id"], name: "idx_operator_id_provider_id_from_city_id_to_city_id"
  end

  create_table "bus_feedback_questions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean "types"
    t.string "image_url"
    t.string "header"
    t.string "color"
    t.string "questions"
    t.boolean "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "parent_id"
    t.boolean "response_type"
  end

  create_table "bus_lowest_fares", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "from_city_id"
    t.integer "to_city_id"
    t.float "lowest_fare", limit: 24
    t.integer "min_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "from_city"
    t.string "to_city"
    t.string "bus_class"
    t.string "boarding_from", limit: 100
    t.string "boarding_to", limit: 100
    t.integer "bus_count"
  end

  create_table "bus_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.date "send_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["send_date"], name: "index_bus_notifications_on_send_date"
    t.index ["user_id"], name: "index_bus_notifications_on_user_id"
  end

  create_table "bus_operator_cancellations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bus_trip_id"
    t.text "screenshot1"
    t.text "screenshot2"
    t.string "contact_person_name"
    t.string "contact_person_phone"
    t.text "comments"
    t.integer "sms", limit: 1, default: 0
    t.integer "phone", limit: 1, default: 0
    t.integer "others", limit: 1, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_operator_coupons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "coupon_id"
    t.integer "provider_id", default: 0
    t.string "operator_id"
    t.float "discount_rate", limit: 24, default: 0.0
    t.float "cb_rate", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_operator_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operator_id", default: 0, comment: "Travel id"
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.string "source_city_name"
    t.string "destination_city_name"
    t.string "operator_name"
    t.string "bus_type"
    t.integer "departure_time", default: 0
    t.integer "arrival_time", default: 0
    t.string "operator_type"
    t.float "convenience_charge", limit: 24, default: 0.0
    t.integer "convenience_type", limit: 1, default: 0
    t.float "max_charge", limit: 24, default: 0.0
    t.text "cancellation_policy"
    t.integer "hour_0"
    t.integer "hour_1"
    t.integer "hour_2"
    t.integer "hour_3"
    t.integer "hour_4"
    t.integer "hour_5"
    t.integer "hour_6"
    t.integer "hour_7"
    t.integer "hour_8"
    t.integer "hour_9"
    t.integer "hour_10"
    t.integer "hour_11"
    t.integer "hour_12"
    t.integer "hour_13"
    t.integer "hour_14"
    t.integer "hour_15"
    t.integer "hour_16"
    t.integer "hour_17"
    t.integer "hour_18"
    t.integer "hour_19"
    t.integer "hour_20"
    t.integer "hour_21"
    t.integer "hour_22"
    t.integer "hour_23"
    t.integer "hour_24"
    t.integer "hour_48"
    t.integer "hour_72"
    t.integer "hour_96"
    t.integer "hour_120"
    t.integer "hour_144"
    t.integer "hour_168"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zero_cancellation_time", default: 0
  end

  create_table "bus_operator_mappings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "bi_operator_id"
    t.string "rb_operator_id"
    t.string "ty_operator_id"
    t.string "its_operator_id"
    t.string "operator_name"
    t.integer "primary_operator"
    t.string "primary_operator_id"
    t.boolean "needs_relook"
    t.string "phone_no"
    t.string "alternate_phoneno"
    t.float "ratings", limit: 24, default: 3.8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary_operator"], name: "idx_bus_operator_mappings_primary_operator"
    t.index ["primary_operator_id"], name: "idx_bus_operator_mappings_primary_operator_id"
  end

  create_table "bus_operators", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operator_id", default: 0, comment: "Travel id"
    t.string "operator_name"
    t.string "bus_type"
    t.string "operator_type"
    t.float "convenience_charge", limit: 24, default: 0.0
    t.integer "convenience_type", limit: 1, default: 0
    t.float "max_charge", limit: 24, default: 0.0
    t.text "cancellation_policy"
    t.float "ry_rating", limit: 24
    t.integer "ry_rating_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "applicable_to_rtc", limit: 1, default: 0
    t.float "last_seat_discount_percent", limit: 24
    t.string "alternate_phoneno", limit: 45
    t.float "max_last_seat_disc", limit: 24
    t.index ["operator_id"], name: "idx_bus_operators_operator_id"
  end

  create_table "bus_popularities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operator_id"
    t.integer "provider_id"
    t.time "departure_time"
    t.integer "no_of_bookings"
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "idx_operator_id"
  end

  create_table "bus_responses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "trip_id", limit: 100, default: "0"
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.date "travel_date"
    t.text "response"
    t.string "bus_fare"
    t.string "duration"
    t.string "departure_time"
    t.string "operator_id"
    t.string "destination_city"
    t.string "source_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_city"], name: "idx_busresp_source_city"
    t.index ["travel_date"], name: "idx_travel_date"
  end

  create_table "bus_responses_all", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "trip_id", limit: 100, default: "0"
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.date "travel_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "response"
    t.string "source_city"
    t.string "destination_city"
    t.string "operator_id"
    t.string "departure_time"
    t.string "duration"
    t.string "bus_fare"
    t.index ["source_city"], name: "idx_busresp_source_city"
    t.index ["travel_date"], name: "idx_travel_date"
    t.index ["trip_id", "travel_date"], name: "idx_trip_id_travel_date"
    t.index ["trip_id"], name: "idx_trip_id"
  end

  create_table "bus_route_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ry_city_id"
    t.integer "city_id"
    t.string "city_name"
    t.integer "status", default: 1, comment: "0 for INACTIVE and 1 for ACTIVE"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "idx_bus_route_cities_city_id"
  end

  create_table "bus_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "source_city_id"
    t.integer "ry_source_city_id"
    t.integer "destination_city_id"
    t.integer "ry_destination_city_id"
    t.integer "bus_min_time"
    t.integer "bus_max_time"
    t.integer "bus_avg_time"
    t.boolean "is_ac_available"
    t.boolean "is_sleeper_available"
    t.string "bus_type"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_city_id"], name: "idx_bus_routes_destination_city_id"
    t.index ["source_city_id"], name: "idx_bus_routes_source_city_id"
  end

  create_table "bus_seat_layouts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "trip_id", null: false
    t.text "seat_layout"
    t.integer "max_cols", default: 0, null: false
    t.integer "max_rows", default: 0, null: false
    t.integer "total_seats", default: 0, null: false
    t.float "min_last_row_price", limit: 24, default: 0.0, null: false
    t.float "last_row_discount", limit: 24, default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "provider_id", null: false
  end

  create_table "bus_service_bp_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.string "redbus_trip_id", limit: 100
    t.integer "boarding_point_id", default: 0
    t.string "address", limit: 250
    t.string "location"
    t.string "landmark"
    t.string "boarding_point_name"
    t.decimal "lat", precision: 15, scale: 10, default: "0.0"
    t.decimal "lng", precision: 15, scale: 10, default: "0.0"
    t.string "station_code"
    t.integer "ry_city_id", default: 0
    t.integer "city_id"
    t.string "city_name"
    t.string "area_name"
    t.time "time"
    t.string "contact_no"
    t.string "address_update_from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boarding_point_id"], name: "idx_bus_service_bp_locations_boarding_point_id"
    t.index ["ry_city_id"], name: "idx_bus_service_bp_locations_ry_city_id"
  end

  create_table "bus_service_operators", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operator_id", default: 0, comment: "Travel id"
    t.string "operator_name"
    t.string "bus_type"
    t.string "operator_type"
    t.float "convenience_charge_percent", limit: 24, default: 0.0
    t.integer "convenience_type", limit: 1, default: 0
    t.float "convenience_charge", limit: 24, default: 0.0
    t.float "max_charge", limit: 24, default: 0.0
    t.text "cancellation_policy"
    t.string "cancellation_time"
    t.string "cancel_based_on_main_dep_allowed"
    t.string "service_tax_percent"
    t.string "schedules_count"
    t.string "round_trip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "last_seat_discount_percent", limit: 24
    t.float "max_last_seat_disc", limit: 24
    t.index ["operator_id"], name: "idx_bus_service_operators_operator_id"
  end

  create_table "bus_service_providers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "provider_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_service_responses", primary_key: ["id", "trip_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1\n/*!50100 PARTITION BY KEY (trip_id)\nPARTITIONS 200 */" do |t|
    t.integer "id", null: false, auto_increment: true
    t.string "trip_id", limit: 100, default: "0", null: false
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.date "travel_date"
    t.text "response"
    t.string "bus_fare"
    t.string "duration"
    t.string "departure_time"
    t.string "operator_id"
    t.string "destination_city"
    t.string "source_city"
    t.boolean "is_cancellable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_date"], name: "idx_travel_date"
    t.index ["trip_id"], name: "idx_trip_id"
  end

  create_table "bus_service_route_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ry_city_id"
    t.integer "city_id"
    t.string "city_name"
    t.integer "status", default: 1, comment: "0 for INACTIVE and 1 for ACTIVE"
    t.integer "rb_city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "idx_bus_service_route_cities_city_id"
  end

  create_table "bus_service_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "source_city_id"
    t.integer "ry_source_city_id"
    t.integer "destination_city_id"
    t.integer "ry_destination_city_id"
    t.integer "bus_min_time"
    t.integer "bus_max_time"
    t.integer "bus_avg_time"
    t.boolean "is_ac_available"
    t.boolean "is_sleeper_available"
    t.string "bus_type"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_city_id"], name: "idx_bus_service_routes_destination_city_id"
    t.index ["source_city_id"], name: "idx_bus_service_routes_source_city_id"
  end

  create_table "bus_service_trip_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "avlble_trip_id", default: 0
    t.string "trip_detail_id"
    t.string "number"
    t.string "service_name"
    t.integer "origin_id", default: 0
    t.integer "destination_id", default: 0
    t.datetime "travel_date"
    t.integer "travel_id", default: 0
    t.string "travels_name"
    t.integer "route_id", default: 0
    t.string "available_seats"
    t.text "description"
    t.time "dep_time"
    t.time "arr_time"
    t.string "duration"
    t.string "bus_type"
    t.text "cost"
    t.string "can_cancel"
    t.string "cancellation_time"
    t.string "cabin_layout"
    t.string "status"
    t.string "is_service_tax_applicable"
    t.string "helpline_number"
    t.integer "total_seats"
    t.text "bus_layout"
    t.string "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_service_trip_passengers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bus_trip_id", default: 0
    t.string "seat_name", limit: 50
    t.string "passenger_title", limit: 10
    t.string "passenger_name", limit: 100
    t.string "address"
    t.string "phone", limit: 50
    t.string "email"
    t.string "gender", limit: 10
    t.string "age", limit: 10
    t.string "id_number", limit: 45
    t.string "id_type", limit: 45
    t.integer "primary"
    t.float "fare", limit: 24, default: 0.0
    t.float "convenience_charge", limit: 24, default: 0.0
    t.integer "ladies_seat", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_service_trips", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "redbus_trip_id", limit: 100, default: "0"
    t.string "block_key", limit: 20
    t.string "ticket_no", limit: 100
    t.integer "boarding_point_id", default: 0
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.time "boarding_time"
    t.time "arrival_time"
    t.time "departure_time"
    t.string "bus_type"
    t.integer "coupon_id"
    t.float "trip_fare", limit: 24, default: 0.0
    t.float "discount", limit: 24, default: 0.0
    t.float "convenience_charge", limit: 24, default: 0.0
    t.float "total_fare", limit: 24, default: 0.0
    t.integer "operator_id", default: 0
    t.string "bus_operator_name"
    t.integer "from_city_id_ry", default: 0
    t.integer "to_city_id_ry", default: 0
    t.integer "railyatri_user_id", default: 0
    t.datetime "date_of_issue"
    t.datetime "journey_date"
    t.datetime "arrival_date"
    t.string "inventory_id"
    t.integer "partial_cancellation_allowed", limit: 1, default: 0
    t.string "pickup_contact_no"
    t.string "pickup_location_address"
    t.string "pickup_location"
    t.integer "pickup_location_id", default: 0
    t.string "pickup_location_landmark"
    t.float "service_charge", limit: 24, default: 0.0
    t.string "train_pnr_number", limit: 20
    t.string "bus_pnr_number", limit: 50
    t.string "bus_tin", limit: 50
    t.string "trip_status", limit: 50
    t.text "cancellation_policy"
    t.float "cancellation_charge", limit: 24, default: 0.0
    t.integer "status", default: 0, comment: "0 for BLOCKED, 1 COMPLETED, 2 CANCELLED"
    t.string "cancel_from"
    t.datetime "cancellation_time"
    t.float "refund_amount", limit: 24, default: 0.0
    t.integer "return_trip_id", default: 0
    t.integer "m_ticket", limit: 1, default: 0
    t.text "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_trip_passengers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bus_trip_id", default: 0
    t.string "seat_name", limit: 50
    t.string "seat_block_id", limit: 50
    t.string "passenger_title", limit: 10
    t.string "passenger_name", limit: 100
    t.string "address"
    t.string "phone", limit: 50
    t.string "email"
    t.string "gender", limit: 10
    t.string "age", limit: 10
    t.string "id_number", limit: 45
    t.string "id_type", limit: 45
    t.integer "primary"
    t.float "base_fare", limit: 24, default: 0.0
    t.float "op_service_charge", limit: 24, default: 0.0
    t.float "fare", limit: 24, default: 0.0
    t.string "passenger_type", limit: 5
    t.float "convenience_charge", limit: 24, default: 0.0
    t.integer "ladies_seat", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "markup_fare", limit: 24, default: 0.0
    t.float "markup_fare_percent", limit: 24, default: 0.0
    t.float "operator_service_charge", limit: 24, default: 0.0
    t.float "operator_service_charge_percent", limit: 24, default: 0.0
    t.float "service_tax", limit: 24, default: 0.0
    t.float "service_tax_percent", limit: 24, default: 0.0
    t.float "actual_base_fare", limit: 24, default: 0.0
    t.float "reduced_base_fare_amt", limit: 24, default: 0.0
    t.float "other_levies", limit: 24, default: 0.0, null: false
    t.float "concession", limit: 24, default: 0.0, null: false
    t.float "reservation_fee", limit: 24, default: 0.0, null: false
    t.float "service_fee", limit: 24, default: 0.0, null: false
    t.float "toll_fee", limit: 24, default: 0.0, null: false
    t.float "booking_fee", limit: 24, default: 0.0
    t.float "other_charges", limit: 24, default: 0.0
    t.float "service_charge", limit: 24, default: 0.0
    t.integer "row"
    t.integer "column"
    t.integer "width"
    t.integer "length"
    t.float "last_row_discount", limit: 24, default: 0.0
    t.float "real_base_fare", limit: 24, default: 0.0
    t.integer "seat_layout_id"
    t.integer "smart_card_coupon_id"
    t.string "seat_type"
    t.float "ry_gst", limit: 24
    t.float "operator_gst", limit: 24
  end

  create_table "bus_trips", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "redbus_trip_id", limit: 100, default: "0"
    t.string "block_key", limit: 20
    t.string "ticket_no", limit: 100
    t.integer "boarding_point_id", default: 0
    t.integer "source_city_id", default: 0
    t.integer "destination_city_id", default: 0
    t.integer "first_bp_id"
    t.time "first_bp_time"
    t.time "boarding_time"
    t.time "arrival_time"
    t.time "departure_time"
    t.string "bus_type"
    t.integer "coupon_id"
    t.float "base_fare", limit: 24, default: 0.0
    t.float "op_service_charge", limit: 24, default: 0.0
    t.float "trip_fare", limit: 24, default: 0.0
    t.float "discount", limit: 24, default: 0.0
    t.float "reduced_discount", limit: 24, default: 0.0
    t.float "convenience_charge", limit: 24, default: 0.0, null: false
    t.float "cashback_amount", limit: 24, default: 0.0
    t.float "total_fare", limit: 24, default: 0.0
    t.integer "cashback_paid", limit: 1, default: 0
    t.integer "operator_id", default: 0
    t.string "bus_operator_name"
    t.integer "from_city_id_ry", default: 0
    t.integer "to_city_id_ry", default: 0
    t.integer "railyatri_user_id", default: 0
    t.datetime "date_of_issue"
    t.datetime "journey_date"
    t.datetime "arrival_date"
    t.string "inventory_id"
    t.integer "partial_cancellation_allowed", limit: 1, default: 0
    t.string "pickup_contact_no"
    t.string "pickup_location_address"
    t.string "pickup_location"
    t.integer "pickup_location_id", default: 0
    t.string "pickup_location_landmark"
    t.float "service_charge", limit: 24, default: 0.0
    t.string "train_pnr_number", limit: 20
    t.string "bus_pnr_number", limit: 50
    t.string "bus_tin", limit: 50
    t.string "trip_status", limit: 50
    t.text "cancellation_policy"
    t.float "cancellation_charge", limit: 24, default: 0.0
    t.integer "status", default: 0, comment: "0 for BLOCKED, 1 COMPLETED, 2 CANCELLED"
    t.string "cancel_from"
    t.datetime "cancellation_time"
    t.float "refund_amount", limit: 24, default: 0.0
    t.integer "refund_status", default: 0, comment: "0 for pending, 1 for paid"
    t.integer "return_trip_id", default: 0
    t.integer "m_ticket", limit: 1, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "json_data"
    t.integer "ecomm_source_id", default: 1, comment: "1 for ANDROID, 2 for WEB, 3 for IOS, 4 for WINDOWS"
    t.integer "provider_id", default: 0
    t.integer "btb_org_id", default: 0
    t.string "btb_org_name"
    t.integer "manual_bus_trip_id", default: 0
    t.string "manual_comments"
    t.boolean "is_valid", default: true
    t.string "operator_pnr"
    t.datetime "journey_date_time"
    t.datetime "arrival_date_time"
    t.string "ry_trip_code", limit: 100
    t.integer "dropping_point_id"
    t.float "rtc_discount", limit: 24, default: 0.0, null: false
    t.float "smart_card_cost", limit: 24, default: 0.0
    t.float "smart_card_discount", limit: 24, default: 0.0
    t.integer "smart_card_coupon_id"
    t.float "accident_relief_fund", limit: 24, default: 0.0, null: false
    t.float "bridge_fee", limit: 24, default: 0.0, null: false
    t.float "entry_fee", limit: 24, default: 0.0, null: false
    t.float "infra_structure_fee", limit: 24, default: 0.0, null: false
    t.float "other_levies", limit: 24, default: 0.0, null: false
    t.float "concession", limit: 24, default: 0.0, null: false
    t.float "reservation_fee", limit: 24, default: 0.0, null: false
    t.float "service_fee", limit: 24, default: 0.0, null: false
    t.float "toll_fee", limit: 24, default: 0.0, null: false
    t.float "user_fee", limit: 24, default: 0.0, null: false
    t.float "basic_fare", limit: 24
    t.integer "rtc_id", comment: "this rtc id is provided by bus india"
    t.string "pickup_email", limit: 50
    t.integer "pickup_location_pincode"
    t.string "provider_reference_number", limit: 50
    t.string "provider_service_id", limit: 50
    t.string "cancellation_reason", default: "user choice"
    t.boolean "is_cancellable", default: true
    t.float "booking_fee", limit: 24, default: 0.0
    t.float "other_charges", limit: 24, default: 0.0
    t.float "ry_commission", limit: 24, default: 0.0
    t.float "ry_commission_percent", limit: 24, default: 0.0
    t.float "provider_commission", limit: 24, default: 0.0
    t.float "finance_trip_fare", limit: 24, default: 0.0
    t.integer "duration"
    t.index ["bus_pnr_number"], name: "idx_bus_trips_bus_pnr_number"
    t.index ["created_at"], name: "idx_bus_trips_created_at"
    t.index ["departure_time"], name: "idx_departure_time_bus_trips"
    t.index ["operator_id"], name: "idx_operator_id_bus_trips"
    t.index ["provider_id"], name: "idx_provider_id_bus_trips"
    t.index ["railyatri_user_id"], name: "idx_bus_trips_railyatri_user_id"
    t.index ["redbus_trip_id", "railyatri_user_id"], name: "idx_bus_trips_redbus_trip_id_railyatri_user_id"
    t.index ["ticket_no"], name: "idx_ticket_no"
  end

  create_table "bus_types", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50
    t.string "code", limit: 10
    t.string "status", limit: 8, default: "ACTIVE"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "type_name"
  end

  create_table "bus_wisdoms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "from_city_id"
    t.string "from_city_name"
    t.integer "to_city_id"
    t.string "to_city_name"
    t.integer "operator_id"
    t.string "operator_name"
    t.integer "wisdom_type"
    t.text "description"
    t.integer "number_time"
    t.integer "shout_out_length"
    t.boolean "status", default: true
    t.integer "user_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "busindia_prod_cities", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bi_city_id"
    t.string "city_name"
    t.string "bi_city_code", limit: 10
    t.string "busindia_rtc_id", limit: 11
    t.integer "status", default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["bi_city_id"], name: "bi_city_id"
    t.index ["busindia_rtc_id"], name: "busindia_rtc_id"
  end

  create_table "cab_aha_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "aha_city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cab_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "ry_city_name"
    t.string "gozo_city_name"
    t.integer "gozo_city_id"
    t.string "aha_city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cab_driver_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "booking_id"
    t.string "driver_name"
    t.integer "driver_phone"
    t.string "car_name"
    t.string "car_number"
    t.string "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "otp"
  end

  create_table "cab_gozo_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "gozo_city_name"
    t.integer "gozo_city_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cab_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "customer_name"
    t.integer "user_id"
    t.bigint "phone_number"
    t.integer "alternate_phone_no"
    t.string "from_city"
    t.string "to_city"
    t.date "pickup_date"
    t.time "pickup_time"
    t.text "pickup_location"
    t.text "dropoff_location"
    t.string "email_address"
    t.integer "provider_id"
    t.integer "status"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "customer_advance", precision: 10, scale: 2
    t.decimal "customer_due", precision: 10, scale: 2
    t.text "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "convenience_fee", precision: 10, scale: 2
    t.string "cab_type"
    t.text "browser_id"
    t.integer "ecomm_source_id"
    t.integer "coupon_id"
    t.string "coupon_code"
    t.decimal "discount_amount", precision: 10
    t.decimal "cashback_amt", precision: 10
    t.boolean "cashback_paid"
    t.integer "return_days"
    t.date "return_date"
    t.integer "payment_link", default: 0
    t.integer "v_code"
    t.integer "from_city_id"
    t.integer "to_city_id"
    t.integer "cab_id"
    t.string "estimated_distance"
    t.string "estimated_time"
    t.decimal "rate_per_kilometer", precision: 10, scale: 2
    t.decimal "da", precision: 10, scale: 2
    t.integer "toll_tax"
    t.integer "state_tax"
    t.string "booking_id"
    t.string "booking_status", limit: 45
    t.datetime "cancel_time"
    t.integer "refund_id"
    t.decimal "refund_amount", precision: 10
  end

  create_table "cab_popular_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "from_city"
    t.text "to_city"
    t.string "cab_type", limit: 45
    t.string "distance", limit: 45
    t.string "time", limit: 45
    t.string "one_way_fare", limit: 45
    t.string "round_trip_fare", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cab_return_day_fares", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "cab_return_fare_id"
    t.integer "day"
    t.integer "distance_allowed"
    t.decimal "suv_fare", precision: 10
    t.decimal "suv_da", precision: 10
    t.decimal "sedan_fare", precision: 10
    t.decimal "sedan_da", precision: 10
    t.decimal "compact_fare", precision: 10
    t.decimal "compact_da", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cab_return_fares", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "from_city"
    t.string "to_city"
    t.integer "provider_id"
    t.text "fare_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.decimal "compact_extra", precision: 10, scale: 2, default: "8.0"
    t.decimal "suv_extra", precision: 10, scale: 2, default: "13.0"
    t.decimal "sedan_extra", precision: 10, scale: 2, default: "8.0"
  end

  create_table "cab_round_trip_queries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "email"
    t.string "mobile"
    t.text "message"
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cab_route_fares", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "from_city"
    t.string "to_city"
    t.integer "suv"
    t.decimal "suv_gst", precision: 10
    t.decimal "suv_toll", precision: 10
    t.decimal "suv_stax", precision: 10
    t.integer "sedan"
    t.decimal "sedan_gst", precision: 10
    t.decimal "sedan_toll", precision: 10
    t.decimal "sedan_stax", precision: 10
    t.integer "compact"
    t.decimal "compact_gst", precision: 10
    t.decimal "compact_toll", precision: 10
    t.decimal "compact_stax", precision: 10
    t.integer "provider_id"
    t.decimal "estimated_distance", precision: 10
    t.decimal "estimated_time", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "from_city_google_id"
    t.integer "to_city_google_id"
    t.boolean "popular", default: false
    t.boolean "active", default: true
    t.integer "suv_extra", default: 13
    t.integer "sedan_extra", default: 10
    t.integer "compact_extra", default: 8
    t.boolean "toll_taxes", default: true
  end

  create_table "cab_surge_prices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "surge_percent"
    t.string "city"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "provider_id"
    t.integer "type_surge"
  end

  create_table "calls_without_userids", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "request_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaign_amounts", id: :integer, default: 0, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "deposited_amount", limit: 45
    t.string "balance_amount", limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "spent_amount"
    t.integer "campaign_id"
  end

  create_table "campaign_user_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "station_code"
    t.integer "user_id"
    t.integer "station_count"
    t.datetime "user_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "station_zone_id", default: 0
    t.string "city_name"
  end

  create_table "campaign_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_campaign_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_campaign_users_on_reset_password_token", unique: true
  end

  create_table "campaigns", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "userID"
    t.integer "app"
    t.string "from_name", limit: 100
    t.string "from_email", limit: 100
    t.string "reply_to", limit: 100
    t.string "title", limit: 500
    t.text "plain_text", limit: 16777215
    t.text "html_text", limit: 16777215
    t.string "sent", limit: 100, default: ""
    t.integer "to_send"
    t.text "to_send_lists"
    t.integer "recipients", default: 0
    t.string "timeout_check", limit: 100
    t.text "opens", limit: 4294967295
    t.integer "wysiwyg", default: 0
    t.string "send_date", limit: 100
    t.text "lists"
    t.string "timezone", limit: 100
    t.text "errors", limit: 4294967295
    t.integer "bounce_setup", default: 0
    t.integer "complaint_setup", default: 0
  end

  create_table "cancel_reasons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "reason_code"
    t.string "description"
    t.integer "reason_type", default: 0
    t.boolean "status"
  end

  create_table "cancellation_alerts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number"
    t.integer "user_id"
    t.datetime "boarding_datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "alert_status", default: false
    t.integer "no_of_sent_notification", default: 0
  end

  create_table "cancellation_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "event_type"
    t.string "event_name"
    t.string "event_title"
    t.text "content"
    t.integer "ecomm_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cancellations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "user", collation: "utf8_unicode_ci"
    t.string "from_station_code", collation: "utf8_unicode_ci"
    t.string "to_station_code", collation: "utf8_unicode_ci"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number"], name: "idx_train_number"
    t.index ["wisdom_id"], name: "wisdom_id"
  end

  create_table "candidates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "canonical_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "canonical_ids"
    t.string "reg_app_id"
    t.text "result"
  end

  create_table "card_comments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "card_template_id"
    t.string "changed_by"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_template_classes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "class_name"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_template_classes_template_keys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "card_template_class_id"
    t.integer "template_key_id"
  end

  create_table "card_templates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "card_name"
    t.integer "template_id"
    t.boolean "is_display"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "class_name"
    t.string "title"
    t.string "visibility", limit: 9
    t.string "language_preference", default: "en"
    t.string "card_type"
    t.integer "version_from", default: 0
    t.integer "version_to", default: 10000
    t.string "user_ids"
    t.index ["card_name"], name: "idx_card_name"
  end

  create_table "cell_towers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "radio", limit: 50
    t.integer "mcc", default: 0, null: false
    t.integer "net", default: 0, null: false
    t.integer "area", default: 0, null: false
    t.integer "cell", default: 0, null: false
    t.integer "unit", default: 0, null: false
    t.decimal "lat", precision: 15, scale: 10, default: "0.0", null: false
    t.decimal "lng", precision: 15, scale: 10, default: "0.0", null: false
    t.integer "range", default: 0, null: false
    t.integer "samples", default: 0, null: false
    t.integer "changeable", default: 0, null: false
    t.datetime "created_at_orig"
    t.datetime "updated_at_orig"
    t.decimal "average_signal", precision: 5, default: "0"
    t.integer "id_orig", default: 0
    t.integer "data", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["net", "area", "cell"], name: "idx_cell_towers_net_area_cell"
  end

  create_table "change_train_route_points", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_route_id", null: false
    t.integer "si_no", null: false
    t.string "station_code", null: false
    t.integer "w_arrival_minute"
    t.integer "w_departure_minute"
    t.integer "p_arrival_minute"
    t.integer "p_departure_minute"
    t.boolean "w_stoppage"
    t.boolean "p_stoppage"
    t.integer "w_day"
    t.integer "p_day"
    t.integer "traffic_allowance"
    t.integer "eng_allowance"
    t.string "train_type"
    t.decimal "distance_from_source", precision: 9, scale: 3
    t.integer "minutes_from_previous_stoppage"
    t.integer "speed_from_previous_stoppage"
    t.integer "distance_from_previous_stoppage"
    t.integer "minutes_from_previous_station"
    t.integer "speed_from_previous_station"
    t.integer "distance_from_previous_station"
    t.boolean "interchange_flag"
    t.string "section_code"
    t.string "division_code"
    t.string "zone_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "p_arrival_minute_of_day"
    t.integer "ntes_p_day"
    t.string "ntes_platform"
    t.boolean "ntes_enabled"
    t.boolean "ntes_created"
    t.integer "ntes_p_arrival_minute"
    t.integer "ntes_p_departure_minute"
    t.boolean "ntes_p_stoppage", default: false
    t.decimal "ntes_si_no", precision: 5, scale: 2
    t.string "station_name"
    t.decimal "station_lat", precision: 15, scale: 10
    t.decimal "station_lng", precision: 15, scale: 10
    t.integer "train_platform_detail_id"
    t.integer "on_time_rating"
    t.integer "platform_number"
    t.string "comment_one"
    t.string "comment_two"
    t.integer "fog_incidence_probability", default: 0
    t.integer "technical_hault", limit: 1, default: 0
    t.integer "d_day"
    t.boolean "food_available", default: false
    t.boolean "hotel_available", default: false
    t.integer "hotel_city_id"
    t.string "hotel_city_name"
    t.string "train_stop_days"
    t.boolean "is_rail_heads", default: false
    t.integer "timetable_change_id"
    t.integer "old_p_arrival_minute", null: false
    t.integer "old_p_departure_minute", null: false
    t.boolean "old_p_stoppage"
    t.index ["timetable_change_id"], name: "timetable_change_id"
    t.index ["train_route_id"], name: "train_route_id"
  end

  create_table "chat_error_messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "message"
    t.integer "chat_keyword_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_keywords", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "keyword"
    t.string "usage", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_signatures", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username"
    t.string "channel_type", limit: 50
    t.string "phone", limit: 50
    t.string "user_id", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city_name"
    t.string "google_city_name"
    t.integer "google_city_id", default: 0
    t.string "state_code"
    t.string "state_name"
    t.integer "postal_code"
    t.string "lat"
    t.string "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_back", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", default: 0, null: false
    t.string "city_name", collation: "utf8_general_ci"
    t.string "google_city_name", collation: "utf8_general_ci"
    t.string "state_code", collation: "utf8_general_ci"
    t.string "state_name", collation: "utf8_general_ci"
    t.integer "postal_code"
    t.string "lat", collation: "utf8_general_ci"
    t.string "lng", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "citrus_payments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "payment_transaction_id"
    t.string "return_url"
    t.string "notify_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_ambulances", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "city_name"
    t.string "ambulance_name"
    t.string "phone_1"
    t.string "phone_2"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "events_name"
    t.integer "city_id"
    t.string "city_name", limit: 100
    t.integer "state_id"
    t.date "start_date"
    t.date "end_date"
    t.string "events_logo_url"
    t.boolean "is_active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_events_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "events_place_name"
    t.string "events_place_address"
    t.string "events_place_details"
    t.integer "city_events_id"
    t.string "station_code_metro", limit: 20
    t.string "station_code_railway", limit: 50
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.boolean "is_active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_transports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "has_locals", default: false
    t.boolean "has_metro", default: false
    t.boolean "has_buses", default: false
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
  end

  create_table "cleanliness_drives", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "station_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "appid"
    t.string "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coa_mongo_train_runs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number", limit: 5
    t.date "start_date"
    t.string "station_code", limit: 45
    t.integer "sd_a_min"
    t.integer "a_min"
    t.integer "sd_d_min"
    t.integer "d_min"
    t.integer "delay"
    t.string "journey_length", limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coa_train_run_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number", limit: 15
    t.date "train_start_date"
    t.datetime "request_time"
    t.datetime "update_time"
    t.string "current_station_code", limit: 5
    t.string "request_via", limit: 45
    t.integer "parser_option"
    t.integer "coa_train_run_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coa_train_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "stn_code"
    t.datetime "run_date"
    t.datetime "scheduled_arrival"
    t.datetime "scheduled_departure"
    t.datetime "actual_arrival"
    t.datetime "actual_departure"
    t.datetime "coa_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coke_adds", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "name"
    t.string "city"
    t.string "travel_destination"
    t.string "last_trip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combined_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "combo_order_id"
    t.integer "cust_id"
    t.string "coupon_code"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ecomm_type"
    t.boolean "invoice_status", default: false
    t.integer "cust_uid"
    t.float "discount_amt", limit: 24
    t.float "wallet_debit", limit: 24
  end

  create_table "configured_intermidiate_station_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "configured_intermidiate_station_id"
    t.string "station_name", collation: "utf8_unicode_ci"
    t.string "block_name", collation: "utf8_unicode_ci"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "si_no"
    t.string "network_codes", default: ""
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
  end

  create_table "configured_intermidiate_stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "from_station_code", collation: "utf8_unicode_ci"
    t.string "to_station_code", collation: "utf8_unicode_ci"
    t.integer "distance_between_station"
    t.integer "process_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "skip_reason"
  end

  create_table "contacts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "mobile"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_source_id", default: 1, comment: "1 for ANDROID, 2 for WEB, 3 for IOS, 4 for WINDOWS"
    t.string "pnr_number", limit: 20
    t.date "dob"
    t.string "direction", limit: 20
    t.integer "astro_zodiac_id"
    t.integer "passenger_detail_id"
    t.string "tx_id"
    t.float "amount", limit: 24
    t.integer "content_type", default: 1, comment: "1 for Astro, 2 for Travel_Digest"
    t.text "content_details"
    t.string "from_station", limit: 45
    t.string "to_station", limit: 45
    t.string "content_lang", limit: 45
    t.date "doj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_status", default: 0
    t.integer "user_id"
  end

  create_table "copy_bus_feedback_answeres", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "question_id"
    t.boolean "answere"
    t.string "trip_id", limit: 100
    t.integer "user_id"
    t.boolean "status"
    t.integer "bus_trip_id"
    t.integer "operator_id"
    t.integer "provider_id"
    t.string "seat_no"
    t.integer "from_city_id", default: 0
    t.integer "to_city_id", default: 0
    t.time "departure_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["operator_id", "provider_id", "from_city_id", "to_city_id"], name: "idx_operator_id_provider_id_from_city_id_to_city_id"
  end

  create_table "coupon_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "coupon_id", default: 0, comment: "FK of railyatri_coupons.id"
    t.integer "city_id"
    t.string "city_name"
    t.integer "from_city", default: 0
    t.integer "to_city", default: 0
    t.integer "status", limit: 1, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupon_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "coupon_id"
    t.string "coupon_token"
    t.integer "ecomm_type"
    t.string "user_id"
    t.integer "token_status", default: 1
    t.integer "is_applied", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "valid_ecomm_types"
    t.integer "food_coupon_id"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.integer "user_base", limit: 1
    t.index ["coupon_token"], name: "idx_coupon_token"
  end

  create_table "coupon_options", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "coupon_id"
    t.integer "no_of_passengers", default: 0
    t.integer "min_age"
    t.integer "max_age", default: 100
    t.string "passenger_gender", limit: 10
    t.string "booking_day"
    t.integer "all_passengers", default: 0
    t.integer "free_type", default: 0
    t.string "product_list1"
    t.string "product_list2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupon_tmps", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", limit: 55
  end

  create_table "coupon_voucher_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "railyatri_coupon_id"
    t.integer "used_count"
    t.string "ecomm_type", limit: 50
    t.float "card_discount_amount", limit: 24, default: 0.0
    t.float "card_cost", limit: 24
    t.integer "is_valid"
    t.string "invoice_ids"
    t.integer "coupon_list_id"
    t.string "coupon_list_token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cross_promotions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "main_title"
    t.integer "screen_ecomm"
    t.integer "card_ecomm"
    t.string "title"
    t.string "sub_title"
    t.string "desc"
    t.string "deeplink"
    t.string "action_text"
    t.string "card_order"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "web_link"
    t.integer "from_version", default: 100, null: false
    t.integer "to_version", default: 500, null: false
    t.string "btn_color"
    t.string "device_type_id"
    t.string "icon_url"
  end

  create_table "ct_available_hotels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "hotel_id", limit: 11
    t.text "search_criteria"
    t.string "city", limit: 50
    t.string "checkin_date", limit: 11
    t.string "checkout_date", limit: 11
    t.date "booking_date", null: false, comment: "roo"
    t.integer "no_of_rooms"
    t.integer "nights"
    t.string "adults_per_room", limit: 20
    t.string "children_per_room", limit: 20
    t.text "hotel_info"
    t.text "room_rates"
    t.text "promo_offers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ct_hotel_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50
    t.string "state", limit: 80
    t.string "country", limit: 50
    t.string "long_name"
    t.integer "k"
    t.integer "z"
    t.string "soruce", limit: 10, default: "CLEARTIRP", null: false
    t.integer "is_deep_link_enabled", limit: 1, default: 0
    t.text "deep_link"
    t.text "external_url"
    t.integer "status", limit: 1, default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_train_route_points", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_route_id"
    t.integer "si_no"
    t.string "station_code"
    t.string "station_name"
    t.string "station_block_name"
    t.integer "arrival_minute"
    t.integer "departure_minute"
    t.boolean "is_stoppage"
    t.boolean "is_station"
    t.integer "day_num"
    t.decimal "distance_from_source", precision: 9, scale: 3
    t.decimal "station_lat", precision: 15, scale: 10
    t.decimal "station_lng", precision: 15, scale: 10
    t.integer "train_platform_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_route_id"], name: "idx_train_route_id"
  end

  create_table "deep_linking_alerts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "image_url"
    t.text "short_text"
    t.text "external_link"
    t.text "deep_linking_text"
    t.text "deep_linking_url"
    t.datetime "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "external_link_text"
    t.boolean "isApproved", default: false
    t.string "added_by"
    t.text "cities"
    t.boolean "is_html", default: false
    t.string "language", default: "en"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "is_digest"
    t.index ["expiry_date"], name: "idx_expiry_date"
  end

  create_table "delay_data_last_run", primary_key: "train_number", id: :integer, default: 0, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "sta", default: 0
    t.integer "eta", default: 0
    t.string "station", limit: 45
    t.integer "delay", default: 0
  end

  create_table "delay_rank_stats", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "google_city_id"
    t.string "google_city_name", limit: 200
    t.string "state_name", limit: 200
    t.integer "dec_delay"
    t.integer "dec_rank"
    t.integer "jun_delay"
    t.integer "jun_rank"
    t.integer "rank_diff"
    t.string "inc_desc", limit: 200
    t.integer "rank_diff_abs"
    t.string "final_text", limit: 500
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "delayed_jobs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "delivery_plans", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "train_name"
    t.integer "alert_request_id"
    t.datetime "delivery_time"
    t.datetime "delivery_expiry"
    t.datetime "train_start_date"
    t.boolean "delivery_status", default: false
    t.integer "service_parameter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "previous_delivery_plan_id"
    t.index ["alert_request_id", "service_parameter_id"], name: "dp_ar_sp_idx"
    t.index ["delivery_time", "delivery_status"], name: "index_delivery_plans_on_delivery_time_and_delivery_status"
    t.index ["previous_delivery_plan_id"], name: "dp_pdp_id_idx"
  end

  create_table "dfp_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "dfp_id"
    t.string "slider_ad_unit"
    t.integer "slider_ad_type"
    t.integer "device_type_id"
    t.integer "from_v_code", default: 100
    t.integer "to_v_code", default: 500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.integer "position", default: 1
  end

  create_table "dfp_entities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "dfp_screens_id"
    t.string "ancestry", comment: "Primary id of same table for which it is parent of."
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_dfp_entities_on_ancestry"
    t.index ["dfp_screens_id"], name: "index_dfp_entities_on_dfp_screens_id"
  end

  create_table "dfp_entity_values", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "value"
    t.integer "dfp_entities_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "counter", default: 0
    t.boolean "status", default: true
    t.index ["dfp_entities_id"], name: "index_dfp_entity_values_on_dfp_entities_id"
  end

  create_table "dfp_screens", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "device_type_id"
    t.string "from_v_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "to_v_code"
    t.boolean "status", default: true
  end

  create_table "dfps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "screen_name"
    t.string "card_ad_unit"
    t.integer "card_ad_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
  end

  create_table "dial_to_verify_sessions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "mobile_number"
    t.string "dial_to_verify_session_id"
    t.string "verification_node", limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["dial_to_verify_session_id"], name: "dial_to_verify_session_id", unique: true
    t.index ["mobile_number"], name: "idx_dial_to_verify_sessions_mobile_number"
  end

  create_table "dispatched_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "android_app_id", collation: "utf8_unicode_ci"
    t.string "user_id", collation: "utf8_unicode_ci"
    t.string "notification_param", collation: "utf8_unicode_ci"
    t.string "wisdom_id", collation: "utf8_unicode_ci"
    t.string "journey_id", collation: "utf8_unicode_ci"
    t.string "return_value", collation: "utf8_unicode_ci"
    t.datetime "dispatched_time", null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.text "message_text"
  end

  create_table "dispatched_notifications_history", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "android_app_id", collation: "utf8_unicode_ci"
    t.string "user_id", collation: "utf8_unicode_ci"
    t.string "notification_param", collation: "utf8_unicode_ci"
    t.string "wisdom_id", collation: "utf8_unicode_ci"
    t.string "journey_id", collation: "utf8_unicode_ci"
    t.string "return_value", collation: "utf8_unicode_ci"
    t.datetime "dispatched_time", null: false
    t.date "created_at", null: false
    t.date "updated_at", null: false
    t.text "message_text"
  end

  create_table "disruptions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "user", collation: "utf8_unicode_ci"
    t.string "from_station_code", collation: "utf8_unicode_ci"
    t.string "to_station_code", collation: "utf8_unicode_ci"
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "admin_from_station_code", collation: "utf8_unicode_ci"
    t.string "admin_to_station_code", collation: "utf8_unicode_ci"
  end

  create_table "distinct_network_informations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "operator_code"
    t.string "operator_name"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
  end

  create_table "diversions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wisdom_id"], name: "idx_wisdomid"
  end

  create_table "e_book_e_book_requests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecatering_pnr_numbers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "chart_status"
    t.string "error_msg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "pnr_number"
    t.datetime "boarding_datetime"
    t.datetime "status_recheck_time"
    t.date "train_start_date"
    t.integer "passenger_count", limit: 1
    t.boolean "status"
    t.string "source"
    t.float "total_fare", limit: 24
    t.string "train_number"
    t.string "boarding_from"
    t.string "boarding_to"
    t.index ["boarding_datetime"], name: "idx_ecatering_pnr_numbers_boarding_datetime"
    t.index ["pnr_number"], name: "idx_ecatering_pnr_numbers_pnr_number"
  end

  create_table "ecom_point_redeems", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "redeem_product_id"
    t.string "redeem_product_type"
    t.integer "points"
    t.integer "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ry_wallet_allow", default: true
    t.index ["redeem_product_id"], name: "idx_redeem_product_id"
  end

  create_table "ecomm_cancellation_payments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_cancellation_id"
    t.integer "user_id"
    t.date "payment_date"
    t.decimal "pg_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "wallet_amount", precision: 10, scale: 2, default: "0.0"
    t.string "payment_provider"
    t.decimal "wallet_money_used", precision: 10, scale: 2, default: "0.0"
    t.decimal "cashback_used", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_multiple_payment", default: false
    t.index ["ecomm_cancellation_id"], name: "index_ecomm_cancellation_payments_on_ecomm_cancellation_id"
  end

  create_table "ecomm_cancellation_refunds", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "ecomm_type"
    t.integer "ecomm_cancellation_id"
    t.string "refund_type"
    t.string "refund_provider"
    t.decimal "pg_refund", precision: 10, scale: 2
    t.decimal "wallet_refund", precision: 10, scale: 2
    t.decimal "wallet_cashback", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wallet_to_bank_provider"
    t.decimal "wallet_to_bank_amt", precision: 10, scale: 2
    t.decimal "neft_charges", precision: 10, scale: 2
    t.date "refund_date"
    t.index ["ecomm_cancellation_id"], name: "index_ecomm_cancellation_refunds_on_ecomm_cancellation_id"
  end

  create_table "ecomm_cancellations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "ecomm_type"
    t.integer "user_id"
    t.integer "vendor_id"
    t.date "cancellation_date"
    t.date "booking_date"
    t.decimal "booking_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "refund_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "ry_charges_booking", precision: 10, scale: 2, default: "0.0"
    t.decimal "vendor_charges_booking", precision: 10, scale: 2, default: "0.0"
    t.string "payment_provider"
    t.string "refund_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delivery_date"
    t.string "booking_status"
    t.decimal "total_order_amt", precision: 10, scale: 2, default: "0.0"
    t.decimal "discount", precision: 10, scale: 2, default: "0.0"
    t.string "operator_name"
    t.string "provider_name"
    t.decimal "vendor_charges_cancellation", precision: 10, scale: 2, default: "0.0"
    t.decimal "ry_charges_cancellation", precision: 10, scale: 2, default: "0.0"
    t.decimal "ry_additional_service_charge", precision: 10, scale: 2, default: "0.0"
    t.string "order_type"
    t.decimal "convenience_charge_booking", precision: 10, scale: 2, default: "0.0"
    t.decimal "convenience_charge_cancellation", precision: 10, scale: 2, default: "0.0"
    t.decimal "smart_card_cost", precision: 10, scale: 2, default: "0.0"
    t.decimal "op_service_charge", precision: 10, scale: 2, default: "0.0"
    t.index ["cancellation_date"], name: "index_ecomm_cancellations_on_cancellation_date"
    t.index ["order_id", "ecomm_type"], name: "index_ecomm_cancellations_on_order_id_and_ecomm_type"
  end

  create_table "ecomm_feedback_questions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_type"
    t.text "question"
    t.text "hint"
    t.integer "status", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecomm_headers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "img_url"
    t.string "title"
    t.string "deeplink"
    t.integer "ecomm_type"
    t.integer "position"
    t.boolean "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecomm_source", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "ecomm_source", limit: 100
  end

  create_table "ecomm_sources", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "ecomm_source", limit: 100
  end

  create_table "ecomm_tracking_step_masters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "step_name"
    t.integer "device_type_id"
    t.string "position"
    t.string "ecomm_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ecomm_tracking_steps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_configured_journey_id"
    t.integer "user_id"
    t.string "steps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ecomm_type"
    t.string "payment_type"
    t.integer "cust_id"
    t.string "src", limit: 45
    t.integer "device_type_id"
    t.string "station_codes"
    t.string "vendor_id"
    t.integer "guest_user_id"
    t.string "utm_referrer"
    t.text "current_url"
    t.string "utm_source", limit: 45
    t.string "cart_total_amount"
    t.string "price_shown"
    t.string "proceed_for_payment"
    t.index ["steps"], name: "idx_ecomm_tracking_steps_steps"
  end

  create_table "ecomm_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_type_id"
    t.string "ecomm_type_name"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecomm_user_configured_journeys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "pnr_number", collation: "utf8_unicode_ci"
    t.string "train_number"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.date "train_boarding_date"
    t.date "train_start_date"
    t.date "train_end_date"
    t.string "mobile_number", collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message_counter", collation: "utf8_unicode_ci"
    t.datetime "scheduled_boarding_time"
    t.datetime "alert_start_time"
    t.string "to_station_code"
    t.string "reserved_upto"
    t.string "total_distance"
    t.string "total_time"
    t.integer "pnr_number_id"
    t.boolean "is_deleted", default: false
    t.string "slip_train_number"
    t.string "slip_from_station_code"
    t.boolean "is_web", default: false
    t.date "delivery_date"
    t.string "seat_number"
    t.string "coach_number"
    t.index ["pnr_number"], name: "idx_ecomm_user_configured_journeys_pnr_number"
    t.index ["train_boarding_date"], name: "idx_ecomm_user_configured_journeys_train_boarding_date"
    t.index ["train_end_date"], name: "idx_ecomm_user_configured_journeys_train_end_date"
    t.index ["train_start_date"], name: "idx_ecomm_user_configured_journeys_train_start_date"
    t.index ["user_id"], name: "idx_ecomm_user_configured_journeys_user_id"
  end

  create_table "ecomm_user_feedbacks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_type"
    t.integer "booking_id"
    t.integer "question1_id"
    t.integer "question1_rating"
    t.integer "question2_id"
    t.integer "question2_rating"
    t.integer "question3_id"
    t.integer "question3_rating"
    t.text "user_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecomm_user_testimonials", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_type"
    t.integer "booking_id"
    t.text "title"
    t.string "user_name"
    t.text "user_review"
    t.string "image_url", limit: 250
    t.string "user_location", limit: 250
    t.integer "user_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "ecomm_validation_fails", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "vendor_id"
    t.integer "train_number"
    t.date "delivery_date"
    t.string "sta"
    t.string "eta"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "station_code"
    t.integer "user_id"
    t.datetime "created_at_ist"
  end

  create_table "email_campaign_tracks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "emailer_name"
    t.integer "count"
    t.date "for_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_campaigns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "campaign_id"
    t.string "campaign_name"
    t.integer "ecomm_type"
    t.string "from_email"
    t.string "from_name"
    t.string "reply_to_email"
    t.integer "template_id"
    t.integer "attachment_count", default: 0
    t.string "attachment_file_path"
    t.text "message_html"
    t.text "message_mobile_html"
    t.string "email_provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_email_campaigns_on_campaign_id"
  end

  create_table "email_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "list_id"
    t.string "name"
    t.string "data_upload_status"
    t.boolean "is_active", default: false
    t.boolean "is_deleted", default: false
    t.integer "size", default: 0
    t.text "desc"
    t.string "file_path"
    t.string "data_upload_priority"
    t.string "email_provider"
    t.string "file_name"
    t.integer "data_upload_callback_count", default: 0
    t.integer "data_upload_job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_last_batch_uploaded", default: false
    t.index ["file_name"], name: "index_email_lists_on_file_name"
    t.index ["list_id"], name: "index_email_lists_on_list_id"
  end

  create_table "email_triggered_campaigns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "list_id", null: false
    t.integer "campaign_id", null: false
    t.datetime "scheduled_at"
    t.string "status"
    t.string "email_provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_email_triggered_campaigns_on_campaign_id"
    t.index ["list_id"], name: "index_email_triggered_campaigns_on_list_id"
  end

  create_table "error_log_informations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "server_name"
    t.text "params", limit: 4294967295
    t.string "message"
    t.text "error_url", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "client_ip"
  end

  create_table "eta_errors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "station_code"
    t.date "train_start_date"
    t.integer "current_id"
    t.text "comment"
    t.string "mongo_id", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_eta_errors_on_created_at"
    t.index ["current_id"], name: "index_eta_errors_on_current_id"
    t.index ["train_number", "train_start_date"], name: "index_by_train_number_and_start_date"
    t.index ["train_number"], name: "index_eta_errors_on_train_number"
    t.index ["train_start_date"], name: "index_eta_errors_on_train_start_date"
  end

  create_table "eta_log_archives", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number"
    t.string "station_code"
    t.date "train_start_date"
    t.boolean "is_current", default: false
    t.integer "ntes_eta"
    t.integer "ry_eta"
    t.integer "actual_arival_time"
    t.integer "diff_aat_ry_eta"
    t.datetime "user_request_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sd_a_min"
    t.text "comment"
    t.string "mongo_id"
    t.integer "current_id"
    t.index ["actual_arival_time"], name: "idx_eta_logs_actual_arival_time"
    t.index ["created_at"], name: "idx_eta_logs_created_at"
    t.index ["diff_aat_ry_eta"], name: "idx_eta_logs_diff_aat_ry_eta"
    t.index ["ry_eta"], name: "idx_eta_logs_ry_eta"
  end

  create_table "event_app_alerts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "description"
    t.string "station_code"
    t.string "alert_type", limit: 55
    t.integer "event_id"
    t.date "valid_upto"
    t.timestamp "created_at"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.date "valid_form"
  end

  create_table "event_campaigns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "event_id", default: 0
    t.string "title", comment: "Event Title"
    t.string "quote", comment: "Quote about event"
    t.integer "destination_city_id", default: 0
    t.string "destination_city_name"
    t.integer "ry_coupon_id", default: 0, comment: "FK of railyatri_coupon able"
    t.string "description"
    t.string "thumb_url"
    t.string "bg_img_url"
    t.integer "status", default: 0
    t.string "state_name"
    t.datetime "event_date"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "event_source_code"
    t.string "event_rule_v"
    t.string "event_rule_h"
    t.integer "text_id"
    t.integer "text_type"
    t.string "user_name"
    t.string "about_code"
    t.string "about_name"
    t.text "display_text"
    t.string "tag"
    t.datetime "approved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_rules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "code"
    t.string "rule"
    t.string "rule_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_rush_alerts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "data_source"
    t.string "station_code"
    t.date "valid_from"
    t.date "valid_to"
    t.date "event_date"
    t.string "event_date_range"
    t.text "alert"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "city"
    t.string "qry_station_code"
  end

  create_table "event_sources", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal "amount", precision: 10
    t.integer "event_type", default: 0, comment: "Basically for manging the kind of wallet credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extensions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.string "to_station", collation: "utf8_unicode_ci"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facebook_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "locationid"
    t.string "category"
    t.integer "checkins"
    t.string "description", limit: 5000
    t.boolean "is_community_page"
    t.boolean "is_published"
    t.string "street"
    t.string "zip"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.integer "talking_about_count"
    t.string "website", limit: 500
    t.integer "were_here_count"
    t.string "name", limit: 500
    t.string "link", limit: 500
    t.integer "likes"
    t.index ["locationid"], name: "locationid"
  end

  create_table "facilities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "vendor_id"
    t.integer "amenity_id"
    t.string "amenitytype"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fare_additional_charges", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "additional_fare"
    t.integer "charge_type"
    t.string "train_master_coach_type_code"
    t.string "train_master_type_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_season_on"
  end

  create_table "feedbacks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "train_number"
    t.date "train_start_date"
    t.string "current_station_code"
    t.string "arr_dep_flag"
    t.string "eta"
    t.string "reporting_station_code"
    t.boolean "is_ahead_of_station"
    t.boolean "is_at_station"
    t.text "suggestion"
    t.string "class_type", default: "Train Status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_station_code"
  end

  create_table "female_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "gender", limit: 250
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "flush_pnr_numbers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number"
    t.integer "user_id"
    t.string "flush_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "counter", default: 1
    t.index ["pnr_number"], name: "index_flush_pnr_numbers_on_pnr_number"
  end

  create_table "food_advertisments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal "min_order", precision: 10
    t.integer "min_delivery_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_cancellation_histories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "cancellation_event_id"
    t.string "title"
    t.text "message"
    t.boolean "show_user", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "food_charges", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_master_type_code"
    t.string "train_master_coach_type_code"
    t.string "meal_type"
    t.integer "charge"
    t.integer "from_minutes"
    t.integer "to_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_home_headers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "header_text"
    t.string "header_image"
    t.string "sub_header_text"
    t.string "sub_header_image"
    t.integer "is_header", comment: "0 - Header\n1 - Sub Header\n2 - Slider Images"
    t.boolean "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "position"
  end

  create_table "food_home_menu_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "item_name"
    t.string "item_desc"
    t.string "item_ordered", comment: "This field should be INT so converted INT at client side."
    t.text "item_image"
    t.integer "item_price"
    t.integer "food_home_menu_id"
    t.boolean "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "yc_menu_item_id"
    t.float "item_ordered_percent", limit: 24, default: 0.0
    t.integer "position"
  end

  create_table "food_home_menus", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "menu_type"
    t.text "menu_image"
    t.boolean "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "position"
    t.string "yc_category_id"
    t.string "menu_category_banner"
    t.boolean "show_offers", default: false
    t.text "ios_selected_menu_image"
    t.text "ios_nonselected_menu_image"
    t.float "ordered_percent", limit: 24, default: 0.0
  end

  create_table "food_home_user_reviews", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.text "user_review"
    t.text "user_review_cc"
    t.decimal "Rating", precision: 10
    t.integer "yc_experience"
    t.integer "vendor_experience"
    t.integer "ven_quality"
    t.string "title", limit: 250
    t.string "image_url", limit: 250
    t.string "user_location", limit: 250
    t.text "updated_review"
    t.boolean "status"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "review_date"
    t.integer "user_id"
    t.string "user_name"
  end

  create_table "food_ivr_call_repeats", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "phone_number"
    t.string "call_status"
    t.string "call_type"
    t.string "call_sid"
    t.integer "call_duration", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_sid"], name: "index_food_ivr_calls_on_call_sid"
  end

  create_table "food_ivr_calls", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "user_configured_journey_id"
    t.string "phone_number"
    t.datetime "scheduled_time"
    t.datetime "reached_time"
    t.string "slot"
    t.date "processed_date"
    t.integer "call_attempt"
    t.string "call_status"
    t.datetime "last_call_at"
    t.string "call_sid"
    t.boolean "is_processed", default: false
    t.string "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "call_duration", default: 0
    t.index ["call_sid"], name: "index_food_ivr_calls_on_call_sid"
    t.index ["slot"], name: "index_food_ivr_calls_on_slot"
    t.index ["user_id"], name: "index_food_ivr_calls_on_user_id"
  end

  create_table "food_sms_for_past_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "cust_uid"
    t.string "name"
    t.string "phone_no"
    t.date "sms_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_top_points", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", null: false, auto_increment: true
    t.integer "train_number"
    t.string "station_code", limit: 250
    t.string "station_name", limit: 250
    t.string "food_category", limit: 250
    t.integer "total_orders"
    t.integer "combo_orders"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["id"], name: "id"
    t.index ["train_number"], name: "idx_train_number"
  end

  create_table "freq_trips", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "user_id", null: false
    t.string "pnr_number", null: false
    t.string "boarding_time", null: false
    t.string "trip_end_time", null: false
  end

  create_table "frotel_last_hotel", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frotel_tax_table", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "start", limit: 45
    t.string "end", limit: 45
    t.string "status", limit: 45
    t.string "percentage", limit: 45
  end

  create_table "gcm_railyatri_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "app_id"
    t.string "email_id"
    t.string "registration_gcm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gds_available_trips", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "source_city_id"
    t.integer "destination_city_id"
    t.integer "bus_service_id"
    t.integer "operator_id"
    t.string "source", limit: 45
    t.string "destination", limit: 45
    t.text "gds_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "doj", limit: 45
    t.string "gds_trip_id", limit: 45
  end

  create_table "geofence_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "station_code"
    t.integer "event"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.integer "accuracy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_trip", default: false
    t.boolean "is_notification_sent"
    t.string "comment"
    t.string "params_appid", limit: 225
    t.string "ry_appid", limit: 225
  end

  create_table "geofence_foods", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "station_code"
    t.string "station_name"
    t.string "vendor_name"
    t.string "local_delicacy_name"
    t.string "item_description"
    t.string "notification_title"
    t.string "notification_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_code"], name: "index_geofence_foods_on_station_code"
  end

  create_table "geofence_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.date "notification_date"
    t.string "geofence_station_code"
    t.string "geofence_food_station_code"
    t.string "notification_for"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "notification_date"], name: "idx_user_id_notify_date"
  end

  create_table "gift_card_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "railyatri_coupon_id"
    t.integer "used_count"
    t.string "ecomm_type", limit: 50
    t.float "card_discount_amount", limit: 24, default: 0.0
    t.float "card_cost", limit: 24
    t.integer "is_valid"
    t.string "invoice_ids"
    t.integer "coupon_list_id"
    t.string "coupon_list_token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goodie_codes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "goodie_id"
    t.string "coupon_code"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_assigned", default: false
    t.integer "ecomm_type", default: 99
  end

  create_table "goodie_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "goodie_id"
    t.integer "goodie_code_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coupon_code"
  end

  create_table "goodies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.string "sub_title"
    t.integer "offer_rate"
    t.integer "rate_type"
    t.string "short_description"
    t.text "long_description"
    t.string "short_image_url"
    t.string "detail_image_url"
    t.date "valid_from"
    t.date "valid_to"
    t.string "valid_at"
    t.boolean "status"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ecomm_type"
    t.integer "order_id"
  end

  create_table "google_cell_towers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "cell_id"
    t.integer "lac"
    t.integer "mnc"
    t.integer "mcc"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.decimal "accuracy", precision: 12, scale: 5
    t.decimal "google_lat", precision: 15, scale: 10
    t.decimal "google_lng", precision: 15, scale: 10
    t.decimal "google_accuracy", precision: 12, scale: 5
    t.text "res_json", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cell_id"], name: "cell_id"
  end

  create_table "google_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city_name", limit: 100
    t.string "state_code", limit: 50
    t.string "state_name", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "google_cities_local_bulletins", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "google_city_id"
    t.integer "local_bulletin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "current_id"
    t.string "train_number"
    t.date "train_start_date"
    t.string "station_code"
    t.integer "sd_a_min"
    t.integer "ntes_eta"
    t.integer "ry_eta"
    t.integer "actual_arival_time"
    t.integer "diff_aat_ry_eta"
    t.datetime "user_request_time"
    t.datetime "ntes_last_updated"
    t.datetime "ry_last_updated"
    t.string "ntes_station_code"
    t.integer "ry_si_no"
    t.integer "ntes_si_no"
    t.boolean "is_current", default: false
    t.text "comment"
    t.string "mongo_id", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actual_arival_time"], name: "index_gps_on_actual_arival_time"
    t.index ["created_at"], name: "index_gps_on_created_at"
    t.index ["current_id"], name: "index_gps_on_current_id"
    t.index ["diff_aat_ry_eta"], name: "index_gps_on_diff_aat_ry_eta"
    t.index ["ry_eta"], name: "index_gps_on_ry_eta"
    t.index ["train_number"], name: "index_gps_on_train_number"
    t.index ["train_start_date"], name: "index_gps_on_train_start_date"
  end

  create_table "gps_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.decimal "lat", precision: 15, scale: 13
    t.decimal "lng", precision: 15, scale: 13
    t.string "provider"
    t.float "accuracy", limit: 24
    t.datetime "location_time"
    t.integer "time_taken"
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gps_ntes_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number"
    t.date "train_start_date"
    t.string "ry_current_station_code", limit: 10
    t.integer "ry_delay", default: 0
    t.string "ry_next_station_code", limit: 10
    t.datetime "ry_updated_at"
    t.string "ntes_current_station_code", limit: 10
    t.integer "ntes_delay", default: 0
    t.string "ntes_next_station_code", limit: 10
    t.datetime "ntes_updated_at"
    t.text "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ry_current_station_si_no", default: 0
    t.integer "ntes_current_station_si_no", default: 0
    t.integer "live_train_update_id"
    t.index ["created_at"], name: "idx_gps_ntes_logs_created_at"
    t.index ["train_number"], name: "index_gps_ntes_logs_on_train_number"
    t.index ["train_start_date"], name: "index_gps_ntes_logs_on_train_start_date"
  end

  create_table "gps_ntes_train_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.date "train_start_date"
    t.date "predicate_date"
    t.string "predicate_type"
    t.boolean "is_ry_eta"
    t.string "current_station_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "si_no"
    t.datetime "last_updated_at"
    t.datetime "expire_at"
    t.integer "train_current_location_id"
    t.index ["predicate_date", "predicate_type"], name: "predicate_date_type"
  end

  create_table "gps_trackings", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "lattitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.string "email", limit: 100
    t.string "accuracy", limit: 100
    t.string "provider", limit: 100
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_members", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_group_id"
    t.string "phone_number"
    t.integer "status"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["phone_number"], name: "idx_phone_number"
  end

  create_table "group_share_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "group_share_id"
    t.integer "user_id"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_shares", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_group_id"
    t.integer "share_medium_type_id"
    t.integer "shared_content_id"
    t.string "shared_content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["share_medium_type_id"], name: "idx_share_medium_type"
    t.index ["user_group_id"], name: "idx_user_group_id"
  end

  create_table "holy_places", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "city_id"
    t.string "city_name", limit: 100
    t.integer "google_city_id"
    t.integer "station_id"
    t.string "station_code", limit: 100
    t.string "station_name", limit: 100
    t.float "distance_from_stn", limit: 24
    t.string "timing"
    t.text "short_desc"
    t.text "description"
    t.string "loadging"
    t.string "visiting_days"
    t.string "festivals"
    t.string "pictures"
    t.string "audio_aarti"
    t.string "myths_belief"
    t.string "food"
    t.string "transport_mode"
    t.string "dos"
    t.string "donts"
    t.boolean "entry_tickets"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.boolean "status", default: false
    t.integer "priority", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumb_url"
    t.index ["station_code"], name: "station_code"
  end

  create_table "hospital_contacts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "phone_number"
    t.integer "hospital_id"
    t.boolean "is_inaccuracy", default: false
    t.boolean "is_hospital_add", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "hospital_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "hospital_name"
    t.string "station_code"
    t.decimal "distance", precision: 10
    t.integer "number_of_bed"
    t.boolean "ambulance"
    t.boolean "xray"
    t.boolean "surgical"
    t.integer "phone_number_one"
    t.integer "phone_number_two"
    t.integer "phone_number_three"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "station_code"
    t.string "station_name"
    t.float "distance_from_stn", limit: 24
    t.integer "no_of_beds"
    t.boolean "ambulance"
    t.boolean "xray"
    t.boolean "lab"
    t.string "phone_1"
    t.string "phone_2"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotel_bookings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "booking_from"
    t.datetime "booking_to"
    t.string "room_type_id", limit: 100
    t.integer "rate_plan_id"
    t.string "hotel_code", limit: 30
    t.boolean "pre_pay"
    t.text "book_type"
    t.text "room_ocpu"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "ref_id"
    t.string "confirmation_no", limit: 50
    t.string "src"
    t.float "total_cst", limit: 24
    t.integer "days"
    t.float "base_price", limit: 24
    t.float "add_amt", limit: 24
    t.float "taxes", limit: 24
    t.float "discount", limit: 24
    t.float "cashback", limit: 24
    t.float "coupon_amt", limit: 24, default: 0.0
    t.integer "coupon_id"
    t.float "wallet_debit", limit: 24, default: 0.0
    t.float "online_payment_discount", limit: 24
    t.float "total_add_on_price", limit: 24, default: 0.0
    t.float "total_amt", limit: 24
    t.string "full_name"
    t.string "email"
    t.bigint "m_no"
    t.bigint "booking_id"
    t.text "contact"
    t.float "refund_amount", limit: 24
    t.string "room_type_name"
    t.text "cancel_msg"
    t.string "cancellation_tnx_id", limit: 100, default: ""
    t.boolean "cashback_paid", default: false
    t.string "ct_avail_hotel_id", limit: 30
    t.string "is_noti_send", limit: 1, default: "Y", null: false
    t.integer "device_type_id", default: 1
    t.float "total_payable", limit: 24, default: 0.0
    t.string "gst_reg_no", limit: 225
    t.string "gst_comapny_name", limit: 225
    t.string "gst_company_add", limit: 225
    t.integer "ry_commission"
    t.integer "ry_commission_percent"
    t.integer "ry_gst"
    t.integer "ry_gst_percent"
    t.integer "hotel_tax"
    t.integer "hotel_tax_percent"
    t.integer "hotel_base_fare"
    t.integer "duration"
    t.string "status_updated_by"
    t.text "add_on_ids_with_price"
    t.float "add_on_ry_commission", limit: 24, default: 0.0
    t.integer "add_on_ry_commission_percent", default: 0
    t.float "add_on_ry_gst", limit: 24, default: 0.0
    t.integer "add_on_ry_gst_percent", default: 0
    t.integer "online_payment_discount_rate", default: 0
  end

  create_table "hotel_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "source", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
  end

  create_table "hotel_city_maps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "google_city_id"
    t.string "google_city_name"
    t.integer "yatra_city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "yatra_city_name"
    t.text "sta_codes"
  end

  create_table "hotel_event_campaigns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "event_id", default: 0
    t.string "title", comment: "Event Title"
    t.string "quote", comment: "Quote about event"
    t.integer "destination_city_id", default: 0
    t.string "destination_city_name"
    t.integer "ry_coupon_id", default: 0, comment: "FK of railyatri_coupon able"
    t.string "description"
    t.string "thumb_url"
    t.string "bg_img_url"
    t.integer "status", default: 0
    t.string "state_name"
    t.string "people_going"
    t.datetime "event_date"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "action_text"
    t.string "lang", default: "en"
  end

  create_table "hotel_impressions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "browser_id", limit: 100
    t.text "url"
    t.string "referer", limit: 100
    t.string "navigator"
    t.text "page_params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "ga_page_type"
    t.string "utm_source"
    t.string "fid"
  end

  create_table "hotel_pending_confirmations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "hotel_booking_id"
    t.string "src"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotel_providers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "source", limit: 45
    t.string "type", limit: 45
    t.integer "provider_id"
  end

  create_table "hotel_reviews", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "vendor_id"
    t.string "avg_guest_rating"
    t.integer "overall_rating"
    t.text "comments"
    t.integer "room_quality"
    t.integer "service_quality"
    t.integer "dining_quality"
    t.integer "cleanliness"
    t.datetime "post_date"
    t.string "consumer_country"
    t.string "customer_name"
    t.string "consumer_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotel_station_maps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "station_id"
    t.string "station_name"
    t.string "station_code"
    t.text "station_address"
    t.float "distance", limit: 24
    t.string "city"
    t.integer "hotel_id"
    t.float "station_lat", limit: 24
    t.float "station_lng", limit: 24
    t.float "hotel_lat", limit: 24
    t.float "hotel_lng", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hotel_name"
    t.boolean "is_primary"
  end

  create_table "hotel_temple_maps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "hotel_name"
    t.string "temple_name"
    t.float "distance", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.integer "hotel_id"
    t.float "temple_lat", limit: 24
    t.float "temple_lng", limit: 24
    t.float "hotel_lat", limit: 24
    t.float "hotel_lng", limit: 24
    t.text "temple_description"
    t.text "temple_thumb_url"
    t.integer "temple_priority"
  end

  create_table "hotel_voucher", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "hotel_name"
    t.string "address"
    t.string "destination"
    t.date "checkin_date"
    t.date "checkout_date"
    t.string "no_of_rooms"
    t.integer "contact_person"
    t.integer "booking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hoteloverviews", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "vendor_id"
    t.string "source", limit: 3, default: "CLR", null: false, comment: "CLR- Cleartrip | TB- Treebo"
    t.string "vendor_name"
    t.string "hotel_class"
    t.string "location"
    t.string "city"
    t.string "country"
    t.string "address1"
    t.string "address2"
    t.string "area"
    t.text "address"
    t.text "hoteloverview"
    t.string "reviewrating"
    t.integer "reviewcount"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.string "defaultcheckintime"
    t.string "defaultcheckouttime"
    t.integer "hotel_star"
    t.integer "hotelgroupid"
    t.string "hotelgroupname"
    t.string "imagepath"
    t.string "hotelsearchkey"
    t.integer "area_seo_id"
    t.integer "secondaryareaids"
    t.string "secondaryareaname"
    t.integer "nooffloors"
    t.integer "noofrooms"
    t.string "state"
    t.integer "pincode"
    t.text "themelist"
    t.string "categorylist"
    t.string "city_zone"
    t.integer "weekday_rank"
    t.integer "weekend_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price", limit: 24, default: 0.0
    t.boolean "is_uniq_tem"
  end

  create_table "hoteloverviews_bak", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "vendor_id"
    t.string "vendor_name"
    t.string "hotel_class"
    t.string "location"
    t.string "city"
    t.string "country"
    t.string "address1"
    t.string "address2"
    t.string "area"
    t.text "address"
    t.text "hoteloverview"
    t.string "reviewrating"
    t.integer "reviewcount"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.string "defaultcheckintime"
    t.string "defaultcheckouttime"
    t.integer "hotel_star"
    t.integer "hotelgroupid"
    t.string "hotelgroupname"
    t.string "imagepath"
    t.string "hotelsearchkey"
    t.integer "area_seo_id"
    t.integer "secondaryareaids"
    t.string "secondaryareaname"
    t.integer "nooffloors"
    t.integer "noofrooms"
    t.string "state"
    t.integer "pincode"
    t.text "themelist"
    t.string "categorylist"
    t.string "city_zone"
    t.integer "weekday_rank"
    t.integer "weekend_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price", limit: 24, default: 0.0
    t.boolean "is_uniq_tem"
  end

  create_table "ifone_subscribers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email_or_mobile"
    t.string "subscriber_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_notifyed", default: false
  end

  create_table "image_sliders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "image_for"
    t.integer "image_position"
    t.string "dpi_type"
    t.string "deep_linking_url"
    t.string "image_url"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_app_campaign_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "event_name"
    t.boolean "status"
    t.integer "in_app_campaign_feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_app_campaign_icon_positions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_app_campaigns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "push_type"
    t.string "campaign_name"
    t.string "event_name"
    t.string "email"
    t.date "start_date"
    t.date "end_date"
    t.text "in_app_query_base", limit: 4294967295
    t.text "in_app_campaign_entity", limit: 4294967295
    t.string "send_status"
    t.boolean "active_status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incident_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "incident_type", collation: "utf8_unicode_ci"
    t.text "description", collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidents", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "incident_type_id"
    t.integer "incident_reported_by"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.text "description", collation: "utf8_unicode_ci"
    t.decimal "user_lat", precision: 15, scale: 10
    t.decimal "user_lng", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomplete_pnr_numbers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "status"
    t.string "source"
    t.boolean "is_started", default: false
    t.string "message"
    t.index ["pnr_number"], name: "pnr_number"
  end

  create_table "incomplete_pnr_passenger_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number", limit: 20
    t.string "passenger_name"
    t.integer "passenger_age"
    t.string "passenger_gender"
    t.integer "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "incomplete_pnr_number_id"
    t.string "passenger_phone"
    t.integer "user_id"
  end

  create_table "installed_app_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.text "app_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instant_refund_requests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "refund_type"
    t.integer "order_id"
    t.integer "ecomm_type"
    t.integer "user_id"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status", limit: 45
    t.decimal "wallet_credit", precision: 10
    t.index ["order_id", "ecomm_type"], name: "idx_order_id_ecomm_type"
  end

  create_table "intermediate_stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "source"
    t.integer "special_train_id"
    t.integer "new_train_id"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.integer "new_stoppage_id"
    t.integer "rush_alert_id"
    t.index ["special_train_id"], name: "idx_intermediate_stations_special_train_id"
  end

  create_table "interstitials", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "page_name", limit: 45
    t.integer "status", limit: 1, default: 0
  end

  create_table "invalid_rchecks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "rcheck"
    t.string "agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pnr"
  end

  create_table "invoice_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "offline_payment_id"
    t.string "tx_status"
    t.string "tx_id"
    t.string "tx_ref_no"
    t.string "pg_txn_no"
    t.string "pg_resp_code"
    t.text "tx_msg"
    t.decimal "amount", precision: 10, scale: 2
    t.string "auth_id_code"
    t.string "issuer_ref_no"
    t.string "signature"
    t.string "transaction_id"
    t.string "payment_mode"
    t.string "tx_gateway"
    t.string "currency"
    t.string "eci"
    t.string "txn_type"
    t.string "requested_currency"
    t.decimal "requested_amount", precision: 10, scale: 2
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobileNo"
    t.string "is_cod"
    t.integer "sslretry"
    t.string "vendor"
    t.datetime "txn_date_time"
    t.string "controller"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cust_id"
    t.string "cust_uid"
    t.decimal "wallet_debit", precision: 10
    t.decimal "discount_amt", precision: 10
    t.string "coupon_code"
  end

  create_table "ip_to_location_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.bigint "ip_address"
    t.string "country_code"
    t.string "country_name"
    t.string "region"
    t.string "city"
    t.string "zip_code"
    t.string "time_zone"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ip_to_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "start_ip_range"
    t.bigint "end_ip_range"
    t.string "country_code"
    t.string "country_name"
    t.string "region"
    t.string "city"
    t.string "zip_code"
    t.string "time_zone"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ir_enquiry_fares", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "train_number", limit: 10
    t.string "board_from", limit: 10
    t.string "board_to", limit: 10
    t.date "journey_date"
    t.string "journey_class", limit: 10
    t.string "journey_quota", limit: 10
    t.text "response", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number", "board_from", "board_to", "journey_class", "journey_quota"], name: "by_fare_tn_bf_bt_jc_jq"
    t.index ["user_id"], name: "by_user_id"
  end

  create_table "ir_enquiry_fares_test", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "train_number"
    t.string "board_from"
    t.string "board_to"
    t.date "journey_date"
    t.string "journey_class"
    t.string "journey_quota"
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "by_user_id"
  end

  create_table "ir_enquiry_seats", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "board_from"
    t.string "board_to"
    t.date "journey_date"
    t.string "journey_class"
    t.string "journey_quota"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number", "board_from", "board_to", "journey_class", "journey_quota"], name: "by_tn_bf_bt_jc_jq"
  end

  create_table "ir_station_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "station_name"
    t.string "station_code"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_code"], name: "station_code"
  end

  create_table "ir_train_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number"
    t.string "train_name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number"], name: "train_number"
  end

  create_table "ir_train_tatkal_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "boarding_from"
    t.string "boarding_to"
    t.date "boarding_date"
    t.string "boarding_class"
    t.string "boarding_quota"
    t.date "result_date"
    t.integer "total_seat"
    t.boolean "is_display", default: true
    t.boolean "is_verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "its_available_trips", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "ry_trip_id"
    t.string "diffgr_id"
    t.integer "company_id"
    t.string "company_name"
    t.integer "source_city_id"
    t.integer "destination_city_id"
    t.string "source_city_name"
    t.string "destination_city_name"
    t.integer "route_id"
    t.integer "route_time_id"
    t.string "route_name"
    t.datetime "route_time"
    t.integer "kilometer"
    t.datetime "arrival_time"
    t.integer "bus_type"
    t.string "bus_type_name"
    t.integer "arrangement_id"
    t.string "arrangement_name"
    t.decimal "ac_seat_rate", precision: 10, scale: 2, default: "0.0"
    t.decimal "ac_sleeper_rate", precision: 10, scale: 2, default: "0.0"
    t.decimal "ac_slumber_rate", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_ac_seat_rate", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_ac_sleeper_rate", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_ac_slumber_rate", precision: 10, scale: 2, default: "0.0"
    t.text "boarding_pts"
    t.text "dropping_pts"
    t.integer "empty_seats"
    t.string "reference_no"
    t.decimal "ac_seat_service_tax", precision: 10, scale: 2, default: "0.0"
    t.decimal "ac_slp_service_tax", precision: 10, scale: 2, default: "0.0"
    t.decimal "ac_slmb_service_tax", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_ac_seat_service_tax", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_ac_slp_service_tax", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_ac_slmb_service_tax", precision: 10, scale: 2, default: "0.0"
    t.decimal "ac_seat_sur_charges", precision: 10, scale: 2, default: "0.0"
    t.decimal "ac_slp_sur_charges", precision: 10, scale: 2, default: "0.0"
    t.decimal "ac_slmb_sur_charges", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_ac_seat_sur_charges", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_ac_slp_sur_charges", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_ac_slmb_sur_charges", precision: 10, scale: 2, default: "0.0"
    t.datetime "approx_arrival"
    t.integer "is_api_commision"
    t.datetime "city_time"
    t.datetime "city_time_24"
    t.date "journey_date"
    t.integer "from_city_id", default: 0
    t.integer "to_city_id", default: 0
    t.boolean "is_ac"
    t.text "provider_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "its_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "city_id"
    t.string "city_name"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "its_geo_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "its_geo_data_id"
    t.string "bus_no"
    t.integer "device_id"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.integer "speed"
    t.string "vehicle_status"
    t.string "engine_status"
    t.datetime "created_date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "its_operators", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "its_operator_id"
    t.string "operator_name"
    t.string "operator_city"
    t.decimal "convenience_charge", precision: 10, scale: 2, default: "0.0"
    t.integer "convenience_type", limit: 1, default: 1
    t.decimal "max_charge", precision: 10, scale: 2, default: "0.0"
    t.boolean "status", default: true
    t.float "last_seat_discount_percent", limit: 24, default: 0.0
    t.string "alternate_ph"
    t.text "cancellation_policy"
    t.float "max_last_seat_disc", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "gps_enable", default: false
  end

  create_table "its_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "from_city_id"
    t.string "from_city"
    t.integer "to_city_id"
    t.string "to_city"
    t.string "its_pair_id"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "its_similar_sounding_bus_operators", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "its_operator_id"
    t.string "its_operator_name"
    t.integer "ty_operator_id"
    t.string "ty_operator_name"
    t.integer "bi_operator_id"
    t.string "bi_operator_name"
    t.integer "rb_operator_id"
    t.string "rb_operator_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_completed"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rake_master_id"
  end

  create_table "journey_push_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_id"
    t.integer "trip_id"
    t.string "train_number"
    t.string "pnr_number"
    t.date "boarding_date"
    t.string "from_station_code"
    t.string "to_station_code"
    t.time "boarding_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "campaign_id"
    t.integer "ares_emails_id"
    t.string "link", limit: 500
    t.text "clicks", limit: 4294967295
  end

  create_table "lists", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "app"
    t.integer "userID"
    t.string "name", limit: 100
    t.integer "opt_in", default: 0
    t.string "confirm_url", limit: 100
    t.string "subscribed_url", limit: 100
    t.string "unsubscribed_url", limit: 100
    t.integer "thankyou", default: 0
    t.string "thankyou_subject", limit: 100
    t.text "thankyou_message", limit: 16777215
    t.integer "goodbye", default: 0
    t.string "goodbye_subject", limit: 100
    t.text "goodbye_message", limit: 16777215
    t.text "confirmation_subject", limit: 16777215
    t.text "confirmation_email", limit: 16777215
    t.integer "unsubscribe_all_list", default: 1
    t.text "custom_fields", limit: 16777215
    t.integer "prev_count", default: 0
    t.integer "currently_processing", default: 0
    t.integer "total_records", default: 0
  end

  create_table "live_train_food_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.date "notification_date"
    t.text "station_food_json"
    t.datetime "notification_sent_at"
    t.boolean "is_notification_sent"
    t.boolean "is_processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "error"
    t.index ["notification_date", "user_id"], name: "by_date_user_id"
  end

  create_table "live_train_no_foods", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "station_codes"
    t.string "station_names"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number"], name: "index_live_train_no_foods_on_train_number"
  end

  create_table "live_train_rejects", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number"
    t.date "train_start_date"
    t.integer "user_id"
    t.datetime "last_updated_at"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.decimal "distance_from_src", precision: 10, scale: 5
    t.string "last_station_code", limit: 10
    t.string "next_station_code", limit: 10
    t.decimal "distance_to_next_station", precision: 10, scale: 5
    t.integer "remaining_minutes_to_next_station"
    t.integer "user_location_log_id"
    t.string "current_station_code", limit: 10
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number"], name: "index_live_train_rejects_on_train_number"
    t.index ["train_start_date"], name: "index_live_train_rejects_on_train_start_date"
    t.index ["user_location_log_id"], name: "index_live_train_rejects_on_user_location_log_id"
  end

  create_table "live_train_status_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number"
    t.date "train_start_date"
    t.string "message"
    t.integer "user_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_updated_at"
    t.string "current_station_code", limit: 10
    t.index ["train_number", "train_start_date"], name: "by_train_number_start_date"
  end

  create_table "live_train_update_archives", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.date "train_start_date"
    t.integer "user_id", null: false
    t.datetime "last_updated_at"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.decimal "distance_from_src", precision: 10, scale: 5
    t.string "last_station_code", limit: 10
    t.string "next_station_code", limit: 10
    t.decimal "distance_to_next_station", precision: 10, scale: 5
    t.integer "remaining_minutes_to_next_station"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_location_log_id"
    t.string "current_station_code", limit: 10
    t.index ["train_number"], name: "train_number"
    t.index ["train_start_date"], name: "train_start_date"
    t.index ["user_id"], name: "user_id"
    t.index ["user_location_log_id"], name: "user_location_log_id"
  end

  create_table "live_train_update_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "live_train_update_id"
    t.string "train_number"
    t.date "train_start_date"
    t.integer "user_id"
    t.datetime "last_sent_at"
    t.integer "total_sent_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "on_track", default: true
    t.index ["on_track"], name: "idx_live_train_update_notifications_on_track"
    t.index ["user_id"], name: "index_live_train_update_notifications_on_user_id"
  end

  create_table "live_train_updates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.date "train_start_date"
    t.bigint "user_id", null: false
    t.datetime "last_updated_at"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.decimal "distance_from_src", precision: 10, scale: 5
    t.string "last_station_code", limit: 10
    t.integer "last_station_a_min"
    t.string "next_station_code", limit: 10
    t.decimal "distance_to_next_station", precision: 10, scale: 5
    t.integer "remaining_minutes_to_next_station"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_location_log_id"
    t.string "current_station_code", limit: 10
    t.boolean "is_invalid", default: false
    t.string "comment", default: ""
    t.integer "current_station_a_min"
    t.text "json_other"
    t.integer "last_station_d_min"
    t.integer "current_station_d_min"
    t.index ["last_updated_at"], name: "idx_live_train_updates_last_updated_at"
    t.index ["train_number"], name: "train_number"
    t.index ["train_start_date"], name: "train_start_date"
    t.index ["user_id"], name: "user_id"
    t.index ["user_location_log_id"], name: "user_location_log_id"
  end

  create_table "loader_contents", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", limit: 100
    t.string "description"
    t.boolean "active"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "local_alert_filter_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "filter_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "train_type"
    t.integer "alert_type"
  end

  create_table "local_alerts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "city"
    t.string "from_station"
    t.string "to_station"
    t.text "alert_msg"
    t.integer "alert_type"
    t.integer "user_type"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "approved_status", default: 0
    t.integer "local_alert_filter_type_id"
    t.string "filter_type"
    t.boolean "is_message", default: false
  end

  create_table "local_bulletin_queries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "query_name"
    t.text "query"
    t.string "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "query_type", limit: 45
  end

  create_table "local_bulletin_templates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title", limit: 45
    t.text "template_html", limit: 4294967295
    t.string "category"
  end

  create_table "local_bulletins", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title", collation: "utf8_general_ci"
    t.text "image_url"
    t.text "description", collation: "utf8_general_ci"
    t.text "external_link"
    t.integer "template_id", comment: "Title with image=>1,Title with desciption=>2,Title over image=>3,Title with item list=>4"
    t.datetime "expiry_date"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false, comment: "Active=>1,Inactive=>0"
  end

  create_table "local_messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "msg_tag", limit: 100
    t.string "message"
    t.string "lang"
    t.boolean "is_dynamic", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "status_code"
    t.index ["msg_tag"], name: "idx_local_messages_msg_tag"
  end

  create_table "local_station_news", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.string "to_station", collation: "utf8_unicode_ci"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "local_train_news", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "local_train_stations_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image_name"
    t.string "city"
    t.boolean "has_image", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumb_image"
    t.string "image_type", default: "Local"
  end

  create_table "location_cells", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal "latitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.string "station_code"
    t.bigint "cell_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "train_number"
    t.index ["cell_id"], name: "idx_location_cells_cell_id", unique: true
  end

  create_table "location_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "login", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 100
    t.string "company", limit: 100
    t.string "username", limit: 100
    t.string "password", limit: 500
    t.string "s3_key", limit: 500
    t.string "s3_secret", limit: 500
    t.string "api_key", limit: 500
    t.string "license", limit: 100
    t.string "timezone", limit: 100
    t.integer "tied_to"
    t.integer "app"
    t.string "paypal", limit: 100
    t.integer "cron", default: 0
    t.integer "cron_ares", default: 0
    t.integer "send_rate", default: 0
    t.string "language", limit: 100, default: "en_US"
    t.integer "cron_csv", default: 0
    t.string "ses_endpoint", limit: 100
  end

  create_table "lucky_unlucky_pnrs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", null: false, auto_increment: true
    t.string "category", limit: 250
    t.string "pnr_number", limit: 250
    t.string "orig_wl", limit: 250
    t.integer "probability"
    t.string "final_status", limit: 200
    t.integer "train_number"
    t.string "train_name", limit: 250
    t.date "boarding_date"
    t.string "boarding_station", limit: 200
    t.string "reserved_upto_station", limit: 200
    t.string "journey_class", limit: 200
    t.date "display_date"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["id"], name: "id"
  end

  create_table "marketing_campaign_card_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "img_url"
    t.text "features"
    t.text "ecomm_type"
    t.boolean "status"
    t.text "marketing_campaign_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "city"
  end

  create_table "marketing_campaign_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.string "img_url"
    t.string "card_img_url"
    t.string "video_url"
    t.string "deeplink"
    t.integer "marketing_campaign_id"
    t.integer "priority"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "ecomm_type"
    t.string "tags"
    t.text "features"
    t.string "city"
    t.text "station"
    t.text "state"
    t.string "web_deeplink"
    t.string "station_name"
    t.string "item_name"
  end

  create_table "marketing_campaigns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "card_img_url"
  end

  create_table "marketing_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.string "url"
    t.boolean "status", default: true
    t.string "alt_tag"
    t.string "point_to_url"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_favorite_stations", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "station_code"
    t.string "station_name"
  end

  create_table "master_train_schedule_tmps", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", default: 0, null: false
    t.string "TRAIN_NUMBER"
    t.string "TRAIN_NAME"
    t.string "RUN_DAYS"
    t.string "STATION_CODE"
    t.string "STATION_NAME"
    t.integer "STATION_SI_NO"
    t.boolean "STOPPAGE"
    t.integer "DAY_NO"
    t.string "ZONE_CODE"
    t.integer "PLATFORM_NUMBER"
    t.integer "ARRIVAL_MINUTE"
    t.integer "DEPARTURE_MINUTE"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "master_train_schedules", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "TRAIN_NUMBER"
    t.string "TRAIN_NAME"
    t.string "RUN_DAYS"
    t.string "STATION_CODE"
    t.string "STATION_NAME"
    t.integer "STATION_SI_NO"
    t.boolean "STOPPAGE"
    t.integer "DAY_NO"
    t.string "ZONE_CODE"
    t.integer "PLATFORM_NUMBER"
    t.integer "ARRIVAL_MINUTE"
    t.integer "DEPARTURE_MINUTE"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ARRIVAL_MINUTE"], name: "INDEX_ARRIVAL_MINUTE"
    t.index ["DEPARTURE_MINUTE"], name: "INDEX_DEPARTURE_MINUTE"
    t.index ["RUN_DAYS"], name: "INDEX_RUN_DAYS"
  end

  create_table "max_platform_numbers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "station_name"
    t.string "station_code"
    t.integer "maximum_platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "index"
  end

  create_table "media_subscribers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchandise_cancellation_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.integer "cancellation_event_id"
    t.string "title"
    t.text "message"
    t.boolean "show_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "journey_id"
    t.integer "wisdom_id"
    t.string "message_id", collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.integer "wisdom_type_id"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "is_primary_station"
    t.index ["end_date"], name: "idx_alert_end_date"
    t.index ["start_date"], name: "idx_alert_start_date"
    t.index ["station_code"], name: "idx_station_code"
    t.index ["wisdom_id"], name: "idx_messages_wisdom_id"
    t.index ["wisdom_type_id"], name: "idx_wisdom_type_id"
  end

  create_table "metro_stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "code"
    t.string "geo_address"
    t.string "geo_full_address"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.string "geo_precision"
    t.integer "geo_success"
    t.string "elevation"
    t.string "railway_zone"
    t.string "provider"
    t.integer "provider_id"
    t.string "state_name"
    t.string "sub_section"
    t.string "network_codes"
    t.string "route_type"
    t.string "metro_train_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metro_train_route_points", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "metro_train_route_id"
    t.integer "si_no"
    t.string "station_code"
    t.string "station_name"
    t.integer "p_arrival_minute"
    t.integer "p_departure_minute"
    t.string "p_stoppage"
    t.integer "arr_mins_src"
    t.string "train_type"
    t.decimal "distance_from_source", precision: 9, scale: 3
    t.integer "minutes_from_previous_stoppages"
    t.integer "speed_from_previous_stoppages"
    t.integer "distance_from_previous_stoppages"
    t.integer "interchange_flag"
    t.string "section_code"
    t.string "division_code"
    t.string "zone_code"
    t.decimal "station_lat", precision: 15, scale: 10
    t.decimal "station_lng", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "day", default: 0
    t.index ["metro_train_route_id"], name: "idx_metro_train_route_points_metro_train_route_id"
  end

  create_table "metro_train_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number"
    t.string "name"
    t.string "train_src"
    t.integer "dep_mins_src"
    t.string "train_dstn"
    t.integer "arr_mins_src"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.string "up_dn_flag"
    t.string "source"
    t.string "owning_rly"
    t.string "run_days"
    t.integer "interval"
    t.string "metro_train_city"
    t.string "route_type"
    t.text "metro_route_points"
    t.string "metro_route_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "train_src_name"
    t.string "train_dstn_name"
  end

  create_table "mobile_screens", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "screen_name"
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "month_wise_delay_ranks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "google_city_id"
    t.string "google_city_name", limit: 200
    t.string "state_name", limit: 200
    t.integer "avg_delay"
    t.integer "my_ranks"
    t.string "delay_month", limit: 200
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "multiple_vendor_trackings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "res_id"
    t.string "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "source"
    t.string "station_code"
  end

  create_table "near_station_places", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "address"
    t.decimal "distance_miles", precision: 15, scale: 10
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.integer "origin_station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["origin_station_id", "distance_miles"], name: "nsp_osid_dist_idx"
  end

  create_table "network_informations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "virtual_station_code"
    t.string "virtual_station_name"
    t.string "virtual_station_distance"
    t.string "station_code"
    t.string "station_name"
    t.string "station_distance"
    t.string "network_codes"
    t.string "network_name"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_code"], name: "station_code"
    t.index ["virtual_station_code"], name: "virtual_station_code"
  end

  create_table "new_configured_intermidiate_station_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "configured_intermidiate_station_id"
    t.string "station_name", collation: "utf8_unicode_ci"
    t.string "block_name", collation: "utf8_unicode_ci"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "si_no"
    t.string "network_codes", default: ""
  end

  create_table "new_master_bus_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "old_id"
    t.string "city_name", collation: "utf8_general_ci"
    t.string "b_city_ids"
    t.string "ty_city_ids"
    t.string "rb_city_ids"
    t.string "bi_city_ids"
    t.string "its_city_ids"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.integer "ry_city_id"
    t.string "ry_city_name"
    t.integer "google_city_id"
    t.string "google_city_name"
    t.integer "distance"
    t.string "temp1"
    t.string "temp2"
    t.string "temp3"
    t.string "temp4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["b_city_ids"], name: "idx_new_master_bus_cities_b_city_ids"
    t.index ["city_name", "google_city_id"], name: "idx_city_name_id"
    t.index ["rb_city_ids"], name: "idx_new_master_bus_cities_rb_city_ids"
  end

  create_table "new_master_bus_city_temps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "old_id"
    t.string "new_master_city_name"
    t.integer "new_master_city_id"
    t.string "city_name", collation: "utf8_general_ci"
    t.string "b_city_ids"
    t.string "ty_city_ids"
    t.string "rb_city_ids"
    t.string "bi_city_ids"
    t.string "its_city_ids"
    t.string "b_cities"
    t.string "ty_cities"
    t.string "rb_cities"
    t.string "its_cities"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.integer "ry_city_id"
    t.string "ry_city_name"
    t.integer "google_city_id"
    t.string "google_city_name"
    t.integer "distance"
    t.string "temp1"
    t.string "temp2"
    t.string "temp3"
    t.string "temp4"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["b_city_ids"], name: "idx_new_master_bus_cities_b_city_ids"
    t.index ["rb_city_ids"], name: "idx_new_master_bus_cities_rb_city_ids"
  end

  create_table "new_network_informations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "virtual_station_code"
    t.string "virtual_station_name"
    t.string "virtual_station_distance"
    t.string "station_code"
    t.string "station_name"
    t.string "station_distance"
    t.string "network_codes"
    t.string "network_name"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "new_pnr_number_counters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number"
    t.string "train_number"
    t.date "boarding_date"
    t.string "boarding_from"
    t.string "boarding_to"
    t.string "train_class"
    t.string "upgraded_from_class", limit: 50
    t.string "original_WL"
    t.string "final_WL"
    t.string "CNF"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "status"
    t.string "booking_quota"
    t.string "coach_position"
    t.integer "confirmation_probability"
    t.integer "upper_limits"
    t.integer "lower_limit"
    t.integer "data_points"
    t.boolean "chart_status", default: false
    t.index ["boarding_date"], name: "idx_pnr_number_counters_boarding_date"
    t.index ["boarding_from"], name: "idx_pnr_number_counters_boarding_from"
    t.index ["pnr_number"], name: "idx_pnr_number_counters_pnr_number"
    t.index ["train_number", "boarding_from"], name: "idx_pnr_number_counters_train_number_boarding_from"
    t.index ["train_number"], name: "idx_pnr_number_counters_train_number"
  end

  create_table "new_stoppages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.datetime "from_date", null: false
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "new_train_route_points_with_networks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "train_route_id"
    t.integer "si_no"
    t.string "station_code"
    t.integer "w_arrival_minute"
    t.integer "w_departure_minute"
    t.integer "p_arrival_minute"
    t.integer "p_departure_minute"
    t.boolean "w_stoppage"
    t.boolean "p_stoppage"
    t.integer "w_day"
    t.integer "p_day"
    t.integer "traffic_allowance"
    t.integer "eng_allowance"
    t.string "train_type"
    t.decimal "distance_from_source", precision: 9, scale: 3
    t.integer "minutes_from_previous_stoppage"
    t.integer "speed_from_previous_stoppage"
    t.integer "distance_from_previous_stoppage"
    t.integer "minutes_from_previous_station"
    t.integer "speed_from_previous_station"
    t.integer "distance_from_previous_station"
    t.boolean "interchange_flag"
    t.string "section_code"
    t.string "division_code"
    t.string "zone_code"
    t.integer "p_arrival_minute_of_day"
    t.integer "ntes_p_day"
    t.string "ntes_platform"
    t.boolean "ntes_enabled"
    t.boolean "ntes_created"
    t.integer "ntes_p_arrival_minute"
    t.integer "ntes_p_departure_minute"
    t.boolean "ntes_p_stoppage"
    t.decimal "ntes_si_no", precision: 4, scale: 2
    t.boolean "station_name"
    t.decimal "station_lat", precision: 15, scale: 10
    t.decimal "station_lng", precision: 15, scale: 10
    t.integer "train_platform_detail_id"
    t.integer "on_time_rating"
    t.integer "platform_number"
    t.string "comment_one"
    t.string "comment_two"
    t.string "network_codes"
    t.integer "fog_incidence_probability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "train_number", limit: 10
    t.string "train_name"
    t.index ["station_code"], name: "idx_new_train_route_points_with_networks_station_code"
    t.index ["train_number"], name: "train_number"
  end

  create_table "new_trains", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.integer "intermediate_station_id"
    t.string "user", collation: "utf8_unicode_ci"
    t.string "from_station_code", collation: "utf8_unicode_ci"
    t.string "to_station_code", collation: "utf8_unicode_ci"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.string "train_name", collation: "utf8_unicode_ci"
    t.datetime "start_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_date"
  end

  create_table "notification_answer_masters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.string "comments"
    t.integer "answer_id"
    t.string "created_at", limit: 45, null: false
    t.string "updated_at", limit: 45, null: false
    t.string "ttl"
    t.index ["id"], name: "id_UNIQUE", unique: true
  end

  create_table "notification_questions_masters", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "questions"
    t.string "image_url"
    t.string "created_at", limit: 45, null: false
    t.string "updated_at", limit: 45, null: false
    t.integer "is_active", null: false
    t.integer "category", null: false
    t.string "ttl", null: false
    t.string "header", limit: 45, null: false
    t.string "color", limit: 45, null: false
    t.index ["id"], name: "id_UNIQUE", unique: true
  end

  create_table "notification_reports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "notification_subscription_id"
    t.boolean "sent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notification_subscriptions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "notification_type"
    t.integer "user_id"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.integer "delivery_type"
    t.integer "generated_type"
    t.integer "notification_data_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notification_tags", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tag"
  end

  create_table "notification_tracks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "for_date"
    t.text "scheduled_notification_id"
    t.integer "user_id"
    t.text "push_tag"
    t.integer "sent_count"
    t.integer "not_sent_count"
    t.integer "nras_alert_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "idx_notification_tracks_user_id"
  end

  create_table "notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "notification_id"
    t.string "name"
    t.integer "ecomm_type"
    t.text "notification_tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "created_by", limit: 45
    t.string "notification_title"
    t.text "notification_msg"
  end

  create_table "ntes_hotspot_announcments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "TITLE", limit: 200, null: false
    t.string "DESCRIPTION", limit: 300
    t.string "TYPE", limit: 50
    t.datetime "VALID_FROM", null: false
    t.datetime "VALID_TO", null: false
    t.string "ROUTE", limit: 200, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ntes_raw_rows", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_no"
    t.date "valid_from"
    t.date "valid_upto"
    t.string "train_name"
    t.string "stn_code"
    t.integer "serial_no"
    t.integer "day_count"
    t.integer "arr_time"
    t.integer "dep_time"
    t.string "platform_no"
    t.index ["train_no", "serial_no"], name: "index_ntes_raw_rows_on_train_no_and_serial_no"
  end

  create_table "ntes_train_announcments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number", null: false
    t.string "train_name", limit: 500
    t.string "announcment_type", limit: 100
    t.string "station_route", limit: 5000
    t.datetime "valid_from"
    t.datetime "valid_to"
  end

  create_table "offers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_type"
    t.string "offer_title"
    t.string "short_description"
    t.text "long_description"
    t.string "short_image_url"
    t.string "detail_image_url"
    t.string "deep_Link"
    t.string "deep_Link_text"
    t.string "coupon_code"
    t.integer "deal_of_day"
    t.string "offer_tag"
    t.string "offer_tag_color"
    t.date "valid_from"
    t.date "valid_to"
    t.boolean "status", comment: "0 for inactive 1 for active coupon code"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "device_type"
    t.string "device_type_id"
    t.boolean "is_payment_offer", default: false, null: false, comment: "1 for payment offers"
    t.string "jpg_detail_image_url"
    t.string "deep_Link_text_color"
    t.string "deep_Link_bg_color"
    t.boolean "is_third_party", default: false, null: false
    t.string "windows_deeplink"
    t.string "ios_deeplink"
    t.integer "offer_type", default: 0
    t.string "offer_days"
    t.boolean "show_in_all", default: false
    t.boolean "display_in_ecomm_homepage", default: false
    t.string "screen_name"
    t.boolean "clickable", default: false
    t.index ["status", "offer_type"], name: "idx_status_offer_type"
    t.index ["valid_to", "valid_from"], name: "idx_valid_to_from"
  end

  create_table "offline_payments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "customer_id"
    t.string "name"
    t.string "email"
    t.string "mobile_no"
    t.text "description"
    t.string "invoice_code"
    t.string "invoice_url"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "ecomm_type"
    t.integer "order_id"
    t.string "invoice_data"
    t.string "tx_id"
    t.string "signature"
    t.boolean "payment_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_provider", default: 0
  end

  create_table "ola_uber_29_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "uber_user"
    t.integer "ola_user"
    t.string "city_name", limit: 250
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["id"], name: "id"
  end

  create_table "on_time_ratings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.string "late_count"
    t.string "on_time_count", collation: "utf8_unicode_ci"
    t.integer "si_no"
    t.string "on_time_rating", collation: "utf8_unicode_ci"
    t.decimal "avg_delay", precision: 6, scale: 2, default: "0.0"
    t.datetime "created_at"
    t.index ["train_number"], name: "idx_on_time_ratings_train_number"
  end

  create_table "operator_agreements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "operator_email"
    t.string "operator_name"
    t.text "operator_address"
    t.string "designation"
    t.decimal "commission", precision: 10
    t.string "entity_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "operator_signature_file_name"
    t.string "operator_signature_content_type"
    t.integer "operator_signature_file_size"
    t.datetime "operator_signature_updated_at"
    t.boolean "is_approved", default: false
    t.string "approved_by"
    t.date "approved_date"
  end

  create_table "order_cancellation_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "cancellation_type"
    t.integer "event_type"
    t.integer "ecomm_type"
    t.string "event_name"
    t.string "event_title"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_cancellation_histories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "ecomm_type"
    t.integer "order_cancellation_event_id"
    t.string "title"
    t.boolean "show_user"
    t.text "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["order_id", "ecomm_type"], name: "index_order_cancellation_histories_on_order_id_and_ecomm_type"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "order_reports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_type"
    t.date "from_date"
    t.date "to_date"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "email"
  end

  create_table "package_cab_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "types", limit: 45
    t.integer "status", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_cabs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "booking_id"
    t.integer "cab_type"
    t.string "cab_no", limit: 45
    t.string "driver_name", limit: 45
    t.integer "driver_contact_no"
    t.integer "status", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_details", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "travefy_package_id"
    t.text "travefy_pkg_key"
    t.text "package_data", limit: 4294967295
    t.text "ry_package_data", limit: 4294967295
    t.text "rtf_package_data", limit: 4294967295
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_event_categories", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 100
    t.string "source", limit: 8, default: "INTERNAL"
  end

  create_table "package_event_images", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "package_event_id"
    t.string "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_event_mappings", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "package_id"
    t.integer "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_event_tags", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 100
    t.integer "cat_id"
    t.integer "package_event_id"
    t.integer "status", limit: 1, default: 1, comment: "1=active, 0=inactive"
    t.datetime "created_at"
    t.datetime "udpated_at"
    t.string "tag_colour", limit: 45
    t.string "show_on_app", limit: 45
    t.string "text_colour"
  end

  create_table "package_events", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.string "event_title"
    t.text "event_info"
    t.string "other_event_title"
    t.text "other_event_info"
    t.integer "status", limit: 1, default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_images", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "package_id"
    t.string "travefy_img_url"
    t.string "ry_img_url"
    t.string "img_type", limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_inclusions", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "icon_url"
    t.integer "status", limit: 1, default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_notifications", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "query_id"
    t.integer "package_id"
    t.integer "user_id"
    t.string "title"
    t.text "message"
    t.string "image_url"
    t.string "deep_link"
    t.string "source", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_payment_schedules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "booking_id"
    t.decimal "amount", precision: 10, scale: 2
    t.date "due_date"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_payments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "booking_id"
    t.integer "user_id"
    t.decimal "amount", precision: 10, scale: 2
    t.string "tx_id"
    t.string "tx_status"
    t.string "payment_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "payment_date"
  end

  create_table "package_queries", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "ticket_no", limit: 100
    t.integer "package_id"
    t.integer "booking_id"
    t.integer "tt_booking_id"
    t.integer "user_id"
    t.string "user_name"
    t.string "mobile_number", limit: 11
    t.string "email"
    t.integer "male"
    t.integer "female"
    t.integer "children"
    t.date "starting_date"
    t.integer "is_date_confirmed", limit: 1, default: 0, comment: "0 - Tentative dates; 1- date has been fixed"
    t.string "starting_location"
    t.integer "tickets_booked", limit: 1, default: 0, comment: "0- travel tickets not booked yet; 1- travel tickets have been booked."
    t.string "source", limit: 100
    t.string "status", limit: 50, default: "0"
    t.text "comments"
    t.datetime "follow_up_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "resolved_comment", limit: 225
    t.integer "exploring_destination", limit: 1, default: 0
    t.integer "cab", limit: 1, default: 0
    t.string "departure_date"
    t.string "will_book"
    t.integer "event_id"
    t.integer "pkg_account_manager"
    t.integer "device_type_id"
    t.integer "v_code"
  end

  create_table "package_query_updates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "query_id"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_search_kewords", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_user_requirements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "query_id"
    t.string "package"
    t.string "destination"
    t.string "ex_destination"
    t.date "from_date"
    t.date "to_date"
    t.date "ex_from_date"
    t.date "ex_to_date"
    t.string "tour_duration"
    t.string "start_location"
    t.string "no_of_adult"
    t.string "adult_age"
    t.string "no_of_kid"
    t.string "kid_age"
    t.string "transport"
    t.string "transport_details"
    t.string "hotel_type"
    t.string "tour_type"
    t.string "tour_details"
    t.string "budget"
    t.text "other_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_metatags", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "page_name"
    t.string "title"
    t.text "keywords"
    t.text "description"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parsed_train_coaches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number", limit: 20
    t.string "train_type", limit: 10
    t.string "coach_type", limit: 10
    t.boolean "is_parsed", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parser_constants", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code_word", limit: 45
    t.string "hn_word"
    t.string "en_word"
    t.string "type_word", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_errors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "invoice_id"
    t.text "payment_response"
    t.string "payment_provider"
    t.string "error_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_new_alerts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "payment_new_mode_id"
    t.text "alert"
    t.string "source"
    t.string "added_by"
    t.datetime "from_time"
    t.datetime "to_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_new_modes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tag"
    t.string "name"
    t.string "pg_name", limit: 45
    t.string "provider"
    t.string "deeplink"
    t.string "deeplink_web"
    t.boolean "pg_status"
    t.boolean "offer_status"
    t.boolean "is_primary"
    t.datetime "offer_valid_from"
    t.datetime "offer_valid_to"
    t.integer "position"
    t.string "hdpi_img"
    t.string "xhdpi_img"
    t.string "xxhdpi_img"
    t.string "hdpi_offer_img"
    t.string "xhdpi_offer_img"
    t.string "xxhdpi_offer_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_new_options", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_type"
    t.integer "device_type_id"
    t.integer "min_vcode"
    t.integer "max_vcode"
    t.integer "payment_new_mode_id"
    t.integer "order"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_options", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_type"
    t.integer "android_app_release_id"
    t.integer "android_app_release_id_to"
    t.text "payment_option_json", limit: 4294967295
    t.text "old_payment_option_json"
    t.integer "device_type_id", default: 1
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_transaction_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "payment_transaction_id"
    t.string "card_name"
    t.integer "last4"
    t.string "network"
    t.string "card_type"
    t.string "issuer"
    t.boolean "international"
    t.boolean "emi"
    t.string "entity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "wallet_refund", precision: 10, scale: 2
    t.decimal "wallet_cashback", precision: 10, scale: 2
  end

  create_table "payment_transaction_errors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "invoice_id", default: 0
    t.integer "payment_transaction_id", default: 0
    t.integer "ecomm_type"
    t.string "error_reason"
    t.string "error_msg"
    t.text "post_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_transaction_histories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "vendor_id"
    t.string "tx_status"
    t.string "tx_id"
    t.string "tx_ref_no"
    t.string "pg_txn_no"
    t.string "pg_resp_code"
    t.text "tx_msg"
    t.decimal "amount", precision: 10, scale: 2
    t.string "auth_id_code"
    t.string "issuer_ref_no"
    t.string "signature"
    t.string "transaction_id"
    t.string "payment_mode"
    t.string "tx_gateway"
    t.string "currency"
    t.string "eci"
    t.string "txn_type"
    t.string "requested_currency"
    t.decimal "requested_amount", precision: 10, scale: 2
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "is_cod"
    t.datetime "txn_date_time"
    t.string "controller"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cust_id"
    t.string "cust_uid"
    t.integer "invoice_id", comment: "This is for bus and for further ecomm features, same as cust_id"
    t.decimal "wallet_debit", precision: 10
    t.decimal "discount_amt", precision: 10
    t.string "coupon_code"
    t.integer "ecomm_type", default: 0, comment: "0 for FOOD, 1 for BUS"
    t.integer "bus_trip_id", default: 0, comment: "ID from bus_trip table"
    t.string "payment_provider"
    t.integer "invoice_status", limit: 1, default: 0
    t.integer "manual_payment_transaction_id", default: 0
    t.string "manual_comments"
    t.boolean "is_valid", default: true
    t.decimal "points_discount_amount", precision: 10
    t.integer "points"
    t.integer "revised_status"
    t.string "train_payment_type"
    t.string "linked_invoice_id"
    t.string "card_id"
    t.string "card_no"
    t.integer "app_version"
    t.decimal "pg_amount", precision: 10
    t.boolean "wallet_status", default: false
    t.integer "combo_order_id"
    t.decimal "converted_amount", precision: 10, scale: 2
    t.decimal "currency_rate", precision: 10, scale: 2
    t.string "vpa"
    t.boolean "payment_status", default: false
    t.index ["pg_amount"], name: "pg_amount_UNIQUE", unique: true
  end

  create_table "payment_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "vendor_id"
    t.string "tx_status"
    t.string "tx_id"
    t.string "tx_ref_no"
    t.string "pg_txn_no"
    t.string "pg_resp_code"
    t.text "tx_msg"
    t.decimal "amount", precision: 10, scale: 2
    t.string "auth_id_code"
    t.string "issuer_ref_no"
    t.string "signature"
    t.string "transaction_id"
    t.string "payment_mode"
    t.string "tx_gateway"
    t.string "currency"
    t.string "eci"
    t.string "txn_type"
    t.string "requested_currency"
    t.decimal "requested_amount", precision: 10, scale: 2
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "is_cod"
    t.datetime "txn_date_time"
    t.string "controller"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cust_id"
    t.string "cust_uid"
    t.integer "invoice_id", comment: "This is for bus and for further ecomm features, same as cust_id"
    t.decimal "wallet_debit", precision: 10, scale: 2
    t.decimal "discount_amt", precision: 10, scale: 2
    t.string "coupon_code"
    t.integer "ecomm_type", default: 0, comment: "0 for FOOD, 1 for BUS"
    t.integer "bus_trip_id", default: 0, comment: "ID from bus_trip table"
    t.string "payment_provider"
    t.integer "invoice_status", limit: 1, default: 0
    t.integer "manual_payment_transaction_id", default: 0
    t.string "manual_comments"
    t.boolean "is_valid", default: true
    t.decimal "points_discount_amount", precision: 10
    t.integer "points"
    t.integer "revised_status"
    t.string "train_payment_type"
    t.string "linked_invoice_id"
    t.string "card_id"
    t.string "card_no"
    t.integer "app_version"
    t.decimal "pg_amount", precision: 10
    t.boolean "wallet_status", default: false
    t.integer "combo_order_id"
    t.decimal "converted_amount", precision: 10, scale: 2
    t.decimal "currency_rate", precision: 10, scale: 2
    t.string "vpa"
    t.boolean "payment_status", default: false
    t.index ["transaction_id"], name: "idx_transaction_id"
    t.index ["tx_id"], name: "idx_payment_transactions_tx_id"
  end

  create_table "payment_wallet_options", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tag"
    t.string "provider"
    t.integer "p_type"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paypal_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "payment_id"
    t.decimal "amount", precision: 10
    t.text "status_check_url"
    t.text "paypal_payment_url"
    t.text "execute_url"
    t.string "tx_id"
    t.string "payer_id"
    t.string "paypal_sale_id"
    t.string "status", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "error_debug_id"
    t.index ["payment_id"], name: "index_paypal_payments_on_payment_id"
    t.index ["tx_id"], name: "index_paypal_payments_on_tx_id"
  end

  create_table "pg_csv_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "file_name"
    t.string "payment_provider"
    t.string "url"
    t.integer "status", default: 0
    t.string "payment_type", limit: 45
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phone_verifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "phone_number"
    t.string "otp_no"
    t.datetime "end_time"
    t.datetime "start_time"
    t.boolean "is_varify", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "pkg_account_managers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "email"
    t.string "mobile_number"
    t.string "gender"
    t.integer "manager_type", default: 0
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pkg_categories", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 100
    t.string "source", limit: 8, default: "INTERNAL"
  end

  create_table "pkg_inclusion_mappings", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "package_id"
    t.integer "inclusion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pkg_tag_mappings", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
  end

  create_table "pkg_tags", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 100
    t.integer "cat_id"
    t.integer "pkg_id"
    t.integer "status", limit: 1, default: 1, comment: "1=active, 0=inactive"
    t.string "tag_colour"
    t.integer "show_on_app", default: 0
    t.datetime "created_at"
    t.datetime "udpated_at"
    t.string "text_colour", limit: 45
  end

  create_table "pkg_types", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50
    t.integer "status", limit: 1, default: 1, comment: "1=active; 0=incative"
    t.string "bg_color"
    t.text "description"
  end

  create_table "pkg_user_account_managers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "pkg_account_manager_id"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pkg_user_callbacks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "pkg_account_manager_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pkg_user_messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "pkg_user_account_manager_id"
    t.string "title", collation: "utf8_general_ci"
    t.text "description", collation: "utf8_general_ci"
    t.string "note_text"
    t.text "image_url"
    t.string "image_title", collation: "utf8_general_ci"
    t.text "image_description", collation: "utf8_general_ci"
    t.integer "category", default: 0, comment: "0=> single image/multiple image;1=>default message/request submited;2=>request callback form;3=>video;"
    t.integer "status", default: 1
    t.string "created_by", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platform_tips", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "platform_number"
    t.string "station_code"
    t.text "comment_one"
    t.text "comment_two"
    t.text "comment_three"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_number", "station_code"], name: "index_platform_tips_on_platform_number_and_station_code"
  end

  create_table "platform_wisdoms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_platform_detail_id"
    t.integer "wisdom_id"
  end

  create_table "pnr_alarm_tracks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number"
    t.integer "user_id"
    t.integer "device_type_id"
    t.datetime "alarm_time"
    t.string "source"
    t.string "current_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pnr_number"], name: "index_pnr_alarm_tracks_on_pnr_number"
  end

  create_table "pnr_captcha_status", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number"
    t.text "response"
    t.string "response_status", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pnr_captcha_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "pnr_number"
    t.text "response", limit: 16777215
    t.string "response_status", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "user_id"
    t.text "response_html", limit: 16777215
  end

  create_table "pnr_journey_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "pnr_number_id"
    t.string "pnr_code"
    t.string "train_number"
    t.string "train_name"
    t.date "boarding_date"
    t.string "src_stn"
    t.string "dest_stn"
    t.string "boarding_stn"
    t.string "reserved_upto_stn"
    t.string "journey_class"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "reserved_upto_for_break_journey"
    t.float "total_distance", limit: 24
    t.float "total_time", limit: 24
    t.index ["boarding_date"], name: "index_pnr_journey_details_on_boarding_date"
    t.index ["boarding_stn"], name: "idx_pnr_journey_details_boarding_stn"
    t.index ["pnr_number_id"], name: "index_pnr_journey_details_on_pnr_number_id"
    t.index ["reserved_upto_stn"], name: "idx_pnr_journey_details_reserved_upto_stn"
    t.index ["train_number"], name: "idx_pnr_journey_details_train_number"
  end

  create_table "pnr_number_counters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number"
    t.string "train_number"
    t.date "boarding_date"
    t.string "boarding_from"
    t.string "boarding_to"
    t.string "train_class"
    t.string "original_WL"
    t.string "final_WL"
    t.string "CNF"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "status"
    t.string "booking_quota"
    t.string "coach_position"
    t.integer "confirmation_probability"
    t.integer "upper_limits"
    t.integer "lower_limit"
    t.integer "data_points"
    t.boolean "chart_status", default: false
    t.string "reserved_from"
    t.string "reserved_upto"
    t.string "req_src"
    t.index ["boarding_date"], name: "idx_pnr_number_counters_boarding_date"
    t.index ["boarding_from"], name: "idx_pnr_number_counters_boarding_from"
    t.index ["pnr_number"], name: "idx_pnr_number_counters_pnr_number"
    t.index ["train_number", "boarding_from"], name: "idx_pnr_number_counters_train_number_boarding_from"
    t.index ["train_number"], name: "idx_pnr_number_counters_train_number"
  end

  create_table "pnr_numbers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1\n/*!50100 PARTITION BY HASH (id)\nPARTITIONS 200 */" do |t|
    t.string "chart_status"
    t.string "error_msg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "pnr_number"
    t.datetime "boarding_datetime"
    t.datetime "status_recheck_time"
    t.date "train_start_date"
    t.integer "passenger_count", limit: 1
    t.integer "status", limit: 1
    t.string "source"
    t.float "total_fare", limit: 24
    t.string "reserved_upto"
    t.string "reserved_from"
    t.string "req_src"
    t.integer "pnr_source", limit: 1, default: 0
    t.string "board_from"
    t.string "board_to"
    t.string "released_pnr_number"
    t.date "booking_date"
    t.string "ticket_type"
    t.index ["boarding_datetime"], name: "idx_pnr_numbers_boarding_datetime"
    t.index ["created_at"], name: "idx_created_at"
    t.index ["pnr_number"], name: "idx_pnr_numbers_pnr_number"
  end

  create_table "pnr_passenger_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "pnr_number_id"
    t.string "si_no"
    t.string "booking_status"
    t.string "current_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "seat_number"
    t.string "coach_position"
    t.string "pnr_number", limit: 20
    t.integer "confirmation_probability"
    t.integer "status"
    t.string "from_server"
    t.string "passenger_name"
    t.integer "passenger_age"
    t.string "passenger_gender"
    t.string "passenger_phone"
    t.string "passenger_berth"
    t.index ["pnr_number"], name: "pnr_number"
    t.index ["pnr_number_id"], name: "idx_pnr_passenger_details_pnr_number_id"
  end

  create_table "pnr_passengers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "pnr_number_id"
    t.string "pnr_number"
    t.string "booking_status"
    t.string "current_status"
    t.string "quota"
    t.string "nationality"
    t.integer "waitlist_type"
    t.boolean "child_berth_flag"
    t.boolean "concession_opted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pnr_number"], name: "index_pnr_passengers_on_pnr_number"
    t.index ["pnr_number_id"], name: "index_pnr_passengers_on_pnr_number_id"
  end

  create_table "pnr_rcheck_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number", null: false
    t.text "rcheck"
    t.string "response_status"
    t.text "response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "user_id"
    t.string "rcheck_generated_at"
  end

  create_table "pnr_sms_texts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "pnr_number_id"
    t.text "pnr_sms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "sms_timestamp"
    t.text "sms_sender_name"
    t.text "sms_sender_number"
    t.string "user_id", limit: 45
    t.integer "is_valid", limit: 1
    t.integer "is_flight_pnr", limit: 1
    t.integer "is_bus_pnr", limit: 1
  end

  create_table "pnr_temp_rakes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "pnr_number"
    t.integer "status", limit: 1, default: 0
    t.datetime "boarding_date"
    t.datetime "rake_started_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "messages"
    t.string "data_from"
    t.boolean "chart_status", default: false
  end

  create_table "pnr_temps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "pnr_number"
    t.integer "status", limit: 1, default: 0
    t.datetime "rake_started_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "messages"
    t.string "data_from"
    t.boolean "chart_status", default: false
    t.datetime "boarding_date"
  end

  create_table "pnr_trip_shares", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "trip_id"
    t.string "user_mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "booking_status"
    t.string "current_status"
    t.boolean "is_deleted", default: false
  end

  create_table "possible_train_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id", null: false
    t.string "train_number"
    t.string "possible_station_sequence"
    t.integer "uniq_timestamp", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "user_id"
  end

  create_table "possible_user_station_sequences", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id", null: false
    t.string "station_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "user_id"
  end

  create_table "press_releases", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "logo_image"
    t.text "article_image"
    t.string "state"
    t.text "description"
    t.datetime "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "article_image_2"
    t.text "article_image_3"
  end

  create_table "providers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.string "email"
    t.integer "phone_number"
    t.string "company_name"
    t.integer "rating"
  end

  create_table "queue", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "query_str", limit: 4294967295
    t.integer "campaign_id"
    t.integer "subscriber_id"
    t.integer "sent", default: 0
    t.index ["sent"], name: "st_id"
    t.index ["subscriber_id"], name: "s_id"
  end

  create_table "railyatri_booking_services", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ecomm_type"
    t.datetime "from_datetime", null: false
    t.datetime "to_datetime", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.boolean "show_icon", default: false
    t.boolean "auto_assign", default: false, null: false
    t.integer "f_working_hour"
    t.integer "t_working_hour"
    t.index ["ecomm_type", "auto_assign"], name: "idx_booking_services_ecomm_type_auto_assign"
  end

  create_table "railyatri_coupons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "coupon_code", limit: 50, null: false
    t.integer "coupon_type"
    t.integer "coupon_for"
    t.string "applicable_for", limit: 100, null: false
    t.integer "max_discount"
    t.integer "offer_rate", null: false
    t.integer "user_id"
    t.integer "user_limit", null: false
    t.integer "coupon_count_for_user", default: 0
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.date "delivery_date_from"
    t.date "delivery_date_to"
    t.integer "minimum_order_value", default: 0, null: false
    t.integer "reduction_type"
    t.integer "status", default: 1, null: false
    t.integer "payment_type", default: 0, null: false
    t.integer "provider_id", null: false
    t.string "source"
    t.string "descriptions"
    t.integer "is_city", limit: 1, default: 0
    t.integer "ecomm_type", default: 0
    t.string "product_id"
    t.text "avoid_product_ids"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ry_display_status", limit: 1, default: 0, null: false
    t.integer "application_display", default: 0
    t.integer "auto_apply", limit: 1, default: 0
    t.string "coupon_head", comment: "For the display purpose"
    t.integer "coupon_limit", default: 0
    t.integer "coupon_limit_per_day", limit: 1, default: 0, comment: "If true, coupon_limit will work on per day basis"
    t.integer "operator_id"
    t.string "from_city"
    t.string "to_city"
    t.string "deep_link"
    t.string "version_code"
    t.string "device_type_id", limit: 50
    t.integer "cashback_offer_rate", default: 0
    t.float "cb_max_discount", limit: 24
    t.integer "cb_reduction_type"
    t.integer "wallet_cashback_flag", default: 0
    t.integer "user_campaigns_id"
    t.string "product_table_name"
    t.string "product_table_amount_column"
    t.time "from_time"
    t.time "to_time"
    t.integer "coupon_value"
    t.index ["coupon_code"], name: "idx_railyatri_coupons_coupon_code"
    t.index ["ecomm_type", "status"], name: "idx_railyatri_coupons_ecomm_type_status"
    t.index ["ecomm_type", "valid_to", "valid_from"], name: "idx_ecomm_type_to_from"
    t.index ["ecomm_type"], name: "idx_railyatri_coupons_ecomm_type"
    t.index ["status"], name: "idx_railyatri_coupons_status"
  end

  create_table "railyatri_customers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username"
    t.datetime "create_at"
    t.datetime "updated_at"
    t.string "email"
    t.string "password"
    t.string "mobile_number"
  end

  create_table "railyatri_daily_commuters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "user_id", collation: "utf8_unicode_ci"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.string "from_station_code", collation: "utf8_unicode_ci"
    t.string "to_station_code", collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railyatri_ratings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "entity_id"
    t.string "entity_type"
    t.decimal "rating", precision: 4, scale: 2
    t.text "comment"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railyatri_user_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number", null: false
    t.string "email"
    t.string "gender"
    t.string "street"
    t.string "city"
    t.string "zipcode"
    t.string "country_code"
    t.string "company_name"
    t.string "job_title"
    t.string "facebook_id"
    t.string "twitter_id"
    t.string "avatar_url"
    t.string "url"
    t.boolean "is_true_name", default: false
    t.boolean "is_ambassador", default: false
    t.string "payload"
    t.string "signature"
    t.string "signature_algorithm"
    t.string "provider", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railyatri_user_permissions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "railyatri_user_reinstalls", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.datetime "orig_created_at"
    t.datetime "last_used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railyatri_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "username"
    t.string "ryid"
    t.string "login_type"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "uid"
    t.string "access_token"
    t.string "facebook_image_url"
    t.string "hometown", limit: 128
    t.string "location", limit: 128
    t.datetime "last_report_date"
    t.string "fb_report_status", limit: 32
    t.integer "fb_report_enable"
    t.bigint "fb_location_id"
    t.string "android_app_id"
    t.string "android_email_id"
    t.string "mobile_number"
    t.integer "android_app_release_id"
    t.integer "application"
    t.string "provider", default: ""
    t.string "imei_1"
    t.string "imei_2"
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.string "make_and_model"
    t.text "other_email_addresses"
    t.string "verified_mobile_number"
    t.string "unverified_mobile_number"
    t.string "device_type"
    t.integer "device_type_id"
    t.string "gender"
    t.string "profile_url"
    t.boolean "profile", default: false
    t.integer "cannonical_id"
    t.string "fb_email_id"
    t.string "gm_email_id"
    t.string "authentication_token"
    t.text "additional_devices"
    t.string "gu_id"
    t.string "lang", default: "en"
    t.string "ry_hash"
    t.string "os_v_name"
    t.string "os_v_code"
    t.boolean "is_invalid", default: false, null: false
    t.string "ad_id"
    t.boolean "is_uninstalled", default: false
    t.string "operator_name"
    t.integer "sim_info"
    t.string "razr_customer_id"
    t.integer "version_number"
    t.index ["ad_id"], name: "idx_railyatri_users_ad_id"
    t.index ["android_app_id"], name: "idx_android_app_id"
    t.index ["created_at"], name: "indx_created_at"
    t.index ["device_type_id"], name: "idx_device_type_id"
    t.index ["email"], name: "idx_railyatri_users_email"
    t.index ["gu_id"], name: "idx_guid"
    t.index ["id", "created_at"], name: "idx_id_created_at_unique", unique: true
    t.index ["id", "reset_password_token"], name: "idx_id_reset_password_token_unique", unique: true
    t.index ["id"], name: "idx_id_unique", unique: true
    t.index ["imei_1"], name: "idx_railyatri_users_imei_1"
    t.index ["is_invalid"], name: "idx_railyatri_users_is_invalid"
    t.index ["mobile_number"], name: "idx_railyatri_users_mobile_number"
    t.index ["reset_password_token"], name: "idx_reset_password_token", unique: true
    t.index ["unverified_mobile_number"], name: "idx_railyatri_users_unverified_mobile_number"
    t.index ["updated_at"], name: "indx_updated_at"
    t.index ["verified_mobile_number"], name: "idx_railyatri_users_verified_mobile_number"
  end

  create_table "railyatri_users_histories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "source"
    t.string "column_name"
    t.string "last_version"
    t.string "current_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "idx_railyatri_users_histories_user_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "railyatri_users_uninstalls", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.date "user_created"
    t.date "uninstalled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "app_id"
    t.string "app_version"
    t.index ["app_id"], name: "idx_railyatri_users_uninstalls_app_id"
    t.index ["user_id"], name: "idx_railyatri_users_uninstalls_user_id"
  end

  create_table "rake_masters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "server_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "razorpay_orders", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "ry_transaction_id"
    t.string "razor_pay_order_id", limit: 50
    t.float "amount", limit: 24
    t.string "razor_pay_status", limit: 10
    t.string "razor_pay_payment_id", default: ""
    t.text "razor_pay_response"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["razor_pay_order_id"], name: "razor_pay_id"
    t.index ["ry_transaction_id"], name: "transaction_id"
  end

  create_table "redbus_commissions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "operator_id"
    t.string "operator_name"
    t.float "operator_commission_percentage", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refund_calculations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_neft_detail_id"
    t.integer "order_id"
    t.decimal "merchant_refund", precision: 10
    t.decimal "wallet_debit", precision: 10
    t.decimal "wallet_credit", precision: 10
    t.integer "ecomm_type"
    t.boolean "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "instant_refund_request_id"
    t.index ["user_neft_detail_id"], name: "index_refund_calculations_on_user_neft_details_id"
  end

  create_table "refund_queues", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "ecomm_type"
    t.string "refund_type"
    t.integer "counter", default: 0
    t.string "status", default: "pending"
    t.string "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "order_cancelled"
    t.index ["order_id", "ecomm_type"], name: "index_refund_queues_on_order_id_and_ecomm_type"
  end

  create_table "refund_rules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_status"
    t.string "journey_class"
    t.float "hours_greater", limit: 24
    t.float "hours_less", limit: 24
    t.float "amount", limit: 24
    t.boolean "amount_type"
    t.float "service_charge", limit: 24, default: 0.0
    t.float "service_tax", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refund_track_tickets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "mobile_number"
    t.integer "order_id"
    t.integer "ecomm_type"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refund_transaction_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "refund_transaction_id"
    t.decimal "wallet_money", precision: 10, scale: 2
    t.decimal "wallet_cashback", precision: 10, scale: 2
    t.decimal "reused_wallet_money", precision: 10, scale: 2
    t.boolean "wallet_refund_status"
    t.string "wallet_credit_api_res"
    t.string "wallet_debit_api_res"
  end

  create_table "refund_transaction_errors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "ecomm_type"
    t.string "error_code"
    t.string "error_message"
    t.boolean "is_pg_issue"
    t.decimal "wallet_refund_amt", precision: 10
    t.decimal "merchant_refund_amt", precision: 10
    t.decimal "wallet_debit", precision: 10
    t.text "comment"
    t.string "refund_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refund_transaction_histories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "cust_id"
    t.integer "ry_user_id"
    t.integer "ry_journey_id"
    t.integer "payment_transactions_id"
    t.string "tx_id"
    t.float "refund_amount", limit: 24
    t.string "bank_txn_id"
    t.string "status"
    t.string "response_code"
    t.string "response_msg"
    t.string "refund_provider"
    t.string "initiate_by"
    t.float "order_amount", limit: 24
    t.boolean "partial_refund", default: false
    t.text "comment"
    t.string "refund_id"
    t.integer "ecomm_type", limit: 1
    t.string "rrn"
    t.string "pg_txn_id"
    t.string "tx_gateway"
    t.string "payment_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "wallet_debit", precision: 10, default: "0"
    t.float "wallet_refund_amount", limit: 24
    t.datetime "pg_refund_time"
    t.string "refund_type", limit: 45, default: "standard"
    t.boolean "wallet_to_bank"
    t.integer "user_wallet_detail_id"
    t.boolean "final_status"
    t.boolean "pg_status"
    t.boolean "wallet_refund_status"
    t.boolean "wallet_debit_status"
    t.decimal "total_refund_amount", precision: 10
    t.boolean "excess_payment_refund"
    t.index ["order_id", "ecomm_type"], name: "index_refund_transactions_on_order_id_and_ecomm_type"
    t.index ["refund_id"], name: "idx_refund_id"
    t.index ["tx_id"], name: "idx_tx_id"
  end

  create_table "refund_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "cust_id"
    t.integer "ry_user_id"
    t.integer "ry_journey_id"
    t.integer "payment_transactions_id"
    t.string "tx_id"
    t.float "refund_amount", limit: 24
    t.string "bank_txn_id"
    t.string "status"
    t.string "response_code"
    t.string "response_msg"
    t.string "refund_provider"
    t.string "initiate_by"
    t.float "order_amount", limit: 24
    t.boolean "partial_refund", default: false
    t.text "comment"
    t.string "refund_id"
    t.integer "ecomm_type", limit: 1
    t.string "rrn"
    t.string "pg_txn_id"
    t.string "tx_gateway"
    t.string "payment_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "wallet_debit", precision: 10, default: "0"
    t.float "wallet_refund_amount", limit: 24
    t.datetime "pg_refund_time"
    t.string "refund_type", limit: 45, default: "standard"
    t.boolean "wallet_to_bank"
    t.integer "user_wallet_detail_id"
    t.boolean "final_status"
    t.boolean "pg_status"
    t.boolean "wallet_refund_status"
    t.boolean "wallet_debit_status"
    t.decimal "total_refund_amount", precision: 10
    t.boolean "excess_payment_refund"
    t.index ["order_id", "ecomm_type"], name: "index_refund_transactions_on_order_id_and_ecomm_type"
    t.index ["refund_id"], name: "idx_refund_id"
    t.index ["tx_id"], name: "idx_tx_id"
  end

  create_table "regulations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number"
    t.string "station_code"
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_code"], name: "station_code"
    t.index ["wisdom_id"], name: "wisdom_id"
  end

  create_table "reports", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "cretaed_on"
  end

  create_table "reschedules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number"
    t.string "station_code"
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wisdom_id"], name: "wisdom_id"
  end

  create_table "restaurant_profiles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "state"
    t.string "city"
    t.string "name"
    t.integer "rest_id"
    t.text "summ_title"
    t.text "desc_title"
    t.string "station_code"
    t.string "lang"
    t.string "summ_img_url"
    t.text "summary"
    t.text "description"
    t.text "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img1_file_name"
    t.string "img1_content_type"
    t.integer "img1_file_size"
    t.datetime "img1_updated_at"
    t.string "img2_file_name"
    t.string "img2_content_type"
    t.integer "img2_file_size"
    t.datetime "img2_updated_at"
    t.string "img3_file_name"
    t.string "img3_content_type"
    t.integer "img3_file_size"
    t.datetime "img3_updated_at"
    t.string "img4_file_name"
    t.string "img4_content_type"
    t.integer "img4_file_size"
    t.datetime "img4_updated_at"
    t.string "img5_file_name"
    t.string "img5_content_type"
    t.integer "img5_file_size"
    t.datetime "img5_updated_at"
    t.boolean "is_deleted", default: false
  end

  create_table "retiring_room_bookings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "room_name"
    t.integer "room_id"
    t.integer "retiring_room_id"
    t.datetime "check_in_date"
    t.string "in_out_time"
    t.integer "guests"
    t.string "name"
    t.integer "age"
    t.string "ph_no"
    t.string "email"
    t.float "total_price", limit: 24
    t.string "booking_ref_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "city"
    t.datetime "expires_in"
    t.integer "hotel_id"
    t.integer "agent_id"
    t.string "remarks"
    t.integer "order_id"
  end

  create_table "retiring_room_hotels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "address"
    t.string "contact"
    t.float "lat", limit: 24
    t.float "lng", limit: 24
    t.integer "retiring_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "retiring_room_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "city"
    t.string "station_code"
    t.string "name"
    t.text "image_urls"
    t.text "description"
    t.text "facilities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lat", limit: 24
    t.float "lng", limit: 24
    t.text "agent_id"
  end

  create_table "retiring_room_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.date "sent_date"
    t.text "stations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "retiring_room_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "room_name"
    t.string "room_type"
    t.float "price", limit: 24
    t.text "room_images"
    t.text "room_description"
    t.integer "capacity"
    t.integer "retiring_room_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hours"
  end

  create_table "roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "resource_id"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_level_amenities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "vendor_id"
    t.integer "room_type_id"
    t.string "roomtype"
    t.integer "amenityid"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "route_wise_top5_trains", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_number"
    t.string "source_city", limit: 200
    t.integer "source_city_id"
    t.string "destination_city", limit: 200
    t.integer "destination_city_id"
    t.integer "no_of_trips"
    t.integer "my_ranks"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "rtc_available_trips", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "trip_id"
    t.integer "source_city_id"
    t.integer "destination_city_id"
    t.string "source_name"
    t.string "destination_name"
    t.integer "bus_type_id"
    t.string "bus_type", limit: 20
    t.string "rtc", limit: 50
    t.integer "ry_provider_id"
    t.string "provider_name", limit: 50
    t.integer "ry_rtc_id"
    t.integer "provider_rtc_id"
    t.float "fare", limit: 24
    t.date "journey_date"
    t.string "refund_status", limit: 13, default: "Refundable"
    t.string "seat_status", limit: 2, default: "A"
    t.integer "seat_available"
    t.integer "provider_service_id"
    t.text "service_provider_response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["source_city_id"], name: "source_id"
    t.index ["trip_id"], name: "tripp_id"
  end

  create_table "rtc_route_points", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "source_city_id"
    t.integer "destination_city_id"
    t.integer "provider_id"
    t.integer "rtc_id"
    t.string "provider_name"
    t.integer "provider_point_id"
    t.integer "provider_service_id"
    t.string "point_name"
    t.string "address"
    t.string "location"
    t.string "landmark"
    t.string "time", limit: 20
    t.integer "platform_no"
    t.string "point_type", limit: 8, default: "BOARDING"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rush_alerts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.integer "intermediate_station_id"
    t.string "user"
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rush_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rush_name", null: false
    t.integer "rush_type", default: 0
    t.text "rush_state"
    t.text "rush_station"
    t.integer "rush"
    t.date "rush_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ry_agent_bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ry_agent_id"
    t.integer "railyatri_user_id"
    t.integer "bus_trip_id"
    t.integer "payment_transaction_id"
    t.boolean "status", default: false
    t.string "booked_by"
    t.float "booking_discount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ry_agent_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "address"
    t.integer "ry_agent_id"
    t.float "current_discount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ry_agents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_ry_agents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_ry_agents_on_reset_password_token", unique: true
  end

  create_table "ry_bus_surveys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ry_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "ry_media", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "month"
    t.string "year"
    t.string "title"
    t.text "description"
    t.string "publisher"
    t.datetime "published_date"
    t.string "links"
    t.boolean "featured", default: false
    t.string "image"
    t.string "types"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ry_messages", primary_key: "Message_ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "Message_Type_ID"
    t.string "Message_Title", limit: 100, collation: "utf8_unicode_ci"
    t.string "Message_Body", limit: 1024, collation: "utf8_unicode_ci"
    t.string "From_Station_Code", limit: 50, collation: "utf8_unicode_ci"
    t.string "To_Station_Code", limit: 50, collation: "utf8_unicode_ci"
    t.datetime "Message_Validity_Start_Date"
    t.datetime "Work_Start_Date"
    t.datetime "Work_End_Date"
    t.text "Source", collation: "utf8_unicode_ci"
    t.string "Published_By", limit: 100, collation: "utf8_unicode_ci"
    t.text "More_Info", collation: "utf8_unicode_ci"
    t.string "Railway_Zone", limit: 100, collation: "utf8_unicode_ci"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ry_messagetypes", primary_key: "MessageTypeID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "MessageText", limit: 100, collation: "utf8_unicode_ci"
    t.string "MessageDescription", limit: 1024, collation: "utf8_unicode_ci"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ry_rtc_lists", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rtc_name", limit: 50
    t.string "rtc_full_name"
    t.string "rtc_state", limit: 100
    t.integer "advance_reservation_days"
    t.integer "max_seats_allowed"
    t.integer "rtc_id_by_provider"
    t.string "provider", limit: 50
    t.string "logo_url", limit: 100
    t.string "main_image_url"
    t.string "cancellation_policy"
    t.text "cancellation_info"
    t.text "welcome_text"
    t.string "m_ticket", limit: 10, default: "NOTALLOWED", null: false
    t.string "govt_id", limit: 12, default: "NOTMANDATORY", null: false
    t.string "partial_cancellation", limit: 10, default: "NOTALLOWED"
    t.integer "status", limit: 1, default: 1, null: false, comment: "1= Active; 2= tem Disabled; 3= Inactive"
    t.integer "rb_operator_id"
    t.integer "ty_operator_id"
    t.index ["rtc_id_by_provider"], name: "id_by_provider"
    t.index ["status"], name: "status"
  end

  create_table "ry_station_messages", primary_key: "ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "Message_ID"
    t.string "MessageType", limit: 100, collation: "utf8_unicode_ci"
    t.string "Message_Title", limit: 100, collation: "utf8_unicode_ci"
    t.string "Message_Body", limit: 1024, collation: "utf8_unicode_ci"
    t.string "From_Station_Code", limit: 50, collation: "utf8_unicode_ci"
    t.string "To_Station_Code", limit: 50, collation: "utf8_unicode_ci"
    t.datetime "Message_Validity_Start_Date"
    t.datetime "Work_Start_Date"
    t.datetime "Work_End_Date"
    t.string "Railway_Zone", limit: 100, collation: "utf8_unicode_ci"
    t.string "Station_code", limit: 100, collation: "utf8_unicode_ci"
    t.datetime "Message_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ry_user_profiles", primary_key: "user_id", id: :integer, default: 0, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", null: false, auto_increment: true
    t.integer "is_invalid"
    t.string "user_type", limit: 250
    t.integer "premium_trips"
    t.integer "total_trips"
    t.date "upcoming_travel_date"
    t.integer "avg_travel_hours"
    t.integer "avg_passenger_count"
    t.integer "bus_bookings"
    t.integer "bus_booking_amount"
    t.integer "train_bookings"
    t.integer "train_booking_amount"
    t.integer "food_orders"
    t.integer "food_booking_amount"
    t.string "food_feedback_status", limit: 200
    t.integer "gps_enabled"
    t.string "version_status", limit: 250
    t.string "city_name", limit: 200
    t.integer "no_of_active_days"
    t.integer "hotel_booking"
    t.integer "hotel_booking_amount"
    t.integer "retiring_bookings"
    t.integer "retiring_booking_amount"
    t.integer "mechandise_orders"
    t.integer "merchandise_order_amount"
    t.timestamp "created_at_ist", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at_ist", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "classifier"
    t.index ["id"], name: "id"
  end

  create_table "ry_vendor_coupons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "coupon_id"
    t.string "vendor_id"
    t.float "discount_rate", limit: 24, default: 0.0
    t.float "cb_rate", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scenic_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "trip_id"
    t.integer "parent_trip_id"
    t.integer "user_id"
    t.string "train_number"
    t.date "train_start_date"
    t.string "code"
    t.date "notification_date"
    t.boolean "is_processed", default: false
    t.string "comment"
    t.datetime "gps_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_date", "user_id", "train_number", "train_start_date", "code"], name: "by_nd_uid_tn_tsd_code"
    t.index ["trip_id"], name: "index_scenic_notifications_on_trip_id"
  end

  create_table "scenic_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "station_code", limit: 45, null: false
    t.string "station_name", limit: 45, null: false
    t.string "event", limit: 45, null: false
    t.string "notification_text", limit: 45, null: false
    t.string "route", limit: 45, null: false
    t.string "station_code_from", limit: 45, null: false
    t.string "station_code_to", limit: 45, null: false
    t.string "time", limit: 45, null: false
    t.string "distance", limit: 45, null: false
    t.string "description", null: false
    t.integer "is_active", null: false
    t.string "image_url"
    t.index ["id"], name: "id_UNIQUE", unique: true
  end

  create_table "schedule_changes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.datetime "from_date", null: false
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scheduled_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "file"
    t.text "cities"
    t.boolean "all_version", default: false
    t.string "version_from"
    t.string "version_to"
    t.text "deep_link"
    t.string "push_type"
    t.text "push_message"
    t.string "batch_size"
    t.string "push_email"
    t.datetime "schedule_time"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "has_city", default: false
    t.boolean "has_image", default: false
    t.string "image_url"
    t.boolean "is_scheduled", default: false
    t.text "app_id"
    t.string "tag"
    t.string "language"
    t.integer "campaign_id"
    t.string "notification_id", limit: 45
    t.string "exclude_days", limit: 45
    t.integer "sent_count"
    t.integer "failure_count"
    t.integer "success_count"
  end

  create_table "seat_availability_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "boarding_from"
    t.string "boarding_to"
    t.string "journey_class"
    t.string "quota"
    t.string "train_name"
    t.datetime "journey_date"
    t.text "response_text"
    t.string "response_status", limit: 50
    t.string "ir_board_from"
    t.string "ir_board_to"
    t.string "data_src"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "response"
  end

  create_table "service_parameters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "service_no"
    t.text "service_parameters"
    t.integer "alert_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "session_id", null: false, collation: "utf8_unicode_ci"
    t.text "data", limit: 4294967295, collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id"
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "shared_pnr_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shared_train_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.date "train_start_date"
    t.string "station_code"
    t.datetime "station_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shared_trips", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "journey_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sharing_media", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "type_id"
    t.string "type_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "short_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wisdom_id"], name: "wisdom_id"
  end

  create_table "short_stay_amenities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title", limit: 50
    t.string "provider", limit: 50
    t.integer "status", default: 1, comment: "1=active;0=incative"
  end

  create_table "short_stay_frotel_rate_cards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code"
    t.string "title"
    t.string "provider_rate_card_code"
    t.integer "short_stay_room_id"
    t.integer "short_stay_hotel_id"
    t.integer "occupancy"
    t.float "duration_hrs", limit: 24
    t.decimal "start_time", precision: 10, scale: 2
    t.decimal "end_time", precision: 10, scale: 2
    t.float "base_price", limit: 24
    t.float "discount", limit: 24
    t.float "tax", limit: 24
    t.float "total_price", limit: 24
    t.string "operating_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_stay_hotel_id"], name: "index_short_stay_frotel_rate_cards_on_short_stay_hotel_id"
    t.index ["short_stay_room_id"], name: "index_short_stay_frotel_rate_cards_on_short_stay_room_id"
  end

  create_table "short_stay_hotel_add_on_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 45, null: false
    t.boolean "is_ry_category", default: false, null: false
  end

  create_table "short_stay_hotel_add_on_sub_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "short_stay_hotel_add_on_category_id", null: false
    t.string "name", limit: 45, null: false
    t.boolean "is_ry_add_on", default: false, null: false
    t.integer "max_qty_for_fix_price", default: 1, null: false
    t.string "description", limit: 350
    t.index ["short_stay_hotel_add_on_category_id"], name: "index_on_add_on_category_id"
  end

  create_table "short_stay_hotel_add_ons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "short_stay_hotel_id", null: false
    t.integer "short_stay_hotel_add_on_sub_category_id", null: false
    t.float "price", limit: 24, default: 0.0, null: false
    t.string "start_time", limit: 45, default: "00:00", null: false
    t.string "end_time", limit: 45, default: "00:00", null: false
    t.index ["short_stay_hotel_id", "short_stay_hotel_add_on_sub_category_id"], name: "unique_constraint_on_hotel_id_and_hotel_add_on_sub_category", unique: true
    t.index ["short_stay_hotel_id"], name: "index_on_short_stay_hotel_id"
  end

  create_table "short_stay_hotels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "partner_hotel_id"
    t.integer "short_stay_provider_id"
    t.string "hotel_name", limit: 100
    t.string "address_1"
    t.string "address_2"
    t.string "city", limit: 50, default: ""
    t.string "state", limit: 50
    t.string "country", limit: 50
    t.integer "pincode"
    t.string "location", limit: 100
    t.string "phone", limit: 100
    t.string "email", limit: 100
    t.text "overview"
    t.text "description"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.text "hotel_policy"
    t.text "image_url"
    t.text "cancellation_policy"
    t.integer "status", comment: "1=enabled;0=disabled"
    t.float "hotel_rating", limit: 24, default: 0.0
    t.float "user_rating", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "marriedcouplesallowed"
    t.integer "unmarriedcouplesallowed"
    t.integer "allowbulkbooking"
    t.integer "nightbooking"
    t.integer "daybooking"
    t.integer "ry_commission"
    t.string "hotel_identifier", limit: 45
    t.string "account_holder_name", limit: 45
    t.integer "account_number"
    t.string "account_type", limit: 45
    t.string "bank", limit: 45
    t.string "ifsc", limit: 45
    t.string "branch", limit: 45
    t.boolean "pay_at_hotel_available", default: false
    t.integer "prepay_discount_rate", default: 0
  end

  create_table "short_stay_providers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50
    t.string "short_code", limit: 10
    t.integer "status", comment: "1=Active, 0=Inactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "short_stay_rate_cards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code", limit: 50
    t.string "title", limit: 50
    t.integer "short_stay_provider_id"
    t.string "provider_rate_card_code", limit: 50
    t.integer "short_stay_room_id"
    t.integer "short_stay_hotel_id"
    t.integer "occupancy"
    t.float "duration_hrs", limit: 24
    t.float "start_time", limit: 24, comment: "24 hrs format"
    t.float "end_time", limit: 24, comment: "24 hrs format"
    t.float "base_price", limit: 24
    t.float "discount", limit: 24
    t.float "tax", limit: 24
    t.float "total_price", limit: 24
    t.string "operating_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "short_stay_room_amenities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "short_stay_room_sold_out_dates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "short_stay_room_id", null: false
    t.date "sold_out_date", null: false
    t.index ["short_stay_room_id"], name: "index_on_short_stay_room_id"
    t.index ["sold_out_date"], name: "index_on_sold_out_date"
  end

  create_table "short_stay_rooms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "room_code", limit: 50
    t.integer "short_stay_hotel_id"
    t.string "room_name", limit: 50
    t.integer "short_stay_provider_id"
    t.string "provider_room_code", limit: 80
    t.integer "max_accomdation"
    t.integer "max_adults"
    t.integer "max_children"
    t.text "room_images"
    t.text "room_amenities"
    t.text "cancellation_desc"
    t.integer "status", comment: "1=Active;0=Inactive"
    t.string "provider_second_room_code", limit: 80
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rate_per_children", limit: 45
    t.integer "extra_people_allowed"
    t.integer "rate_per_person"
    t.integer "extra_child_allowed"
    t.index ["room_code"], name: "room_code"
    t.index ["short_stay_hotel_id"], name: "ss-hotel-id"
  end

  create_table "short_stay_searches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "city"
    t.date "start_date"
    t.date "end_date"
    t.float "start_time", limit: 24
    t.float "duration", limit: 24
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_captcha_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "key", limit: 40
    t.string "value", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "idx_key"
  end

  create_table "slip_train_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_route_id"
    t.integer "slip_train_route_id"
    t.string "adj_source"
    t.string "adj_destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smart_buses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "bus_id"
    t.string "bus_number"
    t.integer "total_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "schedule"
    t.date "start_date"
  end

  create_table "smart_card_blocked_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "smart_card_id"
    t.integer "user_id"
    t.integer "is_blocked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smart_card_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "smart_card_id"
    t.integer "railyatri_coupon_id"
    t.integer "used_count"
    t.integer "ecomm_type"
    t.float "card_discount_amount", limit: 24, default: 0.0
    t.float "card_cost", limit: 24
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.integer "is_valid"
    t.string "invoice_ids"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smart_cards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "railyatri_coupon_id"
    t.integer "valid_months"
    t.integer "count_limit"
    t.float "card_cost", limit: 24
    t.string "card_img_url1"
    t.string "card_msg1"
    t.string "card_img_url2"
    t.string "card_msg2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "t_and_c"
    t.integer "new_card_hold_days", default: 0
    t.string "hold_img_url"
    t.string "hold_img_msg1"
    t.string "hold_img_msg2"
    t.string "passenger_card_image"
  end

  create_table "sms_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "numbers"
    t.text "body"
    t.string "url"
    t.string "response_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "special_event_app_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "android_app_id"
    t.string "android_email_id"
    t.string "mobile_number"
    t.integer "android_app_release_id"
    t.integer "application"
    t.index ["android_app_id"], name: "idx_android_app_id"
    t.index ["android_email_id"], name: "idx_android_email_id"
  end

  create_table "special_trains", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.integer "intermediate_station_id"
    t.string "user", collation: "utf8_unicode_ci"
    t.string "from_station_code", collation: "utf8_unicode_ci"
    t.string "to_station_code", collation: "utf8_unicode_ci"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.string "train_name", collation: "utf8_unicode_ci"
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wisdom_id"], name: "wisdom_id"
  end

  create_table "splashes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "display_time", default: 5
    t.integer "ecomm_type", default: 100
    t.integer "display_per_day", default: 0
    t.boolean "display_once", default: false
    t.boolean "is_wifi_only", default: false
    t.string "image_url"
    t.boolean "is_processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["start_date", "end_date"], name: "idx_sd_ed"
  end

  create_table "state_wise_delay_ranks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "google_city_id"
    t.string "google_city_name", limit: 200
    t.string "state_name", limit: 200
    t.string "avg_delay_mins", limit: 200
    t.integer "my_ranks"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "states", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "state_name"
    t.string "state_code", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "station_delay_rankings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ranking"
    t.string "station_code"
    t.string "station_name"
    t.string "state"
    t.float "average_delay", limit: 24
    t.integer "number_of_trains"
    t.float "percent_change", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_code"], name: "index_station_delay_rankings_on_station_code"
  end

  create_table "station_food_feedbacks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "station_code", limit: 10
    t.string "train_number", limit: 20
    t.string "menu_item"
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "train_name"
    t.decimal "user_ratings", precision: 4, scale: 2
  end

  create_table "station_hospitals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "station_code"
    t.integer "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "station_maps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "station_name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "station_code"
  end

  create_table "station_search_foods", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "btb_user_id"
    t.string "email"
    t.string "org_name"
    t.string "train_number"
    t.string "from_station_name"
    t.string "from_station_code"
    t.string "to_station_code"
    t.string "to_station_name"
    t.date "boarding_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "station_wisdoms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "wisdom_id"
    t.string "station_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "admin_station"
  end

  create_table "stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "geo_address"
    t.string "geo_full_address"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.string "geo_precision"
    t.boolean "geo_success"
    t.string "elevation"
    t.string "railway_zone"
    t.string "provider"
    t.string "provider_id"
    t.string "state_name"
    t.string "sub_section"
    t.boolean "is_primary_station", default: false
    t.integer "station_zone_id", default: 0
    t.integer "fog_incidence_probability", default: 0
    t.string "local_train_city"
    t.string "network_codes", default: ""
    t.integer "city_id"
    t.integer "total_platform"
    t.integer "no_of_trains", default: 0
    t.integer "radius", default: 300
    t.boolean "is_rail_heads", default: false
    t.index ["code", "name"], name: "index_stations_on_code_and_name", unique: true
    t.index ["code"], name: "code"
    t.index ["provider", "provider_id"], name: "index_stations_on_provider_and_provider_id"
    t.index ["station_zone_id"], name: "idx_stations_station_zone_id"
  end

  create_table "subscribers", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "userID"
    t.string "name", limit: 100
    t.string "email", limit: 100
    t.text "custom_fields", limit: 4294967295
    t.integer "list"
    t.integer "unsubscribed", default: 0
    t.integer "bounced", default: 0
    t.integer "bounce_soft", default: 0
    t.integer "complaint", default: 0
    t.integer "last_campaign"
    t.integer "last_ares"
    t.integer "timestamp"
    t.integer "join_date"
    t.integer "confirmed", default: 1
    t.string "messageID", limit: 100
    t.index ["bounce_soft"], name: "s_bounce_soft"
    t.index ["bounced"], name: "s_bounced"
    t.index ["complaint"], name: "s_complaint"
    t.index ["confirmed"], name: "s_confirmed"
    t.index ["email"], name: "s_email"
    t.index ["list"], name: "s_list"
    t.index ["timestamp"], name: "s_timestamp"
    t.index ["unsubscribed"], name: "s_unsubscribed"
  end

  create_table "surveys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "survey_name", default: ""
    t.string "survey_type", default: ""
    t.string "survey_monkey_id"
    t.string "response_message", default: ""
    t.string "last_deep_link", default: "m.railyatri.in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_monkey_id"], name: "index_surveys_on_survey_monkey_id"
  end

  create_table "tb_available_hotels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "hotel_id", limit: 50
    t.string "ry_hotel_code", limit: 50
    t.string "name", limit: 20
    t.string "street", limit: 50
    t.string "city", limit: 50, default: ""
    t.string "partner_id", limit: 10
    t.string "postal_code", limit: 6
    t.string "state", limit: 50
    t.string "country", limit: 20
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.text "desc"
    t.string "images"
    t.string "checkinout_policy"
    t.integer "star_rating"
    t.string "phone", limit: 10
    t.integer "infant_age_limit"
    t.integer "child_age_limit"
    t.text "room_data"
    t.string "party"
    t.date "checkin_date"
    t.date "checkout_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ry_hotel_code"], name: "ry_hotel_code"
  end

  create_table "tbl_sample_products", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "product_name"
    t.string "company"
    t.text "display_text"
    t.text "image_url"
    t.text "tnc_url"
    t.integer "display_order"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temp_advertisements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "SI_NO"
    t.string "STATION_CODE"
    t.string "TITLE"
    t.string "image_url", limit: 500
    t.string "MESSAGE", limit: 500
    t.string "tips", limit: 500
    t.string "EMAIL"
  end

  create_table "temp_bus_trips", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "actual_base_fare", limit: 225
    t.string "base_fare"
    t.string "discount"
    t.string "taxes"
    t.string "total_amount"
    t.integer "bus_trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_trip_id"], name: "index_temp_bus_trips_on_bus_trip_id"
  end

  create_table "temp_konkan_train_route_points", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "train_route_id", null: false
    t.integer "si_no", null: false
    t.string "station_code", null: false
    t.integer "w_arrival_minute"
    t.integer "w_departure_minute"
    t.integer "p_arrival_minute"
    t.integer "p_departure_minute"
    t.boolean "w_stoppage"
    t.boolean "p_stoppage"
    t.integer "w_day"
    t.integer "p_day"
    t.integer "traffic_allowance"
    t.integer "eng_allowance"
    t.string "train_type"
    t.decimal "distance_from_source", precision: 9, scale: 3
    t.integer "minutes_from_previous_stoppage"
    t.integer "speed_from_previous_stoppage"
    t.integer "distance_from_previous_stoppage"
    t.integer "minutes_from_previous_station"
    t.integer "speed_from_previous_station"
    t.integer "distance_from_previous_station"
    t.boolean "interchange_flag"
    t.string "section_code"
    t.string "division_code"
    t.string "zone_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "p_arrival_minute_of_day"
    t.integer "ntes_p_day"
    t.string "ntes_platform"
    t.boolean "ntes_enabled"
    t.boolean "ntes_created"
    t.integer "ntes_p_arrival_minute"
    t.integer "ntes_p_departure_minute"
    t.boolean "ntes_p_stoppage", default: false
    t.decimal "ntes_si_no", precision: 4, scale: 2
    t.string "station_name"
    t.decimal "station_lat", precision: 15, scale: 10
    t.decimal "station_lng", precision: 15, scale: 10
    t.integer "train_platform_detail_id"
    t.integer "on_time_rating"
    t.integer "platform_number"
    t.string "comment_one"
    t.string "comment_two"
    t.integer "fog_incidence_probability", default: 0
    t.index ["si_no"], name: "si_no"
    t.index ["station_code"], name: "index_train_route_points_on_station_code"
    t.index ["train_route_id"], name: "train_route_id"
  end

  create_table "temp_metro_train_route_points", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "metro_train_route_id"
    t.integer "si_no"
    t.string "station_code"
    t.string "station_name"
    t.integer "p_arrival_minute"
    t.integer "p_departure_minute"
    t.string "p_stoppage"
    t.integer "arr_mins_src"
    t.string "train_type"
    t.decimal "distance_from_source", precision: 9, scale: 3
    t.integer "minutes_from_previous_stoppages"
    t.integer "speed_from_previous_stoppages"
    t.integer "distance_from_previous_stoppages"
    t.integer "interchange_flag"
    t.string "section_code"
    t.string "division_code"
    t.string "zone_code"
    t.decimal "station_lat", precision: 15, scale: 10
    t.decimal "station_lng", precision: 15, scale: 10
    t.string "metro_route_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temp_platform_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "train_number"
    t.string "platform_number"
    t.string "alter_pf_number"
    t.string "station_code"
    t.string "gallop"
    t.string "chord"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_key_values", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "template_id", default: 1
    t.integer "card_template_id"
    t.integer "template_key_id"
    t.text "default_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_display", default: false
    t.index ["card_template_id"], name: "idx_card_template_id"
  end

  create_table "template_keys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "key_name"
    t.string "valid_cards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "default_value"
  end

  create_table "templates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "template_name"
    t.string "template_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_sa", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "name", collation: "utf8_general_ci"
  end

  create_table "testers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "id", null: false, auto_increment: true
    t.integer "user_id"
    t.string "email", limit: 250
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["id"], name: "id"
  end

  create_table "ticket_booking_forms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "from_station", limit: 10
    t.string "to_station", limit: 10
    t.text "passenger_details"
    t.string "phone_number", limit: 30
    t.string "email", limit: 100
    t.date "travel_date"
    t.string "train_number", limit: 20
    t.boolean "allow_alternate_class"
    t.boolean "allow_alternate_board_st"
    t.string "travel_class"
    t.boolean "book_allow_class"
    t.string "selected_class", limit: 20
    t.text "child_details"
    t.string "train_preferred_time"
    t.string "optimise_for"
  end

  create_table "timelines", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "Start_Date"
    t.date "End_Date"
    t.text "headline"
    t.text "text"
    t.text "media"
    t.text "Media_Credit"
    t.text "Media_Caption"
    t.text "Media_Thumbnail"
    t.string "type"
    t.string "tag"
    t.boolean "isAdd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timetable_changes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.integer "train_route_id"
    t.integer "old_train_route_id"
    t.boolean "is_changed", default: false
    t.boolean "is_processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment_two"
    t.index ["train_number"], name: "idx_train_number"
  end

  create_table "tiny_urls", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "link"
    t.string "shorten"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tmp_emails", primary_key: "email1", id: :string, limit: 500, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", limit: 500
  end

  create_table "tmp_for_mongo", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number"
    t.integer "total_count"
    t.datetime "last_update_at"
  end

  create_table "tmp_train_coach_positions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "train_number_id"
    t.string "train_num"
    t.string "coach_name"
    t.string "boarding_hist_date"
    t.integer "coach_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tmp_user_cell_location", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
  end

  create_table "tmp_userneareststation", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.string "station_code", limit: 50, null: false
    t.index ["user_id", "station_code"], name: "idx_tmp_userneareststation_user_id_station_code"
  end

  create_table "tour_package_bookings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "booking_id"
    t.integer "tour_package_id"
    t.integer "user_id"
    t.float "package_price", limit: 24
    t.date "start_date"
    t.date "end_date"
    t.integer "male"
    t.integer "female"
    t.integer "children"
    t.string "mobile_number"
    t.string "email"
    t.string "user_name"
    t.string "booking_status", limit: 20
    t.integer "status", default: 1, null: false, comment: "1= pending;2= added to query;3= partial payment; 4= full payment;5=cancellation request;6=cancelled"
    t.string "payment_status", limit: 20
    t.integer "ecomm_type", default: 5, null: false
    t.float "paid_amount", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "device_type_id"
    t.integer "v_code"
  end

  create_table "tour_package_days", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "day_no"
    t.string "activity_title"
    t.text "activity_description"
    t.integer "tour_package_id"
  end

  create_table "tour_package_faqs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "tour_package_id"
    t.text "question"
    t.text "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_package_highlights", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.integer "tour_package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_package_hotels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "city"
    t.string "hotel"
    t.text "description"
    t.integer "nights"
    t.integer "tour_package_id"
    t.integer "day_no"
  end

  create_table "tour_package_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "image_url"
    t.integer "is_primary", limit: 1
    t.integer "tour_package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_packages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "package_name"
    t.text "duration"
    t.integer "duration_days"
    t.integer "duration_nights"
    t.float "package_price", limit: 24
    t.float "discounted_price", limit: 24
    t.float "discount_percent", limit: 24
    t.integer "coupon_id"
    t.float "cashback_amount", limit: 24
    t.float "cashback_percent", limit: 24
    t.integer "provider_id"
    t.string "provider_name"
    t.string "offer_tag"
    t.text "special_tag"
    t.text "short_highlight"
    t.text "short_itinerary"
    t.text "note"
    t.text "meals_on_tour"
    t.text "extras"
    t.string "speciality"
    t.string "reporting_point"
    t.string "dropping_point"
    t.integer "status", limit: 1, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "track_journey_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "from_station"
    t.string "to_station"
    t.datetime "boarding_date"
    t.string "notification_type"
    t.boolean "status", default: false
    t.bigint "user_id"
    t.bigint "trip_id"
    t.string "notification_sent_time"
    t.string "pnr_number"
  end

  create_table "track_on_train_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.decimal "lat_after_float", precision: 15, scale: 10
    t.decimal "lng_after_float", precision: 15, scale: 10
    t.integer "user_id"
    t.string "train_number"
    t.text "android_app_id"
    t.string "status"
    t.text "status_full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "track_restaurants", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "res_id", null: false
    t.integer "status", default: 0, null: false
  end

  create_table "train_booking_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "email_id"
    t.string "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_booking_rates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number", limit: 20
    t.string "journey_class", limit: 20
    t.string "from_station", limit: 20
    t.string "to_station", limit: 20
    t.integer "journey_month"
    t.string "date_diff_range", limit: 50
    t.integer "date_diff_number"
    t.decimal "booking_rate", precision: 12, scale: 2
    t.decimal "hightomedium", precision: 12, scale: 2
    t.decimal "mediumtolow", precision: 12, scale: 2
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["date_diff_number"], name: "date_diff_number"
    t.index ["from_station"], name: "from_station"
    t.index ["journey_class"], name: "journey_class"
    t.index ["journey_month"], name: "journey_month"
    t.index ["to_station"], name: "to_station"
    t.index ["train_number"], name: "train_number"
  end

  create_table "train_coach_positions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "train_number_id"
    t.string "train_num"
    t.string "coach_name"
    t.string "boarding_hist_date"
    t.integer "coach_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_coaches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "train_master_type_code"
    t.string "train_master_coach_type_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
  end

  create_table "train_current_locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.date "train_start_date"
    t.integer "user_id"
    t.string "input_from"
    t.string "input_data"
    t.string "output_data"
    t.text "output_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number", "train_start_date"], name: "tn_tsd"
  end

  create_table "train_delay_indices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "train_name"
    t.string "train_type"
    t.integer "total_schedule_time"
    t.decimal "total_distance", precision: 8, scale: 3
    t.integer "rank"
    t.integer "name_of_year"
    t.integer "yearly_avg_delay"
    t.decimal "yearly_medium_late", precision: 5, scale: 2
    t.decimal "yearly_ontime", precision: 5, scale: 2
    t.decimal "yearly_very_late", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number"], name: "index_train_delay_indices_on_train_number"
  end

  create_table "train_fair_masters", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "from_km"
    t.integer "to_km"
    t.integer "fair"
    t.string "train_master_type_code"
    t.string "train_master_coach_type_code"
    t.integer "train_coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_season_on"
  end

  create_table "train_historical_instances", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.datetime "train_start_date"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_info", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "train_number", null: false
    t.integer "dep_min", null: false
    t.time "dep_time", null: false
    t.integer "arr_min", null: false
    t.time "arr_time", null: false
    t.string "run_days", limit: 250, null: false
    t.integer "run", null: false
    t.string "Day1", limit: 25, null: false
    t.string "Day2", limit: 25, null: false
    t.string "Day3", limit: 25, null: false
    t.string "Day4", limit: 25, null: false
    t.string "Day5", limit: 25, null: false
    t.string "Day6", limit: 25, null: false
    t.string "Day7", limit: 25, null: false
    t.integer "start_hour", null: false
    t.integer "end_houe", null: false
    t.integer "q_dep", null: false
    t.integer "q_arr", null: false
  end

  create_table "train_info1", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "train_number", null: false
    t.integer "dep_min", null: false
    t.time "dep_time", null: false
    t.integer "arr_min", null: false
    t.time "arr_time", null: false
    t.string "run_days", limit: 250, null: false
    t.string "D1", limit: 25, null: false
    t.string "D2", limit: 25, null: false
    t.string "D3", limit: 25, null: false
    t.string "D4", limit: 25, null: false
    t.string "D5", limit: 25, null: false
    t.string "D6", limit: 25, null: false
    t.string "D7", limit: 25, null: false
    t.integer "run", null: false
  end

  create_table "train_info2", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "train_number", null: false
    t.integer "dep_min", null: false
    t.time "dep_time", null: false
    t.integer "arr_min", null: false
    t.time "arr_time", null: false
    t.string "run_days", limit: 250, null: false
    t.string "D1", limit: 25, null: false
    t.string "D2", limit: 25, null: false
    t.string "D3", limit: 25, null: false
    t.string "D4", limit: 25, null: false
    t.string "D5", limit: 25, null: false
    t.string "D6", limit: 25, null: false
    t.string "D7", limit: 25, null: false
    t.integer "run", null: false
    t.string "D11", limit: 25, null: false
    t.string "D22", limit: 25, null: false
    t.string "D33", limit: 25, null: false
    t.string "D44", limit: 25, null: false
    t.string "D55", limit: 25, null: false
    t.string "D66", limit: 25, null: false
    t.string "D77", limit: 25, null: false
  end

  create_table "train_mappings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "old_train_number"
    t.string "new_train_number"
    t.integer "parent_id"
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_active", default: true
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_master_coach_types", primary_key: "code", id: :string, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_master_types", primary_key: "code", id: :string, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "new_code", limit: 45
    t.boolean "is_display", default: false
  end

  create_table "train_messages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.integer "wisdom_type_id"
    t.string "train_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "is_primary_train"
    t.index ["created_at"], name: "idx_alert_created_at"
    t.index ["end_date"], name: "idx_alert_end_date"
    t.index ["start_date"], name: "idx_alert_start_date"
    t.index ["train_number"], name: "idx_train_number"
    t.index ["wisdom_type_id", "train_number"], name: "idx_wisdom_type_id"
  end

  create_table "train_name_changes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.datetime "from_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_number_changes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "wisdom_id"
    t.string "old_train_number", collation: "utf8_unicode_ci"
    t.string "new_train_number", collation: "utf8_unicode_ci"
    t.datetime "from_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_numbers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number"
    t.string "train_name"
    t.string "train_type"
    t.string "run_days"
    t.text "location_tags", limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "route_points", limit: 16777215
    t.string "extended_train_name"
    t.integer "slip_train_route_id", default: 0, null: false
    t.integer "fog_incidence_probability", default: 0
    t.string "local_train_city"
    t.string "comment_one"
    t.string "comment_two"
    t.boolean "is_local", default: false
    t.date "ntes_valid_to"
    t.string "train_type_new"
    t.string "new_train_number"
    t.string "old_train_number"
    t.string "train_name_hindi"
    t.string "name_hindi"
    t.boolean "available_pantry", default: false
    t.string "train_name_ir"
    t.string "train_name_seo"
    t.string "parallel_trains"
    t.boolean "dynamic_fare_train", default: false
    t.index ["train_number"], name: "idx_train_numbers_train_number"
  end

  create_table "train_platform_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number", collation: "utf8_unicode_ci"
    t.integer "platform_number"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.text "comment_one"
    t.text "comment_two"
    t.string "status", limit: 50, default: "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.integer "user_id"
    t.boolean "is_validate", default: false
    t.integer "ry_validated", default: 0
    t.index ["train_number"], name: "idx_train_platform_details_train_number"
  end

  create_table "train_platform_tmp_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number", collation: "utf8_unicode_ci"
    t.integer "platform_number"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.text "comment1", collation: "utf8_unicode_ci"
    t.text "comment2", collation: "utf8_unicode_ci"
    t.text "wisdom_id", collation: "utf8_unicode_ci"
  end

  create_table "train_platform_user_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_platform_detail_id"
    t.integer "platform_number"
    t.boolean "is_approved", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_train_platform_user_details_on_id"
    t.index ["train_platform_detail_id"], name: "index_train_platform_user_details_on_train_platform_detail_id"
  end

  create_table "train_reversals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number"
    t.string "station_code"
    t.integer "total_coaches"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number"], name: "index_train_reversals_on_train_number"
  end

  create_table "train_route_archieve", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id", default: 0, null: false
    t.string "train_number", collation: "latin1_swedish_ci"
    t.string "train_name", collation: "latin1_swedish_ci"
    t.string "train_type", collation: "latin1_swedish_ci"
    t.string "train_src", collation: "latin1_swedish_ci"
    t.integer "dep_mins_src"
    t.string "train_dstn", collation: "latin1_swedish_ci"
    t.integer "arr_mins_dstn"
    t.string "run_days", collation: "latin1_swedish_ci"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.string "brake_type", collation: "latin1_swedish_ci"
    t.string "train_sub_type", collation: "latin1_swedish_ci"
    t.string "owning_rly", collation: "latin1_swedish_ci"
    t.string "train_gauge", collation: "latin1_swedish_ci"
    t.integer "ir_route_number"
    t.string "up_dn_flag", collation: "latin1_swedish_ci"
    t.string "source", collation: "latin1_swedish_ci"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "ntes_valid_to"
    t.integer "slip_type", default: 0, null: false
    t.integer "fog_incidence_probability", default: 0
    t.string "train_characteristics"
    t.string "local_train_city"
    t.string "comment_one"
    t.string "comment_two"
    t.boolean "is_local", default: false
  end

  create_table "train_route_cell_towers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_number"
    t.string "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number"], name: "train_number"
  end

  create_table "train_route_points", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_route_id", null: false
    t.integer "si_no", null: false
    t.string "station_code", null: false
    t.integer "w_arrival_minute"
    t.integer "w_departure_minute"
    t.integer "p_arrival_minute"
    t.integer "p_departure_minute"
    t.boolean "w_stoppage"
    t.boolean "p_stoppage"
    t.integer "w_day"
    t.integer "p_day"
    t.integer "traffic_allowance"
    t.integer "eng_allowance"
    t.string "train_type"
    t.decimal "distance_from_source", precision: 9, scale: 3
    t.integer "minutes_from_previous_stoppage"
    t.integer "speed_from_previous_stoppage"
    t.integer "distance_from_previous_stoppage"
    t.integer "minutes_from_previous_station"
    t.integer "speed_from_previous_station"
    t.integer "distance_from_previous_station"
    t.boolean "interchange_flag"
    t.string "section_code"
    t.string "division_code"
    t.string "zone_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "p_arrival_minute_of_day"
    t.integer "ntes_p_day"
    t.string "ntes_platform"
    t.boolean "ntes_enabled"
    t.boolean "ntes_created"
    t.integer "ntes_p_arrival_minute"
    t.integer "ntes_p_departure_minute"
    t.boolean "ntes_p_stoppage", default: false
    t.decimal "ntes_si_no", precision: 5, scale: 2
    t.string "station_name"
    t.decimal "station_lat", precision: 15, scale: 10
    t.decimal "station_lng", precision: 15, scale: 10
    t.integer "train_platform_detail_id"
    t.integer "on_time_rating"
    t.integer "platform_number"
    t.string "comment_one"
    t.string "comment_two"
    t.integer "fog_incidence_probability", default: 0
    t.integer "technical_hault", limit: 1, default: 0
    t.integer "d_day"
    t.boolean "food_available", default: false
    t.boolean "hotel_available", default: false
    t.integer "hotel_city_id"
    t.string "hotel_city_name"
    t.string "train_stop_days"
    t.boolean "is_rail_heads", default: false
    t.index ["p_stoppage"], name: "idx_train_route_points_p_stoppage"
    t.index ["si_no"], name: "si_no"
    t.index ["station_code"], name: "idx_station_code"
    t.index ["station_code"], name: "index_train_route_points_on_station_code"
    t.index ["train_route_id", "si_no"], name: "idx_train_route_points_train_route_id_si_no"
    t.index ["train_route_id"], name: "train_route_id"
  end

  create_table "train_route_points_with_networks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "train_route_id"
    t.integer "si_no"
    t.string "station_code"
    t.integer "w_arrival_minute"
    t.integer "w_departure_minute"
    t.integer "p_arrival_minute"
    t.integer "p_departure_minute"
    t.boolean "w_stoppage"
    t.boolean "p_stoppage"
    t.integer "w_day"
    t.integer "p_day"
    t.integer "traffic_allowance"
    t.integer "eng_allowance"
    t.string "train_type"
    t.decimal "distance_from_source", precision: 9, scale: 3
    t.integer "minutes_from_previous_stoppage"
    t.integer "speed_from_previous_stoppage"
    t.integer "distance_from_previous_stoppage"
    t.integer "minutes_from_previous_station"
    t.integer "speed_from_previous_station"
    t.integer "distance_from_previous_station"
    t.boolean "interchange_flag"
    t.string "section_code"
    t.string "division_code"
    t.string "zone_code"
    t.integer "p_arrival_minute_of_day"
    t.integer "ntes_p_day"
    t.string "ntes_platform"
    t.boolean "ntes_enabled"
    t.boolean "ntes_created"
    t.integer "ntes_p_arrival_minute"
    t.integer "ntes_p_departure_minute"
    t.boolean "ntes_p_stoppage"
    t.decimal "ntes_si_no", precision: 4, scale: 2
    t.string "station_name"
    t.decimal "station_lat", precision: 15, scale: 10
    t.decimal "station_lng", precision: 15, scale: 10
    t.integer "train_platform_detail_id"
    t.integer "on_time_rating"
    t.integer "platform_number"
    t.string "comment_one"
    t.string "comment_two"
    t.string "network_codes"
    t.integer "fog_incidence_probability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "train_number", limit: 10
    t.string "train_name"
    t.index ["station_code"], name: "idx_train_route_points_with_networks_station_code"
    t.index ["station_name"], name: "station_name"
    t.index ["train_number"], name: "idx_train_route_points_with_networks_train_number"
  end

  create_table "train_route_points_with_networks_new", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "train_route_id"
    t.integer "si_no"
    t.string "station_code"
    t.integer "w_arrival_minute"
    t.integer "w_departure_minute"
    t.integer "p_arrival_minute"
    t.integer "p_departure_minute"
    t.boolean "w_stoppage"
    t.boolean "p_stoppage"
    t.integer "w_day"
    t.integer "p_day"
    t.integer "traffic_allowance"
    t.integer "eng_allowance"
    t.string "train_type"
    t.decimal "distance_from_source", precision: 9, scale: 3
    t.integer "minutes_from_previous_stoppage"
    t.integer "speed_from_previous_stoppage"
    t.integer "distance_from_previous_stoppage"
    t.integer "minutes_from_previous_station"
    t.integer "speed_from_previous_station"
    t.integer "distance_from_previous_station"
    t.boolean "interchange_flag"
    t.string "section_code"
    t.string "division_code"
    t.string "zone_code"
    t.integer "p_arrival_minute_of_day"
    t.integer "ntes_p_day"
    t.string "ntes_platform"
    t.boolean "ntes_enabled"
    t.boolean "ntes_created"
    t.integer "ntes_p_arrival_minute"
    t.integer "ntes_p_departure_minute"
    t.boolean "ntes_p_stoppage"
    t.decimal "ntes_si_no", precision: 4, scale: 2
    t.string "station_name"
    t.decimal "station_lat", precision: 15, scale: 10
    t.decimal "station_lng", precision: 15, scale: 10
    t.integer "train_platform_detail_id"
    t.integer "on_time_rating"
    t.integer "platform_number"
    t.string "comment_one"
    t.string "comment_two"
    t.string "network_codes"
    t.integer "fog_incidence_probability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "train_number", limit: 10
    t.string "train_name"
    t.index ["station_code"], name: "idx_train_route_points_with_networks_station_code"
    t.index ["station_name"], name: "station_name"
    t.index ["train_number"], name: "idx_train_route_points_with_networks_train_number"
  end

  create_table "train_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "train_number", collation: "latin1_swedish_ci"
    t.string "train_name", collation: "latin1_swedish_ci"
    t.string "train_type", collation: "latin1_swedish_ci"
    t.string "train_src", collation: "latin1_swedish_ci"
    t.integer "dep_mins_src"
    t.string "train_dstn", collation: "latin1_swedish_ci"
    t.integer "arr_mins_dstn"
    t.string "run_days", collation: "latin1_swedish_ci"
    t.date "valid_from"
    t.date "valid_to"
    t.string "brake_type", collation: "latin1_swedish_ci"
    t.string "train_sub_type", collation: "latin1_swedish_ci"
    t.string "owning_rly", collation: "latin1_swedish_ci"
    t.string "train_gauge", collation: "latin1_swedish_ci"
    t.integer "ir_route_number"
    t.string "up_dn_flag", collation: "latin1_swedish_ci"
    t.string "source", collation: "latin1_swedish_ci"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "ntes_valid_to"
    t.integer "slip_type", default: 0, null: false
    t.integer "fog_incidence_probability", default: 0
    t.string "train_characteristics"
    t.string "local_train_city"
    t.string "comment_one"
    t.string "comment_two"
    t.boolean "is_local", default: false
    t.string "train_type_new"
    t.string "train_name_ir"
    t.string "train_name_seo"
    t.string "created_by"
    t.index ["local_train_city"], name: "idx_local_train_city_train_routes"
    t.index ["run_days"], name: "run_days"
    t.index ["train_number", "valid_from", "valid_to"], name: "idx_tno_vto_vfrom"
    t.index ["train_number"], name: "train_number"
    t.index ["valid_from", "valid_to"], name: "valid_from_to"
    t.index ["valid_to"], name: "idx_train_routes_valid_to"
  end

  create_table "train_run_summary_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.date "start_date"
    t.boolean "is_valid", default: true
    t.string "comment"
    t.string "mongo_id"
    t.integer "data_size", default: 1
    t.integer "invalid_code", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_runs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "stn_code"
    t.string "stn_name"
    t.date "run_date"
    t.datetime "scheduled_arrival"
    t.datetime "scheduled_departure"
    t.datetime "expected_arrival"
    t.datetime "expected_departure"
    t.datetime "last_updated_at"
    t.boolean "eta"
    t.boolean "etd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["train_number", "run_date", "stn_code"], name: "index_train_runs_on_train_number_and_run_date_and_stn_code"
  end

  create_table "train_scheduled_stoppages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.integer "si_no"
    t.string "stn_code"
    t.string "stn_name"
    t.integer "route_no"
    t.string "arrival_time"
    t.string "departure_time"
    t.string "halt_in_mins"
    t.integer "distance"
    t.integer "day"
    t.string "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "train_schedule_id"
    t.integer "distance_from_prev_stn"
    t.integer "distance_from_prev_stp"
    t.integer "stn_provider_id"
    t.string "provider"
    t.integer "mins_from_prev_stn"
    t.integer "mins_from_prev_stp"
    t.integer "avg_speed_kmph"
    t.integer "iri_speed_kmph"
    t.index ["train_number", "stn_code", "route_no"], name: "tss_tn_sc_rn", unique: true
    t.index ["train_schedule_id"], name: "index_train_scheduled_stoppages_on_train_schedule_id"
  end

  create_table "train_schedules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "train_number"
    t.string "train_name"
    t.string "source_stn"
    t.string "runs_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "provider"
    t.string "provider_id"
    t.string "destination_stn"
    t.string "coach_composition"
    t.string "source_stn_code"
    t.string "destination_stn_code"
    t.string "train_type"
    t.integer "avg_moving_speed_kmph"
    t.string "food_catering"
    t.integer "total_duration_mins"
    t.integer "total_distance_kms"
    t.integer "climbs_meter"
    t.integer "descends_meter"
    t.integer "total_halts"
    t.integer "total_intermediate_stations"
    t.string "departure_platform"
    t.string "arrival_platform"
    t.index ["train_number"], name: "index_train_schedules_on_train_number", unique: true
  end

  create_table "train_tatkal_seats", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_number"
    t.string "coach_class", limit: 250
    t.integer "no_of_coaches"
    t.integer "no_of_tatkaal_seats"
    t.integer "total_seats"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "train_ticket_agent_agreements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email"
    t.string "name"
    t.string "title"
    t.float "amount", limit: 24
    t.string "place"
    t.boolean "is_approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agent_signature_file_name"
    t.string "agent_signature_content_type"
    t.integer "agent_signature_file_size"
    t.datetime "agent_signature_updated_at"
    t.string "approved_by", limit: 45
    t.date "start_date"
  end

  create_table "train_ticket_agent_charges", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_ticket_agent_id"
    t.string "journey_class"
    t.float "amount", limit: 24
    t.float "tatkal_amount", limit: 24
    t.boolean "amount_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "current_amount", limit: 24
    t.float "premium_tatkal_amount", limit: 24
  end

  create_table "train_ticket_agent_day_end_finances", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "agent_id"
    t.float "total_credit", limit: 24
    t.float "total_debit", limit: 24
    t.float "net_amount", limit: 24
    t.string "comment"
    t.datetime "created_at", null: false
    t.string "updated_at", limit: 45, null: false
  end

  create_table "train_ticket_agent_metrics", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_ticket_agents_id"
    t.date "booking_date"
    t.time "logged_in_time"
    t.integer "missed_call"
    t.integer "received_call"
    t.integer "number_of_booking"
    t.decimal "earned_amount", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_ticket_agent_transaction_summaries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "agent_id"
    t.float "net_amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_ticket_agent_transaction_temps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "agent_id"
    t.integer "booking_id"
    t.string "txn_type"
    t.decimal "amount", precision: 10, scale: 2
    t.string "comment"
    t.datetime "created_at", null: false
    t.string "updated_at", limit: 45, null: false
    t.integer "arrangement_type", default: 0, null: false
    t.boolean "status"
  end

  create_table "train_ticket_agent_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "agent_id"
    t.integer "booking_id"
    t.string "txn_type"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "net_amount", precision: 10, scale: 2
    t.string "comment"
    t.datetime "created_at", null: false
    t.string "updated_at", limit: 45, null: false
    t.integer "arrangement_type", default: 0, null: false
  end

  create_table "train_ticket_agents", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "email"
    t.text "address"
    t.string "ph_no"
    t.string "company_name"
    t.string "irctc_id"
    t.boolean "is_recomm"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_hash"
    t.string "password_salt"
    t.text "profile_image_url"
    t.string "ph_no_sec"
    t.boolean "train_agent", default: true
    t.text "stations"
    t.datetime "start_disable_time"
    t.datetime "end_disable_time"
    t.datetime "start_working_time"
    t.datetime "end_working_time"
    t.integer "is_active", default: 0
    t.integer "lead_time"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "agent_type"
    t.boolean "can_take_call"
    t.string "agent_role"
    t.integer "is_blocked", default: 0, null: false
    t.text "assigned_call_sid"
    t.integer "cab_partner_id"
    t.boolean "cab_agent"
    t.string "alias_name"
    t.integer "neft_bene_account"
    t.string "neft_bene_name", limit: 45
    t.string "neft_ifsc", limit: 45
    t.string "neft_payment_indicator", limit: 45
    t.boolean "ticket_only"
    t.datetime "assignment_time"
    t.decimal "blocked_amt", precision: 10, scale: 2
    t.text "extension_id"
    t.string "state", limit: 45
    t.boolean "tcs", default: false, null: false
    t.index ["assignment_time"], name: "assignment_time_UNIQUE", unique: true
  end

  create_table "train_ticket_booking_charges", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "booking_id"
    t.decimal "ry_agent_charge", precision: 10, scale: 2
    t.decimal "ry_commission", precision: 10, scale: 2
    t.decimal "commission", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "booking_id_index"
  end

  create_table "train_ticket_booking_commissions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "booking_id"
    t.integer "offer_type"
    t.decimal "ry_commission", precision: 10, scale: 2
    t.decimal "third_party_commission", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id", "offer_type"], name: "booking_id_index"
  end

  create_table "train_ticket_booking_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "booking_id"
    t.text "ers_url"
    t.text "crs_url"
    t.text "signature_url"
    t.text "user_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "can_signature_url"
    t.string "irctc_txn_id", limit: 45
    t.string "quota"
    t.integer "btb_user_id", unsigned: true
    t.integer "ack_agent_id", default: 0
    t.integer "pnr_agent_id", default: 0
    t.integer "package_query", default: 0, comment: "0=pending;1=interested;2=notinterested;3=followup"
    t.text "package_query_comment"
    t.integer "combo_order_id"
    t.datetime "journey_datetime"
    t.text "agent_amount"
    t.boolean "show_ra", default: false, comment: "to identify from where we are fetching fare(agents or api)"
    t.float "cp_per", limit: 24
    t.text "offer"
    t.string "fare_src", limit: 45
    t.string "btb_reference_no"
    t.string "country_code", limit: 45, default: "+91"
    t.datetime "user_cancel_time"
    t.index ["booking_id"], name: "booking_id"
  end

  create_table "train_ticket_booking_requests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "booking_id"
    t.string "boarding_point"
    t.integer "req_status", default: 0
    t.text "comment"
    t.integer "req_type", default: 0
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_ticket_booking_services", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "from_datetime", null: false
    t.datetime "to_datetime", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_ticket_bookings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "train_number"
    t.string "from_sta"
    t.string "to_sta"
    t.date "date_of_journey"
    t.string "booking_class"
    t.integer "no_of_passenger"
    t.float "total_amt", limit: 24
    t.string "boarding_point"
    t.boolean "auto_upgrade"
    t.string "reservation_choice"
    t.string "pnr_number"
    t.integer "agent_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_status"
    t.integer "user_token"
    t.integer "cancel"
    t.integer "cancel_status"
    t.datetime "cancel_time"
    t.float "refund_amt", limit: 24
    t.text "tdr_reason"
    t.boolean "pnr_verified"
    t.string "reason"
    t.boolean "was_partial_payment"
    t.float "agent_charge", limit: 24
    t.float "pg_charge", limit: 24
    t.float "ry_fee", limit: 24
    t.float "cancellation_charges", limit: 24
    t.float "total_amount_for_partial", limit: 24
    t.float "partial_amount", limit: 24
    t.float "due_amount", limit: 24
    t.datetime "due_datetime"
    t.boolean "auto_cancellation"
    t.integer "cancellation_token"
    t.string "call_sid", limit: 45
    t.datetime "train_start_datetime"
    t.float "user_refund_amt", limit: 24
    t.integer "refund_transaction_id"
    t.string "refund_payment_transaction_id"
    t.boolean "is_refunded"
    t.text "remarks"
    t.text "internal_remarks"
    t.integer "operator_id", default: 0
    t.string "cancellation_reason"
    t.boolean "has_return_trip", default: false
    t.integer "booking_id"
    t.integer "agent_activity_status", default: 0
    t.boolean "is_tatkal_ticket", default: false
    t.text "ticket_details"
    t.boolean "is_current_booking"
    t.integer "coupon_id"
    t.decimal "discount_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "cashback_amount", precision: 10, scale: 2, default: "0.0"
    t.integer "cashback_paid", limit: 1, default: 0
    t.float "marketplace_fee", limit: 24
    t.float "ticket_amount_per_pass", limit: 24
    t.float "ticket_amount", limit: 24
    t.integer "ecomm_source_id", default: 1
    t.integer "req_callback", default: 0
    t.decimal "user_total_refunded_amt", precision: 10, scale: 2, default: "0.0"
    t.boolean "sent_email", default: false
    t.string "tdr_ack_number"
    t.string "user_email"
    t.string "user_mobile"
    t.integer "no_call_booking_status", default: 0
    t.integer "refund_type", default: 0
    t.float "ry_pg_charge", limit: 24, default: 0.0
    t.integer "btb_organisation_id", unsigned: true
    t.float "agent_pg_charge", limit: 24, default: 0.0
    t.text "combo_data"
    t.index ["pnr_number"], name: "idx_pnr_number"
    t.index ["user_id", "payment_status"], name: "user_id_payment"
  end

  create_table "train_ticket_cancellation_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "cancellation_type"
    t.string "event_name", limit: 45
    t.string "event_title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notification_title"
    t.string "notification_content"
    t.string "sms_content"
  end

  create_table "train_ticket_cancellation_histories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_ticket_booking_id"
    t.integer "train_ticket_cancellation_event_id"
    t.string "title"
    t.text "message"
    t.text "voice_message"
    t.boolean "show_user", default: true
    t.integer "updated_by", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "train_ticket_cancellation_policy_rules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "booking_class"
    t.string "quota", limit: 45
    t.integer "max_days"
    t.float "commission", limit: 24
    t.float "commission_gst", limit: 24
    t.float "ry_commission", limit: 24
    t.float "ry_commission_gst", limit: 24
    t.string "cp_probability", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_ticket_daily_settlement_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "agent_id"
    t.string "email_id"
    t.string "bene_name"
    t.string "bene_account_no"
    t.string "ifsc_code"
    t.string "payment_indicator"
    t.string "payment_date"
    t.string "customer_account"
    t.string "notes"
    t.float "booking_amount", limit: 24
    t.float "refund_amount", limit: 24
    t.float "amount", limit: 24
    t.float "pending_amount", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_ticket_failed_bookings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "booking_id"
    t.string "tx_id"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_ticket_oauth_users", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "uid"
    t.string "provider", limit: 50
    t.string "provider_id"
    t.string "email", limit: 100
    t.string "name", limit: 100
    t.string "oauth_token", default: ""
    t.datetime "oauth_expires_at"
    t.integer "current_status", limit: 1, default: 0, comment: "0=logged_out,1=logged_in, 2=banned,3=admin"
    t.datetime "last_loggedin_at"
  end

  create_table "train_ticket_passengers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "age"
    t.integer "gender"
    t.integer "meal_prefer"
    t.string "berth_prefer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "train_ticket_bookings_id"
    t.boolean "child", unsigned: true
    t.integer "cancel", default: 0
    t.boolean "opt_berth", default: false
    t.string "nationality", limit: 45
    t.string "id_proof_number", limit: 45
    t.decimal "ry_commission", precision: 10, scale: 2
    t.decimal "commission", precision: 10, scale: 2
    t.decimal "fare", precision: 10, scale: 2
    t.datetime "cancel_time"
  end

  create_table "train_ticket_payments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "train_ticket_id"
    t.text "payment_link"
    t.integer "user_id"
    t.integer "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expires_in"
    t.float "issue_amount", limit: 24
    t.string "issue_type"
    t.string "issue_comment"
  end

  create_table "train_ticket_retry_emails", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "pnr_number"
    t.boolean "sent_email", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pnr_number"], name: "pnr_number"
  end

  create_table "train_ticket_service_charges", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "journey_class"
    t.float "amount", limit: 24
    t.float "tatkal_amount", limit: 24
    t.string "charge_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_ticket_support_enquiries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "from_number"
    t.string "digits"
    t.string "call_sid"
    t.integer "booking_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_sid"], name: "idx_train_ticket_support_enquiries_call_sid"
  end

  create_table "train_ticket_tdr_reasons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "reason"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "train_ticket_user_tokens", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "user_token"
    t.datetime "expiry_time"
    t.boolean "expired"
    t.integer "agent_id"
    t.string "boarding_from", limit: 45
    t.string "boarding_to", limit: 45
    t.date "boarding_date"
    t.string "train_no", limit: 45
    t.string "train_name"
    t.string "call_sid", limit: 45
    t.integer "call_duration"
    t.integer "ecomm_source_id", default: 1
    t.string "web_browser"
    t.string "browser_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "final_status", limit: 45
    t.string "probability", limit: 45
    t.string "src", limit: 45
    t.string "journey_class", limit: 45
    t.string "journey_quota", limit: 45
    t.index ["user_token"], name: "idx_train_ticket_user_token"
  end

  create_table "train_tickets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "offline_payment_id"
    t.string "name"
    t.string "email"
    t.string "mobile_no"
    t.string "pnr_number"
    t.boolean "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offline_payment_id"], name: "index_train_tickets_on_offline_payment_id"
  end

  create_table "train_wisdom_report_data", primary_key: "train_number", id: :string, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "stop_count"
    t.integer "transit_count"
    t.integer "total_count"
    t.integer "nzw_stop_count"
    t.integer "zw_stop_count"
    t.integer "nzw_transit_count"
    t.integer "zw_transit_count"
  end

  create_table "train_wisdoms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "wisdom_id"
    t.string "train_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "admin_train_number"
    t.string "from"
    t.string "to"
  end

  create_table "travefy_packages", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "tf_id"
    t.integer "verification_key"
    t.string "name"
    t.integer "parent_id"
    t.text "trip_user_summary_ids"
    t.float "estimatedCost", limit: 24
    t.boolean "isCostPerPerson", default: true
    t.text "imageUrl"
    t.text "thumbnailImageUrl"
    t.datetime "lastEventAt"
    t.datetime "lastActivityFeedEventId"
    t.boolean "hasUnseenEvents", default: false
    t.boolean "isArchived", default: false
    t.integer "isCanceled", limit: 1, default: 0
    t.integer "isItineraryLocked", limit: 1, default: 0
    t.integer "tripFeatures", limit: 1, default: 0
    t.integer "openInviteCode", limit: 1, default: 0
    t.date "dateStart"
    t.date "dateEnd"
    t.integer "currentTripUserIsCollaborator", limit: 1, default: 0
    t.integer "currentTripUserIsTravelAdvisor", limit: 1, default: 0
    t.integer "hostId"
    t.integer "hasAgentWithMobileApps", limit: 1, default: 1
    t.string "affiliateId", limit: 100
    t.string "agentDisplayProfileId", limit: 100
    t.string "tripProStatusId", limit: 100
    t.text "itineraryKey"
    t.string "dateDisplay"
    t.integer "default", default: 0, null: false
    t.float "starting_price", limit: 24
    t.string "starting_place"
    t.string "user_origin"
    t.string "package_duration"
    t.text "inclusions"
    t.integer "male"
    t.integer "female"
    t.integer "children"
    t.integer "user_id"
    t.integer "query_id"
    t.float "package_saving", limit: 24
    t.string "details_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "pkg_position"
    t.integer "show_on_app", default: 1
    t.text "overview"
    t.integer "status", default: 1
    t.text "ry_imageUrl"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "travel_advertisments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pricing"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treebo_rooms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "hotel_id", limit: 100
    t.string "ry_hotel_id", limit: 10, default: ""
    t.string "room_id"
    t.string "cancellation_policy"
    t.text "partner_data"
    t.float "base_price", limit: 24
    t.float "final_price_at_booking", limit: 24
    t.float "final_price_at_checkout", limit: 24
    t.float "tax", limit: 24
    t.text "party"
    t.text "api_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ry_hotel_id"], name: "ry_hotel_id"
  end

  create_table "txn_members", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "role", default: "user"
    t.integer "ecomm_type"
    t.boolean "is_valid", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_txn_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_txn_members_on_reset_password_token", unique: true
  end

  create_table "ty_bus_route_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ty_city_id"
    t.text "ty_city_name"
    t.text "state"
    t.integer "status"
    t.text "created_at"
    t.text "updated_at"
    t.index ["ty_city_id"], name: "idx_ty_bus_route_cities_ty_city_id"
  end

  create_table "ty_bus_trips", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "ry_trip_id", limit: 50
    t.string "ty_trip_id", limit: 50
    t.integer "source_city_id", null: false
    t.string "source_city_name"
    t.integer "destination_city_id", null: false
    t.string "destination_city_name"
    t.date "journey_date"
    t.integer "bus_id"
    t.integer "company_id"
    t.integer "ty_provider_id"
    t.integer "ty_provider_com_id"
    t.string "bus_lable"
    t.string "duration", limit: 50
    t.string "chart_code"
    t.integer "visibility", default: 1
    t.string "display_name", limit: 100
    t.float "total_tax", limit: 24
    t.text "bus_fare"
    t.integer "seats_available"
    t.text "amenities"
    t.text "cancellation_policy"
    t.text "dropoffs"
    t.text "pickups"
    t.string "seating_type", limit: 20
    t.integer "is_refundable"
    t.integer "is_ac"
    t.integer "mticket"
    t.text "bus_response"
    t.datetime "departure_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "arrival_time"
    t.integer "from_city_id", default: 0
    t.integer "to_city_id", default: 0
    t.index ["ry_trip_id"], name: "ty_bus_trips_ryid_index"
  end

  create_table "ty_operators", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ty_operator_id"
    t.string "operator_name", limit: 100
    t.float "convenience_charge", limit: 24, default: 4.0, null: false
    t.integer "convenience_type", limit: 1, default: 1
    t.float "max_charge", limit: 24, default: 40.0
    t.integer "status", limit: 1, default: 1, comment: "1=active; 0=inactive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "last_seat_discount_percent", limit: 24
    t.float "max_last_seat_disc", limit: 24
    t.index ["ty_operator_id"], name: "idx_ty_operators_ty_operator_id"
  end

  create_table "ty_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "from_city_id"
    t.string "from_city_name"
    t.string "from_state_name"
    t.integer "to_city_id"
    t.string "to_city_name"
    t.string "to_state_name"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uc_user_tracks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "app_ver_id"
    t.datetime "notification_sent_time"
    t.text "message"
    t.string "day", limit: 10
    t.integer "cur_app_ver_id"
    t.boolean "is_uninstall", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unsatisfied_user_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.integer "ecomm_type"
    t.datetime "order_date"
    t.datetime "delivery_date"
    t.integer "order_status"
    t.integer "user_satisfactions_id"
    t.integer "satisfaction"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_activities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.text "url"
    t.integer "processed", limit: 1, default: 0
    t.string "from", limit: 100
    t.string "to", limit: 100
    t.integer "reference_id", default: 0
    t.string "pnr_number"
    t.integer "pnr_number_id"
    t.date "train_boarding_date"
    t.date "train_start_date"
    t.date "train_end_date"
    t.datetime "journey_end_time"
    t.date "journey_end_date"
    t.integer "point_status", default: 0
    t.integer "point_msg", default: 0, comment: "0 Default, 1 point added, 2 can not add for some reason, say cancellation of ticket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_points", default: 0
    t.integer "user_activity_type_id"
    t.string "comment"
    t.string "notification_msg"
    t.boolean "is_processed", default: false
    t.index ["user_id"], name: "idx_user_activities_user_id"
  end

  create_table "user_activity_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "idx_user_activity_logs_user_id"
  end

  create_table "user_activity_rules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "user_activity_type_id"
    t.integer "counter"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_activity_summaries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.date "date_accessed"
    t.string "app_version", limit: 11
    t.date "user_created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.integer "access_count", default: 0
    t.index ["date_accessed"], name: "idx_user_activity_summaries_date_accessed"
    t.index ["user_id"], name: "idx_user_activity_summaries_user_id"
  end

  create_table "user_activity_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "activity_name"
    t.integer "points", default: 0
    t.string "activity_message"
    t.string "activity_completed_message"
    t.integer "number_of_points", default: 1
    t.integer "points_multiplier", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ecom_type", default: "Point"
  end

  create_table "user_additional_offers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "offer_id"
    t.string "offer_name"
    t.decimal "offer_amount", precision: 10, scale: 2
    t.integer "order_id"
    t.integer "ecomm_type"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_browser_keys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "registration_id"
    t.text "p256dh"
    t.string "device_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "auth_key"
    t.text "browser_url"
    t.text "pnr_number"
    t.string "phone_number", limit: 45
    t.boolean "is_verify", default: false
    t.integer "otp"
    t.index ["user_id"], name: "index_user_browser_keys_on_user_id"
  end

  create_table "user_bus_journeys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "pnr_sms_text_id"
    t.string "travel_name"
    t.string "tin"
    t.string "pnr"
    t.date "doj"
    t.time "dep_time"
    t.string "from_city"
    t.string "to_city"
    t.string "boarding_point"
    t.string "landmark"
    t.string "address"
    t.string "seat_no"
    t.string "operator_contact_no"
    t.string "sender_name"
    t.integer "v_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fare"
    t.integer "number_of_passengers"
    t.integer "provider_id"
    t.integer "ry_operator_id"
    t.string "ry_travels"
  end

  create_table "user_bus_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "redbus_from_city_id"
    t.integer "redbus_to_city_id"
    t.boolean "user_routes"
    t.boolean "ac"
    t.boolean "sleeper"
    t.integer "bus_time"
    t.integer "train_time"
    t.string "bus_type"
    t.string "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "user_bus_trip_location_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action", limit: 45
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 10, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2"
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
  end

  create_table "user_campaign_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_campaign_id"
    t.integer "user_id_referrer"
    t.integer "user_id_referred"
    t.string "referrer_code"
    t.string "referred_to_code"
    t.string "wallet_amount"
    t.boolean "transfer_complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "order_number"
    t.text "message"
    t.string "mobile_number"
    t.index ["referrer_code"], name: "referrer_code"
    t.index ["transfer_complete"], name: "idx_user_campaign_details_transfer_complete"
    t.index ["user_id_referrer"], name: "idx_user_campaign_details_user_id_referrer"
  end

  create_table "user_campaigns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.boolean "stop_campaign"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_budget"
    t.integer "individual_budget"
    t.text "terms_and_conditions"
    t.integer "referrel_amount"
  end

  create_table "user_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "city_id"
    t.string "city_name"
    t.integer "state_id"
    t.string "state_name"
    t.boolean "is_top", default: false
    t.integer "user_city_count"
    t.integer "input_type", default: 0
    t.integer "is_deleted", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "city_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "user_city_processes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_location_logs_id"
    t.integer "user_favorite_routes_id"
    t.integer "user_configured_journeys_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_configured_journeys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "pnr_number", collation: "utf8_unicode_ci"
    t.string "train_number"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.date "train_boarding_date"
    t.date "train_start_date"
    t.date "train_end_date"
    t.string "mobile_number", collation: "utf8_unicode_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message_counter", collation: "utf8_unicode_ci"
    t.datetime "scheduled_boarding_time"
    t.datetime "alert_start_time"
    t.string "to_station_code"
    t.string "reserved_upto"
    t.string "total_distance"
    t.string "total_time"
    t.integer "pnr_number_id"
    t.boolean "is_deleted", default: false
    t.string "slip_train_number"
    t.string "slip_from_station_code"
    t.boolean "is_web", default: false
    t.string "reserved_from"
    t.integer "booking_id"
    t.index ["booking_id"], name: "booking_id"
    t.index ["pnr_number"], name: "idx_user_configured_journeys_pnr_number"
    t.index ["train_boarding_date"], name: "idx_user_configured_journeys_train_boarding_date"
    t.index ["train_end_date"], name: "idx_user_configured_journeys_train_end_date"
    t.index ["train_start_date"], name: "idx_user_configured_journeys_train_start_date"
    t.index ["user_id"], name: "idx_user_configured_journeys_user_id"
  end

  create_table "user_contacts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id", "contact_id"], name: "index_user_contacts_on_user_id_and_contact_id", unique: true
  end

  create_table "user_device_versions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "make_and_model"
    t.string "android_app_id"
    t.string "imei_1"
    t.string "imei_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "android_app_release_id"
    t.integer "device_id"
    t.index ["user_id"], name: "idx_user_device_versions_user_id"
  end

  create_table "user_ecomm_in_journeys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_configured_journey_id"
    t.boolean "is_ecomm_available"
    t.integer "ecomm_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_ecomm_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "ecomm_type"
    t.datetime "completion_time"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_facebook_friends", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "friends_uid", collation: "utf8_unicode_ci"
    t.string "user_uid", collation: "utf8_unicode_ci"
    t.integer "user_ryid"
    t.string "hometown"
    t.string "location"
    t.datetime "created_at"
  end

  create_table "user_favorite_packages", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "package_id"
    t.datetime "created_at"
    t.datetime "udpated_at"
  end

  create_table "user_favorite_routes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "from_station_code", collation: "utf8_unicode_ci"
    t.string "to_station_code", collation: "utf8_unicode_ci"
    t.integer "is_local", default: 0
    t.string "tag", limit: 45
    t.string "local_city", limit: 45
    t.datetime "created_at"
    t.string "updated_at", limit: 45
    t.boolean "is_metro", default: false
  end

  create_table "user_favorite_stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "uid", collation: "utf8_unicode_ci"
    t.string "station_code", collation: "utf8_unicode_ci"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_favorite_timetables", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "train_number"
    t.datetime "update_time"
    t.boolean "is_deleted", default: false
    t.integer "notification_counter", default: 0
    t.datetime "last_notification_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number"], name: "index_user_favorite_timetables_on_train_number"
    t.index ["user_id"], name: "index_user_favorite_timetables_on_user_id"
  end

  create_table "user_favorite_trains", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "uid", collation: "utf8_unicode_ci"
    t.string "train_number", collation: "utf8_unicode_ci"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "idx_user_favorite_trains_user_id"
  end

  create_table "user_flight_journeys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "pnr_sms_text_id"
    t.string "operator_name", limit: 256
    t.string "pnr", limit: 45
    t.date "doj"
    t.time "dep_time"
    t.string "from_city", limit: 45
    t.string "to_city", limit: 45
    t.string "flight_number", limit: 45
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_food_reviews", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "user_name"
    t.string "station_code"
    t.string "station_name"
    t.integer "rest_id"
    t.string "rest_name"
    t.text "review_text"
    t.float "user_rating", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_friends_station_counts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "friends_uid"
    t.string "user_uid"
    t.integer "user_ryid"
    t.string "station_name"
    t.string "station_code", limit: 16
    t.integer "station_count"
  end

  create_table "user_groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.integer "user_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "user_install_sources", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_campaign"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "request_ip"
    t.string "ad_id"
    t.boolean "is_valid_post_back", default: false
    t.index ["user_id"], name: "index_user_install_sources_on_user_id"
  end

  create_table "user_ip_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_ip"
    t.string "request_url"
    t.string "web_type", default: "new"
    t.string "status", default: ""
    t.string "browser_detail"
    t.string "browser_name"
    t.text "browser_id"
    t.boolean "is_mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "idx_user_ip_details_created_at"
    t.index ["user_ip"], name: "idx_user_ip_details_user_ip"
  end

  create_table "user_journey_share_counts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_journey_share_id"
    t.string "track_by"
    t.string "app_id"
    t.integer "user_id"
    t.string "train_number"
    t.date "train_start_date"
    t.datetime "journey_start_date"
    t.string "journey_start_station"
    t.string "journey_end_station"
    t.string "seat_number"
    t.integer "time_delay"
    t.string "current_station"
    t.string "eta"
    t.integer "p_day"
    t.integer "distance_left"
    t.string "pnr_number"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trip_user_id"
    t.integer "viewer_user_id"
  end

  create_table "user_journey_shares", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "journey_token"
    t.integer "user_configured_journey_id"
    t.string "tiny_url", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_kyc_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "aadhaar_no", limit: 12
    t.string "phone_no"
    t.integer "user_id"
    t.integer "device_type_id"
    t.boolean "is_verified", default: false
    t.integer "otp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_lang_preferences", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "railyatri_user_id"
    t.string "user_lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "src"
    t.index ["railyatri_user_id"], name: "railyatri_user_id"
  end

  create_table "user_location_log_zeros", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number", limit: 20
    t.string "network_operator", limit: 45
    t.string "android_app_release_id", limit: 15
    t.string "action", limit: 45
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 10, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2"
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
  end

  create_table "user_location_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action"
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 12, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2", limit: 16777215
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
    t.bigint "location_cell_id"
    t.boolean "cellid_on_track"
    t.string "provider"
    t.string "speed"
    t.string "bearing"
    t.string "altitude"
    t.string "elapsedRealtimeNanos"
    t.integer "isAccurate", limit: 1
    t.string "gsm_signal_strength"
    t.string "gps_signal_strength"
    t.string "total_satellites"
    t.string "column_5"
    t.string "column_6"
    t.string "column_7"
    t.string "battery_percentage"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.string "train_search"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_location_logs_01042018", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action"
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 12, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2", limit: 16777215
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
    t.bigint "location_cell_id"
    t.boolean "cellid_on_track"
    t.string "provider"
    t.string "speed"
    t.string "bearing"
    t.string "altitude"
    t.string "elapsedRealtimeNanos"
    t.integer "isAccurate", limit: 1
    t.string "gsm_signal_strength"
    t.string "gps_signal_strength"
    t.string "total_satellites"
    t.string "column_5"
    t.string "column_6"
    t.string "column_7"
    t.string "battery_percentage"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.string "train_search"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_location_logs_06052018", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action"
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 12, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2", limit: 16777215
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
    t.bigint "location_cell_id"
    t.boolean "cellid_on_track"
    t.string "provider"
    t.string "speed"
    t.string "bearing"
    t.string "altitude"
    t.string "elapsedRealtimeNanos"
    t.integer "isAccurate", limit: 1
    t.string "gsm_signal_strength"
    t.string "gps_signal_strength"
    t.string "total_satellites"
    t.string "column_5"
    t.string "column_6"
    t.string "column_7"
    t.string "battery_percentage"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.string "train_search"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_location_logs_08042018", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action"
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 12, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2", limit: 16777215
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
    t.bigint "location_cell_id"
    t.boolean "cellid_on_track"
    t.string "provider"
    t.string "speed"
    t.string "bearing"
    t.string "altitude"
    t.string "elapsedRealtimeNanos"
    t.integer "isAccurate", limit: 1
    t.string "gsm_signal_strength"
    t.string "gps_signal_strength"
    t.string "total_satellites"
    t.string "column_5"
    t.string "column_6"
    t.string "column_7"
    t.string "battery_percentage"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.string "train_search"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_location_logs_15042018", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action"
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 12, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2", limit: 16777215
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
    t.bigint "location_cell_id"
    t.boolean "cellid_on_track"
    t.string "provider"
    t.string "speed"
    t.string "bearing"
    t.string "altitude"
    t.string "elapsedRealtimeNanos"
    t.integer "isAccurate", limit: 1
    t.string "gsm_signal_strength"
    t.string "gps_signal_strength"
    t.string "total_satellites"
    t.string "column_5"
    t.string "column_6"
    t.string "column_7"
    t.string "battery_percentage"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.string "train_search"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_location_logs_20052018", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action"
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 12, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2", limit: 16777215
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
    t.bigint "location_cell_id"
    t.boolean "cellid_on_track"
    t.string "provider"
    t.string "speed"
    t.string "bearing"
    t.string "altitude"
    t.string "elapsedRealtimeNanos"
    t.integer "isAccurate", limit: 1
    t.string "gsm_signal_strength"
    t.string "gps_signal_strength"
    t.string "total_satellites"
    t.string "column_5"
    t.string "column_6"
    t.string "column_7"
    t.string "battery_percentage"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.string "train_search"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_location_logs_22042018", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action"
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 12, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2", limit: 16777215
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
    t.bigint "location_cell_id"
    t.boolean "cellid_on_track"
    t.string "provider"
    t.string "speed"
    t.string "bearing"
    t.string "altitude"
    t.string "elapsedRealtimeNanos"
    t.integer "isAccurate", limit: 1
    t.string "gsm_signal_strength"
    t.string "gps_signal_strength"
    t.string "total_satellites"
    t.string "column_5"
    t.string "column_6"
    t.string "column_7"
    t.string "battery_percentage"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.string "train_search"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_location_logs_29042018", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action"
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 12, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2", limit: 16777215
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
    t.bigint "location_cell_id"
    t.boolean "cellid_on_track"
    t.string "provider"
    t.string "speed"
    t.string "bearing"
    t.string "altitude"
    t.string "elapsedRealtimeNanos"
    t.integer "isAccurate", limit: 1
    t.string "gsm_signal_strength"
    t.string "gps_signal_strength"
    t.string "total_satellites"
    t.string "column_5"
    t.string "column_6"
    t.string "column_7"
    t.string "battery_percentage"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.string "train_search"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_location_logs_back", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action", limit: 45
    t.string "nearest_station1", limit: 10
    t.string "nearest_station2", limit: 10
    t.boolean "on_track"
    t.decimal "distance_to_nearest_station1", precision: 10, scale: 5
    t.decimal "distance_to_nearest_station2", precision: 10, scale: 5
    t.decimal "distance_to_track", precision: 10, scale: 5
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 10, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "column_1", limit: 100
    t.text "column_2"
    t.string "column_3", limit: 45
    t.integer "column_4"
    t.integer "lac"
    t.integer "mcc"
    t.integer "mnc"
    t.integer "cell_id"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.string "train_search"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_location_logs_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.integer "city_id"
    t.string "city_name"
    t.string "google_city_name", limit: 50
    t.string "station_code", limit: 10
    t.integer "state_id"
    t.string "state_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "lat_lng_date"
    t.index ["google_city_name"], name: "idx_user_location_logs_cities_google_city_name"
    t.index ["user_id"], name: "idx_user_location_logs_cities_user_id"
  end

  create_table "user_location_logs_cities_27082018", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.integer "city_id"
    t.string "city_name"
    t.string "google_city_name", limit: 50
    t.string "station_code", limit: 10
    t.integer "state_id"
    t.string "state_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "lat_lng_date"
    t.integer "count"
    t.index ["google_city_name"], name: "idx_user_location_logs_cities_google_city_name"
    t.index ["user_id"], name: "idx_user_location_logs_cities_user_id"
  end

  create_table "user_mob_9to15Ks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "mobile_device_name", limit: 250
    t.integer "price"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["user_id"], name: "idx_userid"
  end

  create_table "user_neft_csv_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "refund_transaction_id"
    t.integer "user_neft_detail_id"
    t.string "payment_indicator"
    t.string "bene_name"
    t.string "company_account"
    t.string "bene_account_no"
    t.string "ifsc_code"
    t.date "payment_date"
    t.decimal "amount", precision: 10
    t.string "email_id"
    t.string "ifsc_validation"
    t.string "status"
    t.text "error_stop_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "notes"
    t.date "liquidation_date"
    t.index ["refund_transaction_id"], name: "index_user_neft_csv_details_on_refund_transaction_id"
    t.index ["user_neft_detail_id"], name: "index_user_neft_csv_details_on_user_neft_detail_id"
  end

  create_table "user_neft_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "acc_holder_name"
    t.string "acc_number"
    t.string "ifsc_code"
    t.integer "ecomm_type"
    t.string "order_id", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "refund_calculation", default: false
    t.decimal "refund_amount", precision: 10
    t.string "neft_status", default: "pending"
    t.text "neft_remark"
    t.string "request_state", default: "accepted"
    t.decimal "wallet_debit", precision: 10
    t.decimal "wallet_credit", precision: 10
    t.integer "refund_transaction_id"
    t.string "email"
    t.decimal "neft_charges", precision: 10
    t.boolean "neft_to_standard", default: false
    t.index ["ecomm_type", "order_id"], name: "index_user_neft_details_on_ecomm_type_and_order_id"
    t.index ["user_id"], name: "index_user_neft_details_on_user_id"
  end

  create_table "user_otps", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "otp"
    t.string "status"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_otps_on_user_id"
  end

  create_table "user_passengers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "age"
    t.string "gender", limit: 11
    t.boolean "status", default: true, null: false
    t.integer "total_count", default: 1, null: false
    t.integer "train_max_booking_id"
    t.integer "bus_max_booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_payment_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "rzr_customer_id"
    t.boolean "stored_card_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_point_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "points"
    t.string "transaction_type"
    t.boolean "is_private", default: true
    t.datetime "expiration_date"
    t.boolean "is_expired", default: false
    t.integer "transaction_id"
    t.boolean "is_paid_by_wallet", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_activity_id"
    t.integer "user_activity_type_id"
    t.datetime "notification_sent_at"
    t.boolean "notification_status", default: true
    t.index ["id"], name: "idx_id", unique: true
    t.index ["user_id"], name: "idx_user_point_details_user_id"
  end

  create_table "user_point_notifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "push_message"
    t.string "extra_key"
    t.string "push_email"
    t.string "activity_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_points", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.integer "total_points", null: false
    t.integer "number_of_times", default: 0
    t.date "valid_upto_date"
    t.boolean "can_redeem", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["total_points"], name: "total_points"
    t.index ["user_id"], name: "idx_user_points_user_id", unique: true
  end

  create_table "user_preference_numbers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "mobile_number", collation: "utf8_unicode_ci"
    t.integer "is_primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_raw_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.datetime "location_update_time"
    t.string "train_number"
    t.string "network_operator"
    t.string "android_app_release_id", limit: 15
    t.string "action", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_number"], name: "index_user_raw_locations_on_train_number"
    t.index ["user_id"], name: "index_user_raw_locations_on_user_id"
  end

  create_table "user_satisfactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.integer "ecomm_type"
    t.text "issue"
    t.text "comments"
    t.integer "satisfaction", default: 5
    t.integer "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_station_counts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "user_uid"
    t.integer "user_ryid"
    t.string "station_name"
    t.string "station_code", limit: 16
    t.integer "station_count"
  end

  create_table "user_station_experts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "station_code"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_station_tags", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.string "station_code", limit: 50, null: false
    t.integer "location_count", default: 0, null: false
    t.index ["user_id"], name: "idx_user_station_tags_user_id"
  end

  create_table "user_stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "station_code"
    t.string "station_name"
    t.integer "from_count", default: 0
    t.integer "to_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "station_code"], name: "index_user_stations_on_user_id"
  end

  create_table "user_subscriptions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "uid", collation: "utf8_unicode_ci"
    t.integer "wisdom_type_id"
  end

  create_table "user_train_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.string "train_number"
    t.boolean "is_valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "location_src"
    t.text "message"
    t.date "train_start_date"
    t.string "current_station_code"
    t.index ["created_at"], name: "idx_user_train_locations_created_at"
    t.index ["train_number", "train_start_date"], name: "idx_train_number_start_date"
    t.index ["train_number"], name: "idx_train_location"
    t.index ["user_id"], name: "idx_user_train_location"
  end

  create_table "user_train_searches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "train_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_transaction_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "MSISDN", collation: "utf8_unicode_ci"
    t.string "transaction_id", collation: "utf8_unicode_ci"
    t.string "alert_code", collation: "utf8_unicode_ci"
    t.datetime "validity_from"
    t.datetime "validity_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["MSISDN"], name: "idx_msisdn"
    t.index ["validity_from"], name: "idx_validity_from"
    t.index ["validity_to"], name: "idx_validity_to"
  end

  create_table "user_vibrations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.decimal "lat", precision: 15, scale: 10, null: false
    t.decimal "lng", precision: 15, scale: 10, null: false
    t.string "nearby_station_code", limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "journey_id"
    t.string "train_number"
    t.string "action", limit: 45
    t.boolean "on_track"
    t.integer "cisr_id"
    t.decimal "accuracy", precision: 10, scale: 5
    t.boolean "location_access_enabled"
    t.boolean "gps_enabled"
    t.string "accelerometer"
    t.string "geomagnetic"
    t.string "orientation"
    t.index ["created_at"], name: "idx_user_location_logs_created_at"
    t.index ["user_id"], name: "idx_user_location_logs_user_id"
  end

  create_table "user_wallet_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.string "relationship_type"
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.string "transaction_type", null: false
    t.boolean "is_private", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expiration_date"
    t.boolean "is_expired", default: false
    t.integer "transaction_id"
    t.boolean "is_paid_by_wallet", default: false
    t.integer "relationship_id"
    t.integer "event_id"
    t.integer "event_type", default: 0, comment: "Basically for manging the kind of wallet credit"
    t.string "activity"
    t.integer "phone_number"
    t.string "added_by"
    t.boolean "fraud_detected"
    t.boolean "is_transferred", default: false
    t.string "comment"
    t.index ["expiration_date"], name: "index_user_wallet_details_on_expiration_date"
    t.index ["transaction_id"], name: "idx_transaction_id"
    t.index ["transaction_type", "event_type"], name: "index_user_wallet_details_on_transaction_type_and_event_type"
    t.index ["user_id", "expiration_date"], name: "index_user_wallet_details_on_user_id_and_expiration_date"
  end

  create_table "user_wallets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.decimal "total", precision: 10, scale: 2, null: false
    t.decimal "refund_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "cashback_amount", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "phone_number"
    t.index ["user_id"], name: "idx_user_wallets_user_id", unique: true
  end

  create_table "user_web_configured_journeys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "pnr_journey_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pnr_journey_detail_id"], name: "index_user_web_configured_journeys_on_pnr_journey_detail_id"
    t.index ["user_id"], name: "index_user_web_configured_journeys_on_user_id"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "password_salt"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "authentication_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "razr_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "utm_trackings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "provider"
    t.string "utm_source"
    t.integer "ecomm_type"
    t.integer "order_id"
    t.float "price", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_agreements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "res_id"
    t.string "vendor_name"
    t.string "vendor_email"
    t.string "gst_no", limit: 250
    t.boolean "is_approved", default: false
    t.string "approved_by"
    t.date "approved_date"
    t.string "ip_details"
    t.text "vendor_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vendor_signature_file_name"
    t.string "vendor_signature_content_type"
    t.integer "vendor_signature_file_size"
    t.datetime "vendor_signature_updated_at"
    t.string "entity_type", limit: 45
    t.string "pdf_path", limit: 225
  end

  create_table "vendor_app_releases", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "version_code"
    t.string "version_number", limit: 256
    t.string "description", limit: 256
    t.integer "store_number"
    t.datetime "release_date"
    t.integer "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendor_to_customers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "user_phone"
    t.string "unique_num"
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "vendor_email"
    t.integer "advertisment_category_id"
  end

  create_table "wallet_refund_requests", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "ecomm_type"
    t.integer "user_id"
    t.integer "user_wallet_detail_id"
    t.integer "ecomm_source_id"
    t.integer "refund_transaction_id"
    t.boolean "is_partial_cancellation"
    t.boolean "order_cancelled"
    t.decimal "wallet_money", precision: 10, scale: 2
    t.decimal "wallet_cashback", precision: 10, scale: 2
    t.decimal "cashback_debit", precision: 10, scale: 2
    t.boolean "wallet_refund_status"
    t.boolean "cashback_debit_status"
    t.boolean "final_status"
    t.string "remark", limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["order_id", "ecomm_type"], name: "index_wallet_refund_requests_on_order_id_and_ecomm_type"
    t.index ["user_wallet_detail_id"], name: "index_wallet_refund_requests_on_user_wallet_detail_id"
  end

  create_table "wallet_to_bank_refunds", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_id"
    t.integer "ecomm_type"
    t.integer "wallet_refund_request_id"
    t.decimal "refund_amount", precision: 10, scale: 2
    t.boolean "wallet_money_debit_status"
    t.string "refund_type"
    t.boolean "pg_status"
    t.integer "user_wallet_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["order_id", "ecomm_type"], name: "index_wallet_to_bank_refunds_on_order_id_and_ecomm_type"
    t.index ["wallet_refund_request_id"], name: "index_wallet_to_bank_refunds_on_wallet_refund_request_id"
  end

  create_table "waybill_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "waybill_id"
    t.integer "no_of_packages"
    t.boolean "hazardous"
    t.text "desciption"
    t.decimal "gross_weight", precision: 10
    t.string "purchase_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "waybills", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "carrier_name"
    t.text "shipper"
    t.text "consignee"
    t.integer "no_of_packages"
    t.integer "hazardous", limit: 1
    t.text "description"
    t.decimal "gross_weight", precision: 10
    t.string "purchase_order_no"
    t.text "vendor_signature_url"
    t.string "bill_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "consignee_id"
  end

  create_table "web_loc_accesses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "train_number"
    t.boolean "is_allow", default: true
    t.string "comment"
    t.string "request_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "web_pnr_infos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "pnr_number"
    t.integer "user_browser_key_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chart_status", limit: 1, default: 0
    t.string "seat_number", limit: 45
    t.string "status", limit: 45
    t.datetime "next_alarm_time"
  end

  create_table "web_user_point_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "points"
    t.string "transaction_type"
    t.integer "user_activity_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_activity_type_id"], name: "idx_user_activity_type_id"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "web_user_points", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", null: false
    t.integer "total_points", null: false
    t.boolean "can_redeem", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["total_points"], name: "total_points"
    t.index ["user_id"], name: "idx_user_points_user_id", unique: true
  end

  create_table "week_days", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "Si_no"
    t.string "S_Day", limit: 20
    t.string "Day_name", limit: 20
  end

  create_table "whats_new_dialogues", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "message"
    t.integer "android_app_releases_id"
    t.integer "device_type_id"
    t.string "image_url"
    t.string "deeplink"
    t.string "status", limit: 45, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "whitelisted_mobiles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["number"], name: "index_whitelisted_mobiles_on_number", unique: true
  end

  create_table "wifi_stations", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "station_name", limit: 45
    t.string "station_code", limit: 45
    t.string "state", limit: 45
    t.string "is_active", limit: 45
  end

  create_table "wisdom_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "wisdom_type_id"
    t.string "wisdom_category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wisdom_categories_wisdoms", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "wisdom_category_id"
    t.integer "wisdom_id"
  end

  create_table "wisdom_comments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.integer "wisdom_id"
    t.text "comment"
    t.string "status"
    t.string "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "visited"
    t.boolean "planning_to_visit"
    t.index ["user_id"], name: "idx_wisdom_comments_android_user_id"
    t.index ["wisdom_id"], name: "idx_wisdom_comments_wisdom"
  end

  create_table "wisdom_hashes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "wisdom_id"
    t.string "hash_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wisdom_station_codes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "wisdom_id"
    t.text "station_codes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "wisdom_created_on"
  end

  create_table "wisdom_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "wisdom_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wisdomquestions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "user_wisdomquestion_text"
    t.text "admin_wisdomquestion_text"
    t.date "start_date"
    t.date "end_date"
    t.string "station_code"
    t.text "train_number"
    t.string "image_name"
    t.string "wisdomquestion_status"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wisdoms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.date "created_on"
    t.string "created_by"
    t.integer "wisdom_category_id"
    t.integer "wisdom_type_id"
    t.string "user_location"
    t.text "user_wisdom_text"
    t.text "admin_wisdom_text"
    t.string "modified_by"
    t.datetime "modified_on"
    t.string "wisdom_status"
    t.date "end_date"
    t.integer "total_like"
    t.integer "total_dislike"
    t.string "user_id"
    t.boolean "display"
    t.integer "ref_wisdom_id"
    t.string "station_code"
    t.string "train_number"
    t.string "image_name"
    t.string "wisdom_image_file_name"
    t.string "wisdom_image_content_type"
    t.integer "wisdom_image_file_size"
    t.datetime "wisdom_image_updated_at"
    t.index ["modified_on"], name: "idx_wisdoms_modified_on"
    t.index ["wisdom_status"], name: "idx_wisdom_status"
    t.index ["wisdom_type_id"], name: "wisdom_type_id"
  end

  create_table "yatrachef_final.finance_invoice_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "date_of_creation"
    t.date "invoice_month_year"
    t.integer "rest_id"
    t.string "rest_name", limit: 200
    t.float "opening_balance", limit: 53
    t.bigint "current_month_settlement"
    t.float "cod", limit: 53
    t.float "vendor_share_excluding_delivery_charge", limit: 53
    t.integer "delivery_charges_share"
    t.integer "non_delivery_charge"
    t.float "complaint_resolution_charges", limit: 24
    t.float "discounts_by_ry", limit: 53
    t.integer "packaging_charge"
    t.bigint "bonus_amount", null: false
    t.text "rest_address"
  end

  create_table "yc_order_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "order_type", default: 0, null: false
    t.string "description", limit: 45, collation: "utf8_bin"
  end

end
