#!/bin/sh


# generate documentation
# You need to do this offline since bundler doesn't work on UEdin servers!

# sync the files on the web server
rsync -a ./images/ /web/smudd/public_html/LSDTT_book/Images
rsync -a ./LSDTT_docs.html /web/smudd/public_html/LSDTT_book/LSDTT_docs.html
rsync -a ./LSDTT_docs.pdf /web/smudd/public_html/LSDTT_book/LSDTT_docs.pdf

# now make sure the permissions are correct
chmod 755 /web/smudd/public_html/LSDTT_book -R

