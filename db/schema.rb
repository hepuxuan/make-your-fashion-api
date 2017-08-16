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

ActiveRecord::Schema.define(version: 20170710225757) do

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "categories_items", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "item_id", null: false
  end

  create_table "design_details", force: :cascade do |t|
    t.float "height"
    t.float "width"
    t.float "x"
    t.float "y"
    t.float "rotation"
    t.string "pic_id"
    t.integer "design_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_id"], name: "index_design_details_on_design_id"
    t.index ["product_id"], name: "index_design_details_on_product_id"
  end

  create_table "designs", force: :cascade do |t|
    t.string "img_url"
    t.boolean "is_private", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designs_tags", id: false, force: :cascade do |t|
    t.integer "design_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id"
    t.decimal "price"
    t.string "size"
    t.integer "qty"
    t.string "print_front"
    t.string "print_back"
    t.string "img"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status"
    t.string "name"
    t.string "address"
    t.string "phone"
    t.decimal "ship_fee"
    t.decimal "promotion"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "item_id"
    t.integer "ratings"
    t.decimal "price"
    t.string "name"
    t.string "description"
    t.string "img_front"
    t.string "img_back"
    t.string "img"
    t.string "sizes"
    t.integer "category_id"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_products_on_campaign_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "text_details", force: :cascade do |t|
    t.string "text"
    t.integer "font_size"
    t.string "font_family"
    t.string "color"
    t.string "align"
    t.boolean "bold"
    t.boolean "italic"
    t.float "height"
    t.float "width"
    t.float "x"
    t.float "y"
    t.float "rotation"
    t.string "pic_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_text_details_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "address"
    t.string "email"
    t.string "token"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
