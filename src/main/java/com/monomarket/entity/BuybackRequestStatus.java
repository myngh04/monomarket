package com.monomarket.entity;

// Các trạng thái trong vòng đời một Buyback request. 
public enum BuybackRequestStatus {
    PENDING,
    RECEIVED,
    TESTING,
    PRICED,
    USER_ACCEPTED,
    USER_DECLINED,
    PAID,
    STOCKED,
    REJECTED
}
