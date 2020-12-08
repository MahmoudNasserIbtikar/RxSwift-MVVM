//
//  ApiUrls.swift
//  mallers
//
//  Created by Mahmoud Nasser on 5/10/20.
//  Copyright © 2020 Mahmoud Nasser. All rights reserved.
//

import Foundation

struct ApiUrls {
    
    struct Apis {
        static let loginUrl = "/api/v1/customer/login"
        static let socialLogin = "/api/v1/customer/login/{provider}"
        static let forgotPassword = "/api/v1/customer/password/forget"
        static let cities = "/api/v1/cities"
        static let cityNeighborhoods = "/api/v1/cities/{cityId}/neighborhoods"
        static let register = "/api/v1/customer/register"
        static let verifyEmail = "/api/v1/customer/{customer_id}/verify-email"
        static let verifyPhone = "/api/v1/customer/{customer_id}/verify-mobile"
        static let resetPassword = "/api/v1/customer/password/reset"
        static let forgotEmail = "/api/v1/customer/email/forget"
        static let verifyOldUserPhone = "/api/v1/customer/{customer_id}/email/verify-mobile-code"
        static let signUpOldUser = "/api/v1/customer/{customer_id}/email/reset"
        static let searchMalls = "/api/v1/malls"
        static let categories = "/api/v1/categories"
        static let categoriesWithSub = "/api/v1/categories-with-sub"
        static let advertisements = "/api/v1/advertisements"
        static let stores = "/api/v1/stores"
        static let branches = "/api/v1/branches"
        static let brancheById = "/api/v1/branches/{id}"
        static let products = "/api/v1/products"
        static let attributes = "/api/v1/attributes"
        static let customCart = "/api/v1/customCart"
        static let productDetails = "/api/v1/product/{id}"
        static let cart = "/api/v1/cart"
        static let addToCart = "/api/v1/cart"
        static let editProductQuantity = "/api/v1/cart/{id}"
        static let editCustomProductQuantity = "/api/v1/customCartItem/{id}"
        static let deleteItemFromCart = "/api/v1/cart/{id}"
        static let deleteCustomItemFromCart = "/api/v1/customCartItem/{id}"
        static let deleteCart = "/api/v1/cart/delete-all-cart/{mall_id}"
        static let editCustomCartApproxPrice = "/api/v1/customCart/{id}"
        static let approveOrderStore = "/api/v1/orders/{order_id}/stores/{order_store_id}/approve"
        static let declineOrderStore = "/api/v1/orders/{order_id}/stores/{order_store_id}/decline"
        static let cancelOrderStore = "/api/v1/orders/{order_id}/stores/{order_store_id}/cancel"
        static let storeReviews = "/api/v1/reviews/branch/{id}"

        
        

        static var homeSearch : String {
            var configuration = Configuration()
            let environment = configuration.environment
            if environment == Environment.Stage || environment == Environment.Live {
                return "/api/v1/search?q[]=malls&q[]=stores"
            } else {
                return "/api/v1/search?q[]=malls&q[]=stores&q[]=categories"
            }            
        }
        
        static var mallDetailsSearchBranches = "/api/v1/search?q[]=products&q[]=branches"
        static var mallDetailsSearchStores = "/api/v1/search?q[]=products&q[]=stores"
        static var storeDetailsSearchProducts = "/api/v1/search?q[]=products"

        static var uploadImage = "/api/v1/files/{directory}"
        static var deleteImage = "/api/v1/files/{id}"

        static var addAddress = "/api/v1/customer/addresses"
        static var editAddress = "/api/v1/customer/addresses/{id}"
        static var getAllAddresses = "/api/v1/customer/addresses"
        static var checkout = "/api/v1/checkout"
        static var anyThingCheckout = "/api/v1/request-any"
        static var cancelOrder = "/api/v1/orders/{id}/close"
        static var cancelReason = "/api/v1/orders/{id}/cancel-reason"
        static var customerPoints = "/api/v1/customer/balance"
        static var paymentMethod = "/api/v1/orders/{id}/payment"
        static var orderReview = "/api/v1/orders/{id}/review"
        static var editProfile = "/api/v1/customer/profile/update"
        static var getOrders = "/api/v1/orders"
        static var productFavorite = "/api/v1/favorite-products/{productId}"
        static var storeFavorite = "/api/v1/favorite-stores/{storeId}"
        static var branchFavorite = "/api/v1/favorite-branches/{branchId}"
        static let favoriteBranches = "/api/v1/favorite-branches"
        static let favoriteProducts = "/api/v1/favorite-products"
        static let customerPointsData = "/api/v1/customer/balance"
        static let earningPoints = "/api/v1/customer/points"
        static let redeemTransactions = "/api/v1/customer/transactions"
        static let redemptionBranches = "/api/v1/customer/merchant-branches"
        static let applyPromoCode = "/api/v1/customer/{id}/apply-promocode"
        static let applyCopoun = "/api/v1/orders/{id}/apply-coupon"
        static let calculateDeliveryFees = "/api/v1/orders/calculate-fees"
        static let registerNotifications = "/api/v1/users/tokens"
        static let getEvents = "/api/v1/events"
        static let getOffers = "/api/v1/offers"
        static let rateStore = "/api/v1/branches/{id}/review"
        static let getNotifications = "/api/v1/notifications-log"
        static let deleteNotifications = "/api/v1/notifications-log/{id}"


    }
    
}
