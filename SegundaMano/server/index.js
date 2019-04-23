//1

var http = require('http'),
    express = require('express'),
    path = require('path');

const MongoClient = require('mongodb').MongoClient,
    Server = require('mongodb').Server,
    CollectionDriver = require('./collectionDriver').CollectionDriver;

var app = express();
app.set('port', process.env.PORT || 3000);


var mongoHost = '127.0.0.1', //A
    mongoPort = 27017,
    collectionDriver;

var mongoClient = new MongoClient(new Server(mongoHost, mongoPort)); //B

//mongoClient.connect("mongodb://local:27017/MyDb", function (err, db) 

MongoClient.connect(`mongodb://${mongoHost}:${mongoPort}`, { useNewUrlParser: true })
.then(client => {
  const db = client.db('SegundaMano');
  collectionDriver = new CollectionDriver(db);
  //const collection = db.collection('my-collection');
  app.listen(app.get('port'), () => console.info(`REST API running on port ${app.get('port')}`));
}).catch(error => console.error(error));


app.use(express.static(path.join(__dirname, 'public')));

app.get('/vehiculo', function (req, res) {

  const vehiculo = { maker: 'Nissan', model: 'Yuke', year: '2010', price: '12.000', platter: '3456FKK' }
  res.json(vehiculo);
});

app.get('/:collection', function(req, res) { //A
  var params = req.params || {}; //B
  console.log("Params", params);
  collectionDriver.findAll(req.params.collection, function(error, objs) { //C
       if (error) { res.send(400, error); } //D
       else { 

           res.set('Content-Type','application/json'); //G
                 res.status(200).send(objs); //H
             
        }
    });
});

app.get('/:collection/:entity', function(req, res) { //I
  var params = req.params;
  var entity = params.entity;
  var collection = params.collection;
  if (entity) {
      collectionDriver.get(collection, entity, function(error, objs) { //J
         if (error) { res.send(400, error); }
         else { res.send(200, objs); } //K
      });
  } else {
     res.send(400, {error: 'bad url', url: req.url});
  }
});

app.post('/:collection', function(req, res) { //A
  //console.log("Params", req);
  console.log("Params", req);
  var body = "";
  req.on("data", function (data) {
    var collection = req.params.collection;
    body += data;
    collectionDriver.save(collection, JSON.parse(body), function(err,docs) {
     
     });
  })
  req.on("end", function() {
    res.json({ message: 'goodbye'})
});
 
});



//2 


