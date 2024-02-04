const express = require ('express');
const bodyParser = require ('body-parser');
const path = require ('path');
const me = require ('mustache-express');

const app = express();
const port = 3000;

app.set('views', `${__dirname}/static`);
app.set('view engine', 'mustache');
app.engine('mustache', me());

require('dotenv').config();

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

let root_path = path.resolve(__dirname, 'static');

app.use(express.static(root_path));
const memberRouter = require('./router/member');

app.use('/member', memberRouter);

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});