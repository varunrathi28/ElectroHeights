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
    
    static let BasicAuth = "UmFodWw6MTIz"
    static let kBaseURL = "http://50.63.12.86:8003/ElectroHeightAPI/"
    static let FCMID = "123"
}

// MARK: - API Service End Points

public class URLEndPoints :NSObject
{

    

    static let kGetLoginEndPoint = "Login?"
    static let kForgotPasswordEndPoint = "ForgotPassword"
    static let kValidateMobile = "ValidateMobileNo"
    static let kSendOtpEndPoint = "SendOTP"
    static let kInsertCustomer = "InsertCustomer"
    static let kFetchShopByCategory = "FetchShopByCategory"
    static let kFetchFeaturedProducts = "FetchFeaturedProducts"
    static let kFetchNewProducts = "FetchNewProducts"
    static let kFetchProductCategories = "FetchProductCategories"
    static let kFetchBanners = "FetchBanners"
    static let kFetchCartProducts = "FetchCartProducts"
    

    // To be checked
    static let kGetUserDetailsEndPoint = "GetCustomer_Infos"
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

