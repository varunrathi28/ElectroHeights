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
    
    // Login
    
    static let kGetLoginEndPoint = "Login?"
    static let kForgotPasswordEndPoint = "ForgotPassword"
    static let kValidateMobile = "ValidateMobileNo"
    static let kSendOtpEndPoint = "SendOTP"
    static let kInsertCustomer = "InsertCustomer"
    
    //Home Screen
    
    static let kFetchShopByCategory = "FetchShopByCategory"
    static let kFetchFeaturedProducts = "FetchFeaturedProducts"
    static let kFetchNewProducts = "FetchNewProducts"
    static let kFetchProductCategories = "FetchProductCategories"
    static let kFetchBanners = "FetchBanners"
    static let kFetchProductSubCategories = "FetchProductSubCategories"
    
    // My Account
    
    static let kFetchStates = "FetchStates"
    static let kFetchCities = "FetchCities"
    static let kSendEmailConfirmOTP = "SendEmailConfirmOTP"
    static let kSendMobileConfirmOTP = "SendMobileConfirmOTP"
    static let kUpdateCustomerImage = "UpdateCustomerImage"
    static let kUpdateCustomer = "UpdateCustomer"
    static let kFetchCustomerDetails = "FetchCustomerDetails"
    
   // Product Details
    
    static let kAddToCart = "AddToCart"
    static let kFetchProductVariations = "FetchProductVariations"
    static let kUpdateWishlist = "UpdateWishlist"
    static let kDeleteWishlistProduct = "DeleteWishlistProduct"
    static let kFetchProductVariationDescriptionFields = "FetchProductVariationDescriptionFields"
    static let kFetchOrders =  "FetchCustomerOrders"


    // My Cart Screen 
    
    static let kUpdateProductQty = "UpdateProductQty"
    static let kRemoveCartProduct = "RemoveCartProduct"
    static let kFetchCartProducts = "FetchCartProducts"
    
    //Wish List Screen
    
     static let kFetchWishlistProducts = "FetchWishlistProducts"
    
    // Order Confirmation
    
     static let kPlaceOrder = "PlaceOrder"
    
}

public struct ImageEndPoints
{
    static let kImgCategory = "CategoryImage/"
    static let kImgCollection = "ICollectionImage/"
    static let kImgProductType = "ProductType/"
    static let kImgSubCategory = "SubCategory/"
    static let kImgProducts = "Products/"
}

