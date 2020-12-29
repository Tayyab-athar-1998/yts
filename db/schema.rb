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

ActiveRecord::Schema.define(version: 20201220230102) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "actors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "movie_id"
    t.string "type"
    t.index ["movie_id"], name: "index_feedbacks_on_movie_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "movie_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "staring_as"
    t.string "role_played"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movie_id"
    t.bigint "actor_id"
    t.index ["actor_id"], name: "index_movie_roles_on_actor_id"
    t.index ["movie_id"], name: "index_movie_roles_on_movie_id"
  end

  create_table "movies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "name"
    t.integer "number_of_downloads"
    t.date "release_date"
    t.boolean "is_featured"
    t.text "synopsis"
    t.string "video_quality"
    t.string "languages"
    t.string "genres"
    t.integer "feedbacks_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["genres"], name: "index_movies_on_genres"
    t.index ["is_featured"], name: "index_movies_on_is_featured"
    t.index ["languages"], name: "index_movies_on_languages"
    t.index ["name"], name: "index_movies_on_name"
    t.index ["number_of_downloads"], name: "index_movies_on_number_of_downloads"
    t.index ["release_date"], name: "index_movies_on_release_date"
    t.index ["user_id"], name: "index_movies_on_user_id"
    t.index ["video_quality"], name: "index_movies_on_video_quality"
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.float "value", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "movie_id"
    t.index ["movie_id"], name: "index_ratings_on_movie_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string "user_name"
    t.string "name"
    t.string "introduction"
    t.string "capabilities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "feedbacks", "movies"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "movie_roles", "actors"
  add_foreign_key "movie_roles", "movies"
  add_foreign_key "movies", "users"
  add_foreign_key "ratings", "movies"
  add_foreign_key "ratings", "users"
end
