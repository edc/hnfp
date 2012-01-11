Simple analytics on Hacker News front page stories. See http://edc.github.com/hnfp/.

To run your own analysis, follow these steps.

1. Install MongoDB
2. Untar the dump: `tar -xjf hn.tar.bz2`
3. Run `make dbrestore` to restore the dump to your local MongoDB
4. Adjust `hn-stat.mongo.js` and `index.html.t`
5. Run `make`
