package com.phonegap.plugins.DevToDev;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DevToDev extends CordovaPlugin {

    private Map<String, String> JsonToMap(JSONObject jdata) throws JSONException {
        if(jdata == null){
            Log.d("DevToDev", "not a json");
            return null;
        }
        @SuppressWarnings ("unchecked")
        Iterator<String> nameItr = jdata.keys();
        Map<String, String> params = new HashMap<String, String>();
        while(nameItr.hasNext()) {
            String name = nameItr.next();
            params.put(name, jdata.getString(name));
        }
        return params;
    }
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        try{
            Log.d("DevToDev", action);
            if(action.equals("startSession")) {

            } else {
                Log.d("DevToDev", "invalid/na devtodev method: " + action);
                callbackContext.error("invalid devtodev method: " + action);
                return false;
            }
            callbackContext.success("");
            return true; 
        } catch (JSONException e){
            Log.d("DevToDev exception: ", e.getMessage());
            callbackContext.error("devtodev json exception: " + e.getMessage());
            return false;
        }
    }
    
    private void logEvent(String eventName, JSONObject options, boolean timed)  throws JSONException {
        if(options != null){
            Map<String, String> params = this.JsonToMap(options);
            if(params != null)
                FlurryAgent.logEvent(eventName, params, timed);
        }else{
            FlurryAgent.logEvent(eventName, timed);
        }
    }   
}