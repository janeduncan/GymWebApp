To get the web app up & running...

```bash
createdb gym
psql -d gym -f db/gym.sql
ruby db/seeds.rb
ruby app.rb
```

Enjoy!
