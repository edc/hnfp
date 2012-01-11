// helper
var print_top = function(options) {
  options = {
    n_entries: options.n_entries || 10,
    result_formatter: options.result_formatter || function() {return this._id},
    query: options.query || base(),
    sort_term: options.sort_term || {},
    title: options.title || ''
  };
  print('<!--  ' + options.title + '  -->');
  options.query.sort(options.sort_term).limit(options.n_entries)
    .forEach(function(entry) {
    print('<tr><td><a href="http://news.ycombinator.com/item?id=' + entry._id +
          '">' + entry.title + '</a></td><td>' +
          options.result_formatter.apply(entry) + '</td></tr>');
  });
};

// time-based base query factory
var time_range = {$gt:ISODate("2011-08-04T07:00:00.000Z"),
  $lt:ISODate("2012-01-01T08:00:00.000Z")};
var base = function(query) {
  query = query || {};
  query.time = query.time || time_range;
  return db.posts.find(query);
};

// most upvoted
print_top({
  title: 'most upvoted',
  sort_term: {'points':-1},
  result_formatter: function() {return this.points.slice(-1)[0];}
});
// most commented
print_top({
  title: 'most commented',
  sort_term: {'commentCount':-1},
  result_formatter: function() {return this.commentCount.slice(-1)[0];}
});

// climb time
var kickin = null, bar = 300;
base({points:{$gt:bar}}).forEach(function(entry) {
  var warm, hot;
  if (! kickin) warm = entry.time;
  for (i = 1; i < entry.points.length; i ++) {
    if (kickin && (entry.points[i-1] < kickin && entry.points[i] >= kickin)) {
      warm = entry.timestamps[i];
    } else if (entry.points[i-1] < bar && entry.points[i] >= bar) {
      hot = entry.timestamps[i];
    }
  }
  db.temp.save({
    _id: entry._id,
    title: entry.title,
    points: entry.points,
    climbTime: hot - warm
  });
});
print_top({
  title: 'quickest climb',
  query: db.temp.find({climbTime:{$gt:1}}),
  sort_term: {'climbTime':1},
  result_formatter: function() {
    return this.climbTime / 1000 / 60 + '<span data-sparkline="[' +
      this.points + ']"></span>';
  }
});
db.temp.drop();

// span the most
base().forEach(function(entry){
  var span=entry.timestamps[entry.timestamps.length - 1] - entry.timestamps[0];
  db.temp.save({_id:entry._id, span:span, title:entry.title});
});
print_top({
  title: 'longest shelf life',
  query: db.temp.find(),
  sort_term: {'span':-1},
  result_formatter: function() {return this.span / 1000 / 3600 / 24;}
});
db.temp.drop();

// won't-go-away stories
base().forEach(function(entry) {
  var p = entry.timestamps.map(function(x, i) {
    var xx = x - entry.timestamps[i-1];
    return isNaN(xx) ? false : xx > 3700000
  });
  gap = p.filter(function(xx) {return xx}).length;
  db.temp.save({_id:entry._id, gap:gap, title:entry.title});
}); 
print_top({
  title: 'most resistant',
  query: db.temp.find(),
  sort_term: {'gap':-1},
  result_formatter: function() {return this.gap;}
});
db.temp.drop();

// noteworthy no-comment
base().forEach(function(entry) {
  var p = entry.points.slice(-1)[0];
  var c = entry.commentCount.slice(-1)[0];
  ratio = c === 0 ? 0 : p/c;
  db.temp.save({
    _id:entry._id,
    ratio:ratio,
    points:entry.points.slice(-1)[0],
    commentCount:entry.commentCount.slice(-1)[0],
    title:entry.title
  });
});
print_top({
  title: 'noteworthy no-comment',
  query: db.temp.find(),
  sort_term: {'ratio':-1},
  result_formatter: function() {return this.points + ":" + this.commentCount;}
});
db.temp.drop();

// mapreduce to find time-based stats
var map = function() {
  for (var i = 0, last = 0; i < this.points.length; i ++) {
    // use the current time zone determined by system locale
    var h = this.timestamps[i].getHours();
    emit(h, {votes: -last});
    emit(h, {votes: (last = this.points[i])});
  }
};

var reduce = function(k, vals) {
  for (var i = 0, votes = 0; i < vals.length; i ++) {
    votes += vals[i].votes;
  }
  return {time:k,votes:votes};
};

db.posts.mapReduce(map, reduce,
                   {query: {time: time_range}, out: 'active_time'});
print('<!--  night owl study  -->');
db.active_time.find().forEach(function(entry) {
  print('<span data-hour="' + entry.value.time + '" data-activity="' +
        entry.value.votes + '"></span>');
});
