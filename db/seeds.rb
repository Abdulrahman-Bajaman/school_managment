# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

School.create!([
  {
    name_ar: "مدرسة الحكمة",
    name_en: "Wisdom School",
    address: "الرياض",
    status: 0
  },
  {
    name_ar: "مدرسة المستقبل",
    name_en: "Future School",
    address: "جدة",
    status: 1
  },
  {
    name_ar: "مدرسة الأمل",
    name_en: "Hope School",
    address: "مكة",
    status: 0
  },
  {
    name_ar: "مدرسة النجاح",
    name_en: "Success School",
    address: "الدمام",
    status: 1
  },
  {
    name_ar: "مدرسة التميز",
    name_en: "Excellence School",
    address: "الخبر",
    status: 0
  },
  {
    name_ar: "مدرسة المعرفة",
    name_en: "Knowledge School",
    address: "الطائف",
    status: 1
  },
  {
    name_ar: "مدرسة الفجر",
    name_en: "Dawn School",
    address: "أبها",
    status: 0
  },
  {
    name_ar: "مدرسة الشروق",
    name_en: "Sunrise School",
    address: "تبوك",
    status: 1
  },
  {
    name_ar: "مدرسة الإبداع",
    name_en: "Innovation School",
    address: "حائل",
    status: 0
  },
  {
    name_ar: "مدرسة الرؤية",
    name_en: "Vision School",
    address: "جيزان",
    status: 1
  }
])
