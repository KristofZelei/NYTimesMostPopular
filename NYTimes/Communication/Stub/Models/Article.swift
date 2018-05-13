/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
class Article : NSObject, Codable {
	var url : String?
	var adx_keywords : String?
	var column : String?
	var section : String?
	var byline : String?
	var type : String?
	var title : String?
	var abstract : String?
	var published_date : String?
	var source : String?
	var id : Int?
	var asset_id : Int?
	var views : Int?
	var des_facet : [String]?
	var org_facet : [String]?
	var per_facet : [String]?
	var geo_facet : [String]?
	var media : [Media]?

	enum CodingKeys: String, CodingKey {

		case url = "url"
		case adx_keywords = "adx_keywords"
		case column = "column"
		case section = "section"
		case byline = "byline"
		case type = "type"
		case title = "title"
		case abstract = "abstract"
		case published_date = "published_date"
		case source = "source"
		case id = "id"
		case asset_id = "asset_id"
		case views = "views"
		case des_facet = "des_facet"
		case org_facet = "org_facet"
		case per_facet = "per_facet"
		case geo_facet = "geo_facet"
		case media = "media"
	}
    
    override init() {
        url = ""
        adx_keywords = ""
        column = ""
        section = ""
        byline = ""
        type = ""
        title = ""
        abstract = ""
        published_date = ""
        source = ""
        id = 0
        asset_id = 0
        views = 0
        des_facet = [String]()
        org_facet = [String]()
        per_facet = [String]()
        geo_facet = [String]()
        media = [Media]()        
        super.init()
    }

    required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		adx_keywords = try values.decodeIfPresent(String.self, forKey: .adx_keywords)
		column = try values.decodeIfPresent(String.self, forKey: .column)
		section = try values.decodeIfPresent(String.self, forKey: .section)
		byline = try values.decodeIfPresent(String.self, forKey: .byline)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
		published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		asset_id = try values.decodeIfPresent(Int.self, forKey: .asset_id)
		views = try values.decodeIfPresent(Int.self, forKey: .views)
		
        do {
            des_facet = try values.decodeIfPresent([String].self, forKey: .des_facet)
        } catch  {
            des_facet = []
        }
        
        do {
            org_facet = try values.decodeIfPresent([String].self, forKey: .org_facet)
        } catch  {
            org_facet = []
        }
        
        do {
            per_facet = try values.decodeIfPresent([String].self, forKey: .per_facet)
        } catch  {
            per_facet = []
        }
        
        do {
            geo_facet = try values.decode([String]?.self, forKey: .geo_facet)
        } catch  {
            geo_facet = []
        }
        
        do {
            media = try values.decodeIfPresent([Media].self, forKey: .media)
        } catch  {
            media = []
        }
		
	}

}
