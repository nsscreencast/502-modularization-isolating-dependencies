import Foundation
import Store

typealias SendNotificationBlock = (Notification.Name, AnyObject?) -> Void

struct World {
    var sendNotification: SendNotificationBlock
    var calendar: Calendar
    var clock: () -> Date
    var mealStore: MealStore
}

let sendNotification: SendNotificationBlock = { notification, obj in
    NotificationCenter.default.post(name: notification, object: obj)
}

let calendar = Calendar.autoupdatingCurrent
let clock: () -> Date = Date.init

var CurrentEnvironment = World(
    sendNotification: sendNotification,
    calendar: calendar,
    clock: clock,
    mealStore: MealStore(
        storage: .filename("meals.json"),
        calendar: calendar,
        sendNotification: sendNotification
    )
)
