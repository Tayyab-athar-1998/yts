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

ActiveRecord::Schema.define(version: 20201215215301) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
    t.index ["genre_id", "movie_id"], name: "index_genres_movies_on_genre_id_and_movie_id"
    t.index ["movie_id", "genre_id"], name: "index_genres_movies_on_movie_id_and_genre_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages_movies", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "language_id", null: false
    t.index ["language_id", "movie_id"], name: "index_languages_movies_on_language_id_and_movie_id"
    t.index ["movie_id", "language_id"], name: "index_languages_movies_on_movie_id_and_language_id"
  end

  create_table "movie_roles", force: :cascade do |t|
    t.string "staring_as"
    t.string "role_played"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id"
    t.integer "actor_id"
    t.index ["actor_id"], name: "index_movie_roles_on_actor_id"
    t.index ["movie_id"], name: "index_movie_roles_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_downloads"
    t.date "release_date"
    t.boolean "is_featured"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "movies_video_qualities", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "video_quality_id", null: false
    t.index ["movie_id", "video_quality_id"], name: "index_movies_video_qualities_on_movie_id_and_video_quality_id"
    t.index ["video_quality_id", "movie_id"], name: "index_movies_video_qualities_on_video_quality_id_and_movie_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "name"
    t.string "password"
    t.string "password_salt"
    t.string "introduction"
    t.string "email"
    t.string "capabilities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_qualities", force: :cascade do |t|
    t.integer "resolution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
