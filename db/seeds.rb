# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create({
    username: "admin",
    password: "aaaaaa",
    name: "管理员",
    email: "admin@test.com",
    role: "admin",
    phone: "13800000000"
})

teachers = User.create([
    {
        username: "teacher_1",
        password: "aaaaaa",
        name: "教师一",
        email: "teacher_1@test.com",
        role: "client",
        phone: "13800040000"
    },
    {
        username: "teacher_2",
        password: "aaaaaa",
        name: "教师二",
        email: "teacher_2@test.com",
        role: "client",
        phone: "13800040005"
    },
    {
        username: "teacher_3",
        password: "aaaaaa",
        name: "教师三",
        email: "teacher_3@test.com",
        role: "client",
        phone: "13800040200"
    },
    {
        username: "teacher_4",
        password: "aaaaaa",
        name: "教师四",
        email: "teacher_4@test.com",
        role: "client",
        phone: "13800040000"
    }])

exam_items = ExamItem.create([{name: "出勤"}, {name: "日常"}, {name: "卫生"}, {name: "公物"}, {name: "锻炼"}, {name: "奖惩"}])

class_orgs = ClassOrg.create([
    {
        grade: "freshman",
        number: 1,
        score: 100,
        user_id: teachers[0].id
    },
    {
        grade: "freshman",
        number: 2,
        score: 100,
        user_id: teachers[0].id
    },
    {
        grade: "freshman",
        number: 3,
        score: 100,
        user_id: teachers[3].id
    },
    {
        grade: "sophomore",
        number: 1,
        score: 100,
        user_id: teachers[2].id
    },
    {
        grade: "sophomore",
        number: 2,
        score: 100,
        user_id: teachers[0].id
    },
    {
        grade: "junior",
        number: 1,
        score: 100,
        user_id: teachers[1].id
    },
    {
        grade: "junior",
        number: 2,
        score: 100,
        user_id: teachers[2].id
    },
    {
        grade: "junior",
        number: 3,
        score: 100,
        user_id: teachers[3].id
    },
])

std_activities = StdActivity.create([
    {
        description: "上课迟到",
        score: -5,
        exam_item_id: exam_items[0].id
    },
    {
        description: "早退",
        score: -5,
        exam_item_id: exam_items[0].id
    },
    {
        description: "周日返校迟到",
        score: -5,
        exam_item_id: exam_items[0].id
    },
    {
        description: "上课无故出教室",
        score: -2,
        exam_item_id: exam_items[1].id
    },
    {
        description: "上课铃响不进教室",
        score: -3,
        exam_item_id: exam_items[1].id
    },
    {
        description: "早中晚就餐集合迟到",
        score: -3,
        exam_item_id: exam_items[1].id
    },
    {
        description: "课间操做不好",
        score: -5,
        exam_item_id: exam_items[4].id
    },
    {
        description: "没有打扫卫生",
        score: -6,
        exam_item_id: exam_items[2].id
    },
    {
        description: "卫生死角打扫不干净",
        score: -3,
        exam_item_id: exam_items[2].id
    },
    {
        description: "病，事假",
        score: 0,
        exam_item_id: exam_items[1].id
    },
    {
        description: "代打卡",
        score: -10,
        exam_item_id: exam_items[5].id
    },
    {    
        description: "迟到者登记作假",
        score: -10,
        exam_item_id: exam_items[5].id
    },
    {
        description: "损坏公物",
        score: -6,
        exam_item_id: exam_items[3].id
    },
    {
        description: "未尽到公务维护义务",
        score: -3,
        exam_item_id: exam_items[3].id
    }
])