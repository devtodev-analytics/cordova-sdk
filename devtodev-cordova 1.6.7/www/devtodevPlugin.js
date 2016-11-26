(function(window) {
    var cordova = window.cordova || window.Cordova || window.PhoneGap;

    // helper function to prevent Objective C bleed over into javascript
    function bool2ObjC(value) {
      if(value === true) {
        return 'YES';
      } else if(value === false) {
        return 'NO'
      }

      return value.toUpperCase();
    }


    function devtodev() {};

    // Debug mode
    devtodev.prototype.setActiveLog = function(logEnabled,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setActiveLog', [bool2ObjC(logEnabled)]);
    };

    // Initialize DevToDev. Call this function first
    devtodev.prototype.init = function(appKey,appSecret,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'init', [appKey, appSecret]);
    };

    //Basic methods
    devtodev.prototype.sendBufferedEvents = function(successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'sendBufferedEvents');
    };

    devtodev.prototype.tutorialCompleted = function(tutorialStep,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'tutorialCompleted', [tutorialStep]);
    };

    devtodev.prototype.levelUp = function(level,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'levelUp', [level]);
    };

    devtodev.prototype.levelUp = function(level,resources,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'levelUp', [level, resources]);
    };

    devtodev.prototype.realPayment = function(transactionId,productPrice,productName,transactionCurrencyISOCode,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'realPayment', [transactionId, productPrice, productName, transactionCurrencyISOCode]);
    };

    devtodev.prototype.socialNetworkConnect = function(socialNetwork,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'socialNetworkConnect', [socialNetwork]);
    };

    devtodev.prototype.socialNetworkPost = function(socialNetwork,reason,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'socialNetworkPost', [socialNetwork,reason]);
    };

    devtodev.prototype.inAppPurchase = function(purchaseId,purchaseType,purchaseAmount,purchasePrice,purchaseCurrency,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'inAppPurchase', [purchaseId,purchaseType,purchaseAmount,purchasePrice,purchaseCurrency]);
    };

    devtodev.prototype.inAppPurchaseWithResources = function(purchaseId,purchaseType,purchaseAmount,purchaseResources,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'inAppPurchase', [purchaseId,purchaseType,purchaseAmount,purchaseResources]);
    };

    devtodev.prototype.customEvent = function(eventName,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'customEvent', [eventName]);
    };

    devtodev.prototype.customEvent = function(eventName,parameters,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'customEvent', [eventName, parameters]);
    };

    devtodev.prototype.currencyAccrual = function(amount,currencyName,accrualType,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'currencyAccrual', [amount, currencyName, accrualType.toLowerCase()]);
    };

    //Secondary methods
    devtodev.prototype.setUserId = function(userId,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setUserId', [userId]);
    };

    devtodev.prototype.getUserId = function(successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'getUserId');
    };

    devtodev.prototype.replaceUserId = function(fromUserId,toUserId,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'replaceUserId', [fromUserId,toUserId]);
    };

    devtodev.prototype.getSdkVersion = function(eventName,successCallback,failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'getSdkVersion', []);
    };

    devtodev.prototype.setCurrentLevel = function(level, successCallback, failureCallback) {
        return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setCurrentLevel', [level]);
    };

    //Push methods
    devtodev.prototype.registerForPushNotification = function(onPushTokenReceived,onPushTokenError) {
        return cordova.exec(onPushTokenReceived,onPushTokenError, 'DevToDevPlugin', 'registerForPushNotification', []);
    }

    devtodev.prototype.notificationCallback = function(notification) {
        var pushEvent = document.createEvent('HTMLEvents');
        pushEvent.initEvent('onPushReceived', true, true, notification);
        document.dispatchEvent(pushEvent);
    };

    devtodev.install = function() {
        if (!window.plugins) {
            window.plugins = {};
        }
        window.plugins.devtodev = new devtodev();
    };

    cordova.addConstructor(devtodev.install);

})(typeof global === "object" ? global : window);