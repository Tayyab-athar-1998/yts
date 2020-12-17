User.where(email: 'root@test.com').first_or_create!(
  name: 'admin',
  email: 'root@test.com',
  password: 'password',
  capabilities: ['ROOT'],
  user_name: 'admin'
)

User.where(email: 'root@test.com').first_or_create!(
  name: 'test',
  email: 'test@test.com',
  password: 'password',
  capabilities: ['USER'],
  user_name: 'test'
)

User.where(email: 'root@test.com').first_or_create!(
  name: 'test1',
  email: 'test1@test.com',
  password: 'password',
  capabilities: ['USER'],
  user_name: 'test1'
)
