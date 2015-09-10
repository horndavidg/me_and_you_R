# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create({
	email:"test@test.com", 
	password:"1234", 
	picture:"http://www.louisesparza.net/wp-content/uploads/2015/06/4.jpg", 
	name:"Test"})

u2 = User.create({
	email:"test2@test.com", 
	password:"12345", 
	picture:"http://i.huffpost.com/gen/1860407/images/o-BLACK-FOOTED-CAT-KITTENS-facebook.jpg", 
	name:"Test2"})

u3 = User.create({
	email:"test3@test.com", 
	password:"123456", 
	picture:"http://cdn.earthporm.com/wp-content/uploads/2014/07/two-faced-chimera-cat-venus-14.jpg", 
	name:"Test3"})

u4 = User.create({
	email:"horndavidg@gmail.com", 
	password:"horndavidg", 
	picture:"http://easyscienceforkids.com/wp-content/uploads/2013/06/puffer-fish.jpg", 
	name:"David", 
	is_admin:true})

u5 = User.create({
	email:"test4@test.com", 
	password:"1234567", 
	picture:"http://cdn.earthporm.com/wp-content/uploads/2014/07/two-faced-chimera-cat-venus-14.jpg", 
	name:"Test4"})

u6 = User.create({
	email:"test5@test.com", 
	password:"12345678", 
	picture:"http://cdn.earthporm.com/wp-content/uploads/2014/07/two-faced-chimera-cat-venus-14.jpg", 
	name:"Test5"})


k1 = Kudo.create({
	description:"My first Kudo, This is great!", 
	points: 13})

u1.kudos << k1




c1 = Coupon.create({
	description:"My first Coupon, This is worth 1 high five!", 
	price: 10})

u1.coupons << c1



u1.save
u2.save
u3.save
u4.save
u5.save
u6.save