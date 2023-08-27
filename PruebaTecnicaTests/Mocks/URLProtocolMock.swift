//
//  URLProtocolMock.swift
//  PruebaTecnicaTests
//
//  Created by Miguel on 8/27/23.
//

import Foundation

class URLProtocolMock: URLProtocol {
    // this dictionary maps URLs to test data
    static var testURLs: [URL?: Data] = [:]
    
    // say we want to handle all types of request
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    // ignore this method; just send back what we were given
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        // if we have a valid URL and if we have test data for that URL…
        if let url: URL = request.url,
           let data: Data = URLProtocolMock.testURLs[url] {
            // …load it immediately.
            self.client?.urlProtocol(self, didLoad: data)
        } else {
            self.client?.urlProtocol(self, didFailWithError: CustomError.mockResponseError)
        }
        
        // mark that we've finished
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    // this method is required but doesn't need to do anything
    override func stopLoading() {}
}

enum CustomError: Error {
    case mockResponseError
}
