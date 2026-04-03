import scrapy
from Webcrawler.items import WebcrawlerItem
from urllib.parse import urljoin



class Webspider(scrapy.Spider):
    name = "Webcrawler"
    allowed_domains = ["nbcnews.com"]
    start_urls = [
        "https://www.nbcnews.com"
    ]

    def parse(self, response):
        headlines = response.css('article a, .headline a, h1 a, h2 a, h3 a')
        seen_links = set()

        for headline in headlines:
            item = WebcrawlerItem()
        
            link = headline.css('::attr(href)').get()

            if link:
                link = urljoin(response.url, link)

                if link in seen_links:
                    continue
                seen_links.add(link)

            titel = headline.css('span::text').get()
            if not titel:
                titel = headline.css('::text').get()
            if not titel:
                titel = headline.xpath('./ancestor::article//h2/text() | ./ancestor::article//h3/text()').get()

            if titel and link and 'nbcnews.com' in link:
                item['title'] = titel.strip()
                item['link'] = link
                item['source'] = "NBC News"

                yield scrapy.Request(
                    link,
                    callback=self.parse_article,
                    meta={'item':item}
                )

    def parse_article(self, response):
        item = response.meta['item']
        date = response.css('time::attr(datetime)').get()

        if not date:
            date = response.css('time::text').get()

        summary = response.css('p.lede::text, .article-body p:first-child::text').get()

        if not summary:
            summary = response.css('article p::text').get()

        if date:
            item['date'] = date.strip()

        if summary:
            item['summary'] = summary.strip()

        yield item