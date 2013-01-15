#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create(name: 'xie_yl',sex: 1, email: 'yalong.tse@gmail.com', location: 'beijing')
User.create(name: 'qian_jin' ,sex:1, email: 'qian_jin@163.com',location: 'beijing')
User.create(name: 'niu_hr', sex:1,email:'niu_hr@gmail.com',location:'beijing') 
User.create(name:'admin',sex:1,email:'admin@douban.com',location:'beijing')

Group.delete_all
Group.create(name:'公益事业组',introduction: %{<p>我们是一群致力于公益事业的年轻人，有志为了中国的公益事业而努力</p>},label:'公益')
Group.create(name:'大柳树', introduction:%{<p>这是一群来自大柳树的年轻人</p>},label:'大柳树')
Group.create(name:'电影爱好者',introduction:%{<p>我们有着共同的爱好，那就是电影</p>},label:'电影')
Group.create(name:'技术男',introduction:%{<p>我们都是技术男</p>},label:'技术男')

