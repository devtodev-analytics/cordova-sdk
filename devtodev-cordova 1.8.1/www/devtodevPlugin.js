cordova.define("com.phonegap.plugins.devtodev.DevToDevPlugin", function(require, exports, module) {
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


        function devtodev() {

        };

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

        devtodev.prototype.startProgressionEvent = function(eventName, startParameters, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'startProgressionEvent', [eventName, startParameters]);
        };

        devtodev.prototype.endProgressionEvent = function(eventName, endParameters, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'endProgressionEvent', [eventName, endParameters]);
        };

        devtodev.prototype.currencyAccrual = function(amount,currencyName,accrualType,successCallback,failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'currencyAccrual', [amount, currencyName, accrualType.toLowerCase()]);
        };

        devtodev.prototype.referrer = function(parameters, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'referrer', [parameters]);
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

        //User
     
        function user() {
     
        }
     
        user.prototype.name = function(nameString, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setName', [nameString]);
        };

        user.prototype.cheater = function(isCheater, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setCheater', [bool2ObjC(isCheater)]);
        };

        user.prototype.age = function(age, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setAge', [age]);
        };

        user.prototype.gender = function(gender, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setGender', [gender]);
        };

        user.prototype.email = function(email, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setEmail', [email]);
        };

        user.prototype.phone = function(phone, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setPhone', [phone]);
        };

        user.prototype.photo = function(photo, successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setPhoto', [photo]);
        };

        user.prototype.set = function(key, value, successCallback, failureCallback) {
            if (key instanceof Object) {
                return cordova.exec(value, successCallback, 'DevToDevPlugin', 'setUserData', [key]);
            }
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'setUserData', [{key : value}]);
        };

        user.prototype.unset = function(key, successCallback, failureCallback) {
            if (key instanceof Array) {
                return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'unsetUserData', [key]);
            }
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'unsetUserData', [[key]]);
        };

        user.prototype.clear = function(successCallback, failureCallback) {
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'clearUserData', []);
        };

        user.prototype.increment = function(key, value, successCallback, failureCallback) {
            if (key instanceof Object) {
                return cordova.exec(value, successCallback, 'DevToDevPlugin', 'incrementUserData', [key]);
            }
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'incrementUserData', [{key : value}]);
        };

        user.prototype.append = function(key, value, successCallback, failureCallback) {
            if (key instanceof Object) {
                return cordova.exec(value, successCallback, 'DevToDevPlugin', 'appendUserData', [key]);
            }
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'appendUserData', [{key : value}]);
        };

        user.prototype.union = function(key, value, successCallback, failureCallback) {
            if (key instanceof Object) {
                return cordova.exec(value, successCallback, 'DevToDevPlugin', 'unionUserData', [key]);
            }
            return cordova.exec(successCallback, failureCallback, 'DevToDevPlugin', 'unionUserData', [{key : value}]);
        };

        //Push methods
        devtodev.prototype.registerForPushNotification = function(onPushTokenReceived,onPushTokenError) {
            return cordova.exec(onPushTokenReceived,onPushTokenError, 'DevToDevPlugin', 'registerForPushNotification', []);
        };

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
            window.plugins.devtodev.user = new user();
        };

        cordova.addConstructor(devtodev.install);

    })(typeof global === "object" ? global : window);
});
