//
//  URLConstants.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 13/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

public struct APIResponse
{
    static let statusSuccess = "CSRTL02610"
}

public struct URLConstant
{
    
    static let kBaseURL = "http://ticketmgt.kapishgroup.co.in/api/kapishAPI/"
    
    static let kParameterAuthTypeToken = "uSTWwebQqsO9ZdOIpRqnGvP2wLVwVuN4W75uBdVUZLTd17Ibk31c9bczvxS09iqL"
    static let kParameterProjectType = "FDGGArxYK23bHe+LG0UJKs14P0vt2ajxJjxbXrD/2UWZQ5WxF1zlPuN/QBbI194F"
    
    static let kParameterApiUserName = "KapishGroup"
    
    static let RegistrationURL:String = "http://ticketmgt.kapishgroup.co.in/api/kapishAPI/postcreate"
    
    static let ImageBaseURL = "http://kps.kapishgroup.co.in/images/Kapish/"
}

// MARK: - API Service End Points

public class URLEndPoints :NSObject
{
    // POST
    static let kRegistrationEndPont = "postcreate"
    
    // GET
    static let kGetLoginEndPoint = "GetLogin"
    static let kGetOtpEndPoint = "GetSendTP"
    static let kMobileVerificationEndPoint = "GetMobileVerification"
    static let kGetUserDetailsEndPoint = "GetCustomer_Infos"
    static let kForgotPasswordEndPoint = "GetForgetonPassword"
    static let kUpdateUserProfile = "putuserprofile"
    static let kGetProductType = "getproducttype"
    static let kGetCollection = "getcollection"
    static let kGetCategory = "getcategory?Clid=0"
    static let kGetSubCategory = "getsuubcategory?Caid="
    static let kGetGoldCoins = "getgoldcoins"
    static let kGetWedding = "getwedding"
    static let kGetUphar = "getuphaarlist"
    
    static let kGetOfferList = "getofferlist"
    static let kMetalColor = "getmetalcolor"
    static let kGetMetalPurityName = "getmetalpurityname"
    static let kGetDiamondsColor = "getdiamondscolor"
    static let kGetDiamondClarity = "getdiamondsclairitylist"
    static let kGetColorStone = "getcolorstonelist"
    static let kGetClarityList = "getclairitycsList"
    
}

public struct ImageEndPoints
{
    static let kImgCategory = "CategoryImage/"
    static let kImgCollection = "ICollectionImage/"
    static let kImgProductType = "ProductType/"
    static let kImgSubCategory = "SubCategory/"
    static let kImgProducts = "Products/"
}

