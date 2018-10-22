# Parser

## For start
###### PostgreSql
`sudo apt install postgresql`
`su postgres` <br />
`psql -U postgres -p5433` <br />
`DROP DATABASE "parser";` <br />
`CREATE DATABASE "parser";` !!Only for a complete reinstallation!! <br />
`\q` <br />
`psql -p5432 -U postgres parser < parser.sql`  <br />

###### NodeJs Daemon
`npm i -g pm2`<br />

###### PhantomJS on Ununtu
```
sudo apt-get update
sudo apt-get install build-essential chrpath libssl-dev libxft-dev -y
sudo apt-get install libfreetype6 libfreetype6-dev -y
sudo apt-get install libfontconfig1 libfontconfig1-dev -y
cd ~
export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
wget https://github.com/Medium/phantomjs/releases/download/v2.1.1/$PHANTOM_JS.tar.bz2
sudo tar xvjf $PHANTOM_JS.tar.bz2
sudo mv $PHANTOM_JS /usr/local/share
sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
phantomjs --version
```

###### Create .env
`touch (path_to_project)/.env`


_Open to edit file_<br />

`DB_NAME=parser`<br />
`DB_HOST=localhost`<br />
`DB_USER=pgadmin`<br />
`DB_PASS=pass`<br />
`DB_PORT=8030`<br />
`DB_MAXC=10`<br />
`DB_ITM=600000`<br />
`NODE_ENV=dev`<br />
`NODE_PATH=/app`<br />

#### Start server
`cd (path_to_project)`<br />
`pm2 start node_modules/gulp/bin/gulp.js`

## Parse param
#### GET /parser/:date/:room/:time

`:date` - `2018-05-12`_(all data for selected day)_<br />
`:room` - `2`_(show event for selected room)_<br />
`:time` - `13:00`_(show event)_<br />

TODO

phantomjs - обязательная утилита без которой работать парсер не будет,
выше пример как установить на убунту, можно легко найти инструкции по установки, так данная утилита устанавливается из коробке(проверено в 18.04)

У данного запроса есть три варианта использования<br />
`GET /parser/:date/`<br />
`GET /parser/:date/:room/`<br />
`GET /parser/:date/:room/:time`<br />
При каждом вызове производится обновление всех событий которые были затронуты в ходе обработке полученной страницы.
