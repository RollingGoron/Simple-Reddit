Simple-Reddit
=============
A very barebones reddit client

I wanted to see how difficult it would be to get a simple, bare bones Reddit client up and running.

The application will get a list of the "popular" subreddits (predetermined by Reddit) and allows the user to get a list of the top 25 posts. Used a simple UIWebView to display the post.

I used SDWebImage to download the Thumbnails Asynchronously.

I utilized NSURLSessionDataTask to retrieve the data from Reddit and parsed it using NSJSONSerilization.

Hopes this helps others!
