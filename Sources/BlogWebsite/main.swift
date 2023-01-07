import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct BlogWebsite: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://shubhamKashyap7200Blogsite.com")!
    var name = "Shubham Kashyap  Blog"
    var description = "A description of BlogWebsite"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try BlogWebsite().publish(using: [
    .installPlugin(.splash(withClassPrefix: "")),
    .addMarkdownFiles(),
    .copyResources(),
    .generateHTML(withTheme: .basic),
    .generateRSSFeed(including: [.posts]),
    .generateSiteMap(),
])

//try BlogWebsite().publish(using: [
//  .copyResources(),
//  .installPlugin(.splash(withClassPrefix: "")),
//  .addMarkdownFiles(),
//  .sortItems(by: \.date, order: .descending),
//  .generateHTML(withTheme: .basic),
//  .unwrap(RSSFeedConfiguration.default) { config in
//      .generateRSSFeed(
//        including: [.posts],
//          config: config
//      )
//  },
//  .generateSiteMap()
//])

//// This will generate your website using the built-in Foundation theme:
//try BlogWebsite().publish(withTheme: .foundation)
