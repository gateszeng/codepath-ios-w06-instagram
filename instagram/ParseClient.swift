//
//  ParseClient.swift
//  instagram
//
//  Created by Gates Zeng on 3/13/17.
//  Copyright © 2017 Gates Zeng. All rights reserved.
//

import UIKit
import Parse

class ParseClient: NSObject {
    
    class func postImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        // create Parse object PFObject
        let post = PFObject(className: "Post")
        
        // add fields
        post["media"] = getPFFileFromImage(image: image)
        post["author"] = PFUser.current()
        post["caption"] = caption ?? "I am such a good photographer"
        post["likesCount"] = 0
        post["commentsCount"] = 0
        
        // save object (this saves it asynchronously)
        post.saveInBackground(block: completion)
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if the image i snot nil
        if let image = image {
            // get image data and check that it is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
}
