//
//  ClientError.swift
//  LeoCalculator
//
//  Created by Can Kurtur on 5.05.2023.
//

import LeoNetworking

public class ClientError: APIError {
    public var message: String
    public var statusCode: Int?
}
