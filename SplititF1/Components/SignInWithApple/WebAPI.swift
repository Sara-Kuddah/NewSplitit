//
//  WebAPI.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 04/06/2023.
//

import Foundation


struct WebAPI {

  static let baseURL = "http://127.0.0.1:8080" // e.g. https://foobar.ngrok.io (no trailing slash)
  static var accessToken: String?
  static var accessTokenD: String?

  enum WebAPIError: Error {
    case identityTokenMissing
    case unableToDecodeIdentityToken
    case unableToEncodeJSONData
    case unableToDecodeJSONData
    case unauthorized
    case invalidResponse
    case httpError(statusCode: Int)
  }

  struct SIWAAuthRequestBody: Encodable {
    let firstName: String?
    let lastName: String?
    let appleIdentityToken: String
  }

  struct UserResponse: Codable {
    let accessToken: String?
    let user: UserProfile
  }

   static func userSignedIn() -> Bool {
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
       guard self.accessToken != nil
        else {
            return false
        }
       return true
    }
    // MARK: - post user
    
  static func authorizeUsingSIWA(
    identityToken: Data?,
    email: String?,
    firstName: String?,
    lastName: String?,
    completion: @escaping (Result<UserProfile, Error>) -> Void
  ) {

    guard let identityToken = identityToken else {
      completion(.failure(WebAPIError.identityTokenMissing))
      return
    }

    guard let identityTokenString = String(data: identityToken, encoding: .utf8) else {
      completion(.failure(WebAPIError.unableToDecodeIdentityToken))
      return
    }

    let body = SIWAAuthRequestBody(
      firstName: firstName,
      lastName: lastName,
      appleIdentityToken: identityTokenString
    )

    guard let jsonBody = try? JSONEncoder().encode(body) else {
      completion(.failure(WebAPIError.unableToEncodeJSONData))
      return
    }

    let session = URLSession.shared
    let url = URL(string: "\(baseURL)/api/auth/siwa")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
      do {
        let userResponse: UserResponse = try parseResponse(response, data: data, error: error)
        accessToken = userResponse.accessToken
         UserDefaults.standard.set(self.accessToken, forKey: "accessToken")
          accessTokenD = UserDefaults.standard.string(forKey: "accessToken")
        completion(.success(userResponse.user))
      } catch {
        completion(.failure(error))
      }
    }.resume()
  }

    // MARK: - get user
    
  static func getProfile(
    completion: @escaping (Result<UserProfile, Error>) -> Void
  ) {

    guard let accessToken = Self.accessToken else {
        // if not in core data
        
      completion(.failure(WebAPIError.unauthorized))
      return
    }
      
    let session = URLSession.shared
    let url = URL(string: "\(baseURL)/api/users/me")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    session.dataTask(with: request) { (data, response, error) in
      do {
        let userResponse: UserResponse = try parseResponse(response, data: data, error: error)
        completion(.success(userResponse.user))
          
      } catch {
        completion(.failure(error))
      }
    }.resume()
  }
    
    // MARK: - POST LOCATION
    
    static func postLocation(
        discription: String,
        long: Double,
        lat: Double,
        completion: @escaping (Result<UserLocation, Error>) -> Void) {
            
            guard let accessToken = Self.accessToken else {
                
                completion(.failure(WebAPIError.unauthorized))
                return
            }
            
            let body = UserLocation(discription: discription,
                                    long: long,
                                    lat: lat)
            
            guard let jsonBody = try? JSONEncoder().encode(body) else {
              completion(.failure(WebAPIError.unableToEncodeJSONData))
              return
            }
            let session = URLSession.shared
            let url = URL(string: "\(baseURL)/api/locations/create")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
              do {
                let locationResponse: LocationResponse = try parseResponse(response, data: data, error: error)

                  completion(.success(locationResponse.location))
              } catch {
                completion(.failure(error))
              }
            }.resume()
            
        }
    // MARK: - GET LOCATION
    static func getLocation(completion: @escaping (Result<UserLocation, Error>) -> Void){
        
        guard let accessToken = Self.accessToken else {
          completion(.failure(WebAPIError.unauthorized))
          return
        }
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/locations/location")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { (data, response, error) in
            do {
                let locationResponse: LocationResponse = try parseResponse(response, data: data, error: error)

                  completion(.success(locationResponse.location))
                
            } catch {
              completion(.failure(error))
            }
          }.resume()
    }
    
    // MARK: - post error
    
    static func postOrder(
        merchantName: String,
         appName: String,
         deliveryFee: Int,
         checkpoint: String,
         notes: String?,
         active: Bool?,
         status: String?,
        completion: @escaping (Result<OrderReqBody, Error>) -> Void
    ) {
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
                      completion(.failure(WebAPIError.unauthorized))
                      return
        }

        let body = OrderReqBody(merchant_name: merchantName,
                                app_name: appName,
                                delivery_fee: deliveryFee,
                                checkpoint: checkpoint,
                                notes: notes,
                                active: active,
                                status: status)
        
        guard let jsonBody = try? JSONEncoder().encode(body) else {
          completion(.failure(WebAPIError.unableToEncodeJSONData))
          return
        }
        
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/create")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(accessToken )", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
            do {
                let orderResponse: OrderResponse = try parseResponse(response, data: data, error: error)
                
                completion(.success(orderResponse.order))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // MARK: - JOIN ORDER - POST
    
    static func joinOrder(orderID: UUID, completion: @escaping (Result<OrderReqBody, Error>) -> Void) {
        
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
              completion(.failure(WebAPIError.unauthorized))
              return
        }
        
        let body = OrderID(orderID: orderID)
        print("bbbb",body.orderID)
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/join/\(body.orderID)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            do {
                let orderResponse: OrderResponse = try parseResponse(response, data: data, error: error)
                
                completion(.success(orderResponse.order))
            } catch {
                completion(.failure(error))
            }
          }.resume()
    }
    
    // MARK: - GET MY ACTIVE ORDER
    static func getMyActiveOrder(completion: @escaping (Result<Order, Error>) -> Void) {
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
                      completion(.failure(WebAPIError.unauthorized))
                      return
        }
        
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/myactiveorder")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { (data, response, error) in
            do {
                let orderResponse: ActiveOrderOutput = try parseResponse(response, data: data, error: error)
                
                completion(.success(orderResponse.order))
            } catch {
                completion(.failure(error))
            }
          }.resume()
    }
    
    // MARK: - GET MY ACTIVE ORDER TRY 2
    static func getMyActiveOrder2(completion: @escaping (Result<User_Order, Error>) -> Void) {
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
          completion(.failure(WebAPIError.unauthorized))
          return
        }
        
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/myactiveorder")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { (data, response, error) in
            do {
                let orderResponse: ActiveOrderResonse = try parseResponse(response, data: data, error: error)
                print(orderResponse.user_order)
                completion(.success(orderResponse.user_order))
                print("??",orderResponse.user_order)
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
          }.resume()
    }
    
    // MARK: - GET MY ACTIVE ORDER TRY 3
    static func getMyActiveOrder3(completion: @escaping (Result<User_Order, Error>) -> Void) {
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
          completion(.failure(WebAPIError.unauthorized))
          return
        }
        
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/myactiveorder")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { (data, response, error) in
            do {
                if let error = error {
                  throw error
                }
                  guard let httpResponse = response as? HTTPURLResponse else {
                    throw WebAPIError.invalidResponse
                  }
                  if !(200...299).contains(httpResponse.statusCode) {
                    throw WebAPIError.httpError(statusCode: httpResponse.statusCode)
                  }
                  guard let data = data,
                  let decoded = try? JSONDecoder().decode(User_Order.self, from: data)
                  else {
                    throw WebAPIError.unableToDecodeJSONData
                  }
                completion(.success(decoded))
                
            } catch {
                completion(.failure(error))
            }
          }.resume()
    }
    
    // MARK: - GET RANDOM ORDERS - 10 - NEEDS A FIX
    static func getRandomOrders(completion: @escaping (Result<OrderReqBody, Error>) -> Void) {
        
        
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/lastrandomorders")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request) { (data, response, error) in
            do {
                let orderResponse: OrderResponse = try parseResponse(response, data: data, error: error)
                
                completion(.success(orderResponse.order))
            } catch {
                completion(.failure(error))
            }
          }.resume()
        
    }
    
    // MARK: - GET ALL ORDERS AROUND ME
    static func getOrdersAroundMe(completion: @escaping (Result<[Order], Error>) -> Void) {
        
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
              completion(.failure(WebAPIError.unauthorized))
              return
        }
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/getactiveordersaroundme")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { (data, response, error) in
            do {
                if let error = error {
                  throw error
                }
                  guard let httpResponse = response as? HTTPURLResponse else {
                    throw WebAPIError.invalidResponse
                  }
                  if !(200...299).contains(httpResponse.statusCode) {
                    throw WebAPIError.httpError(statusCode: httpResponse.statusCode)
                  }
                  guard let data = data,
                  let decoded = try? JSONDecoder().decode([Order].self, from: data)
                  else {
                    throw WebAPIError.unableToDecodeJSONData
                  }
                completion(.success(decoded))
                
            } catch {
                completion(.failure(error))
            }
          }.resume()
    }
    
    
    // MARK: - GET ALL MY ORDERS - NEEDS A FIX
    
    static func getAllMyOrders(completion: @escaping (Result<OrderReqBody, Error>) -> Void) {
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
                      completion(.failure(WebAPIError.unauthorized))
                      return
        }
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/myorders")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { (data, response, error) in
            do {
                let orderResponse: OrderResponse = try parseResponse(response, data: data, error: error)
                
                completion(.success(orderResponse.order))
            } catch {
                completion(.failure(error))
            }
          }.resume()
    }
    
    // MARK: - ADD ITEM
    static func addItem(orderID: UUID,
                        item_name: String,
                        price: Double, completion: @escaping (Result<Item, Error>) -> Void) {
        
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
              completion(.failure(WebAPIError.unauthorized))
              return
        }
        
        let body = Item(item_name: item_name, price: price)
        
        guard let jsonBody = try? JSONEncoder().encode(body) else {
          completion(.failure(WebAPIError.unableToEncodeJSONData))
          return
        }
        
        let orderID = orderID
//        let body = OrderID(orderID: orderID)
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/items/\(orderID)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
            do {
                let itemResponse: ItemResponse = try parseResponse(response, data: data, error: error)
                
                completion(.success(itemResponse.item))
            } catch {
                completion(.failure(error))
            }
          }.resume()
        
    }
    // MARK: - GET ITEMS IN AN Order
    static func getItemsInOrder(orderID: UUID, completion: @escaping (Result<[Item], Error>) -> Void) {
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
              completion(.failure(WebAPIError.unauthorized))
              return
        }
        
        let body = OrderID(orderID: orderID)
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/items/\(body.orderID)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            do {
                    if let error = error {
                      throw error
                    }
                      guard let httpResponse = response as? HTTPURLResponse else {
                        throw WebAPIError.invalidResponse
                      }
                      if !(200...299).contains(httpResponse.statusCode) {
                        throw WebAPIError.httpError(statusCode: httpResponse.statusCode)
                      }
                      guard let data = data,
                      let decoded = try? JSONDecoder().decode([Item].self, from: data)
                      else {
                        throw WebAPIError.unableToDecodeJSONData
                      }
                    completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
          }.resume()
    }
    
    
    // MARK: - PATCH ORDER STATUS
    static func changeStatus(id: UUID,
                             location: Location,
                             merchant_name: String,
                             app_name: String,
                             delivery_fee: Int,
                             checkpoint: String,
                             notes: String?,
                             active: Bool?,
                             status: String?,
                             updatedAt: String?,
                             createdAt: String?,
                             completion: @escaping (Result<Order, Error>) -> Void) {
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
              completion(.failure(WebAPIError.unauthorized))
              return
        }
        
        let body = Order(id: id, location: location, merchant_name: merchant_name, app_name: app_name, delivery_fee: delivery_fee, checkpoint: checkpoint, notes: notes, active: active, status: status, updatedAt: updatedAt, createdAt: createdAt)
        guard let jsonBody = try? JSONEncoder().encode(body) else {
          completion(.failure(WebAPIError.unableToEncodeJSONData))
          return
        }
        
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/changestatus")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
            do {
                let orderResponse: OrderResponse3 = try parseResponse(response, data: data, error: error)
                
                completion(.success(orderResponse.order))
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
    }
    
    // MARK: - PATCH ORDER ACTIVE
    static func changeActive(id: UUID,
                             location: Location,
                             merchant_name: String,
                             app_name: String,
                             delivery_fee: Int,
                             checkpoint: String,
                             notes: String?,
                             active: Bool?,
                             status: String?,
                             updatedAt: String?,
                             createdAt: String?,
                             completion: @escaping (Result<Order, Error>) -> Void) {
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
              completion(.failure(WebAPIError.unauthorized))
              return
        }
        
        let body = Order(id: id, location: location, merchant_name: merchant_name, app_name: app_name, delivery_fee: delivery_fee, checkpoint: checkpoint, notes: notes, active: active, status: status, updatedAt: updatedAt, createdAt: createdAt)
        guard let jsonBody = try? JSONEncoder().encode(body) else {
          completion(.failure(WebAPIError.unableToEncodeJSONData))
          return
        }
        
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/falseactive")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
            do {
                let orderResponse: OrderResponse3 = try parseResponse(response, data: data, error: error)
                
                completion(.success(orderResponse.order))
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
    }
    
    
    // MARK: - PATCH DELIVERY FEE
    static func changeDelivery(id: UUID,
                             location: Location,
                             merchant_name: String,
                             app_name: String,
                             delivery_fee: Int,
                             checkpoint: String,
                             notes: String?,
                             active: Bool?,
                             status: String?,
                             updatedAt: String?,
                             createdAt: String?,
                               completion: @escaping (Result<Order, Error>) -> Void) {
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
            completion(.failure(WebAPIError.unauthorized))
            return
        }
        
        let body = Order(id: id, location: location, merchant_name: merchant_name, app_name: app_name, delivery_fee: delivery_fee, checkpoint: checkpoint, notes: notes, active: active, status: status, updatedAt: updatedAt, createdAt: createdAt)
        guard let jsonBody = try? JSONEncoder().encode(body) else {
            completion(.failure(WebAPIError.unableToEncodeJSONData))
            return
        }
        
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/orders/deliveryFeeUpdate")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
            do {
                let orderResponse: OrderResponse3 = try parseResponse(response, data: data, error: error)
                
                completion(.success(orderResponse.order))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // MARK: - POST PAYMENT STC
    
    static func postStcPayments(
    phone : String? ,
        completion: @escaping (Result<StcPayments, Error>) -> Void) {
            
            // update access token from userDefault value
            if ((self.accessToken?.isEmpty) == nil) {
                accessToken = UserDefaults.standard.string(forKey: "accessToken")
            }
            guard let accessToken = self.accessToken
            else {
                          completion(.failure(WebAPIError.unauthorized))
                          return
            }
            let body = StcPayments(phone: phone )
            
            guard let jsonBody = try? JSONEncoder().encode(body) else {
              completion(.failure(WebAPIError.unableToEncodeJSONData))
              return
            }
            let session = URLSession.shared
            let url = URL(string: "\(baseURL)/api/stcpayments/create")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
              do {
                let stcPaymentsResponse: Stcpaymentsresponse = try parseResponse(response, data: data, error: error)

                  completion(.success(stcPaymentsResponse.stcPayments))
              } catch {
                completion(.failure(error))
              }
            }.resume()
            
        }

    // MARK: - GET PAYMENT STC
    
    static func getstcpayments(completion: @escaping (Result<StcPayments, Error>) -> Void){
        
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
                      completion(.failure(WebAPIError.unauthorized))
                      return
        }
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/stcpayments/stcpayment")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { (data, response, error) in
            do {
                let stcpaymentsresponse: Stcpaymentsresponse = try parseResponse(response, data: data, error: error)

                  completion(.success(stcpaymentsresponse.stcPayments))
                
            } catch {
              completion(.failure(error))
            }
          }.resume()
    }
    
    // MARK: - POST PAYMENT BANK
    
    static func postbankpayments(
        phone: String?,
         bname: String,
         iban: String,
         account: String?,
        completion: @escaping (Result<Bankpayments, Error>) -> Void) {
            
            // update access token from userDefault value
            if ((self.accessToken?.isEmpty) == nil) {
                accessToken = UserDefaults.standard.string(forKey: "accessToken")
            }
            guard let accessToken = self.accessToken
            else {
                          completion(.failure(WebAPIError.unauthorized))
                          return
            }
            let body = Bankpayments(phone: phone, bname: bname, iban: iban, account: account)
            
            guard let jsonBody = try? JSONEncoder().encode(body) else {
              completion(.failure(WebAPIError.unableToEncodeJSONData))
              return
            }
            let session = URLSession.shared
            let url = URL(string: "\(baseURL)/api/bankpayments/create")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
              do {
                let bankpaymentsresponse: Bankpaymentsresponse = try parseResponse(response, data: data, error: error)

                  completion(.success(bankpaymentsresponse.bankpayments))
              } catch {
                completion(.failure(error))
              }
            }.resume()
            
        }
    
    // MARK: - GET PAYMENT BANK
    
    static func getbankpayments(completion: @escaping (Result<Bankpayments, Error>) -> Void){
        
        // update access token from userDefault value
        if ((self.accessToken?.isEmpty) == nil) {
            accessToken = UserDefaults.standard.string(forKey: "accessToken")
        }
        guard let accessToken = self.accessToken
        else {
                      completion(.failure(WebAPIError.unauthorized))
                      return
        }
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)/api/bankpayments/bankpayment")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        session.dataTask(with: request) { (data, response, error) in
            do {
                let bankpaymentsresponse: Bankpaymentsresponse = try parseResponse(response, data: data, error: error)

                  completion(.success(bankpaymentsresponse.bankpayments))
                
            } catch {
              completion(.failure(error))
            }
          }.resume()
    }
    
    
    // MARK: - PATCH PHONE NUMBER
    
    static func PatchPhone(
        phone: String?,
        completion: @escaping (Result<Addphone, Error>) -> Void) {
            
            // update access token from userDefault value
            if ((self.accessToken?.isEmpty) == nil) {
                accessToken = UserDefaults.standard.string(forKey: "accessToken")
            }
            guard let accessToken = self.accessToken
            else {
                          completion(.failure(WebAPIError.unauthorized))
                          return
            }
            let body = Addphone(phone: phone)
            
            guard let jsonBody = try? JSONEncoder().encode(body) else {
              completion(.failure(WebAPIError.unableToEncodeJSONData))
              return
            }
            let session = URLSession.shared
            let url = URL(string: "\(baseURL)/api/users/me/addphone")!
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
              do {
                let addphoneresponse: Addphoneresponse = try parseResponse(response, data: data, error: error)

                  completion(.success(addphoneresponse.addphone))
              } catch {
                completion(.failure(error))
              }
            }
            .resume()
            
        }
    // MARK: - PATCH STC PAYMENT
    
    static func PatchStcpayments(
        phone: String?,
        completion: @escaping (Result<StcPayments, Error>) -> Void) {
            
            // update access token from userDefault value
            if ((self.accessToken?.isEmpty) == nil) {
                accessToken = UserDefaults.standard.string(forKey: "accessToken")
            }
            guard let accessToken = self.accessToken
            else {
                          completion(.failure(WebAPIError.unauthorized))
                          return
            }
            let body = StcPayments(phone: phone)
            
            guard let jsonBody = try? JSONEncoder().encode(body) else {
              completion(.failure(WebAPIError.unableToEncodeJSONData))
              return
            }
            let session = URLSession.shared
            let url = URL(string: "\(baseURL)/api/stcpayments/stcpayment")!
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
              do {
                let stcpaymentsresponse: Stcpaymentsresponse = try parseResponse(response, data: data, error: error)

                  completion(.success(stcpaymentsresponse.stcPayments))
              } catch {
                completion(.failure(error))
              }
            }
            .resume()
            
     
        }
    // MARK: - PATCH BANK PAYMENT
    static func PatchBankpayments(
     phone: String?,
     bname: String,
     iban: String,
     account: String?,
     completion: @escaping (Result<Bankpayments, Error>) -> Void) {
            
            // update access token from userDefault value
            if ((self.accessToken?.isEmpty) == nil) {
                accessToken = UserDefaults.standard.string(forKey: "accessToken")
            }
            guard let accessToken = self.accessToken
            else {
                          completion(.failure(WebAPIError.unauthorized))
                          return
            }
            
            let body = Bankpayments(phone: phone, bname: bname, iban: iban, account: account)
            
            guard let jsonBody = try? JSONEncoder().encode(body) else {
              completion(.failure(WebAPIError.unableToEncodeJSONData))
              return
            }
            let session = URLSession.shared
            let url = URL(string: "\(baseURL)/api/bankpayments/bankpayment")!
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.uploadTask(with: request, from: jsonBody) { (data, response, error) in
              do {
                let bankpaymentsresponse: Bankpaymentsresponse = try parseResponse(response, data: data, error: error)

                  completion(.success(bankpaymentsresponse.bankpayments))
              } catch {
                completion(.failure(error))
              }
            }
            .resume()
            
     
        }
}




// MARK: - error handling

extension WebAPI {

  static func parseResponse<T: Decodable>(_ response: URLResponse?, data: Data?, error: Error?) throws -> T {
    if let error = error {
      throw error
    }

    guard let httpResponse = response as? HTTPURLResponse else {
      throw WebAPIError.invalidResponse
    }

    if !(200...299).contains(httpResponse.statusCode) {
      throw WebAPIError.httpError(statusCode: httpResponse.statusCode)
    }

    guard let data = data, let decoded = try? JSONDecoder().decode(T.self, from: data) else {
      throw WebAPIError.unableToDecodeJSONData
    }
    return decoded
  }
}

struct UserLocation: Codable {
    let discription: String
    let long: Double
    let lat: Double
}

struct LocationResponse: Codable {
    let accessToken: String?
    let location: UserLocation
}

struct OrderReqBody: Codable {
    let merchant_name: String
    let app_name: String
    let delivery_fee: Int
    let checkpoint: String
    let notes: String?
    let active: Bool?
    let status: String?
}

struct OrderResponse: Codable {
    let accessToken: String?
    let order: OrderReqBody
}
 
struct StcPayments:  Codable {
    let phone : String?
}
struct Stcpaymentsresponse: Codable {
    let accessToken: String?
    let stcPayments: StcPayments
}

struct Bankpayments: Codable {
    let phone: String?
    let bname: String
    let iban: String
    let account: String?
    
}
struct Bankpaymentsresponse: Codable {
    let accessToken: String?
    let bankpayments: Bankpayments
}

struct Addphone: Codable {
    let phone: String?
}

struct Addphoneresponse: Codable {
    let accessToken: String?
    let addphone: Addphone
}
struct OrderID: Codable {
    let orderID: UUID
}

struct Order: Codable {
    let id: UUID
    let location: Location
    let merchant_name: String
    let app_name: String
    let delivery_fee: Int
    let checkpoint: String
    let notes: String?
    let active: Bool?
    let status: String?
    let updatedAt: String?
    let createdAt: String?
}

struct Location: Codable{
    let id: String
}

struct User: Codable{
    let id: String
}
struct OrderResponse2: Codable {
    let accessToken: String?
    let order: [Order]
}

struct Item: Codable {
    let item_name: String
    let price: Double
}

struct ItemResponse: Codable {
    let accessToken: String?
    let item: Item
}

struct ActiveOrderOutput: Codable {
    let joinedAt: String
    let id: String
    let type: String
    let order: Order
}

struct OrderResponse3: Codable {
    let accessToken: String?
    let order: Order
}


struct User_Order: Codable {
    let id: UUID
    let user: User
    let order: Order
    let type: String
    let joinedAt: String?
}


struct ActiveOrderResonse: Codable {
    let accessToken: String?
    let user_order: User_Order
}
