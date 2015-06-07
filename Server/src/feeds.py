__author__ = 'Stas Tomych<stas.tomich@gmail.com'
__data__ = ''
__time__ = '14:23'

import feedparser

def get_feeds(count = 3):
    if count == 0:
        return feedparser.parse('http://nure.ua/category/all_news/feed/').entries
    else:
        return feedparser.parse('http://nure.ua/category/all_news/feed/').entries[:int(count)]