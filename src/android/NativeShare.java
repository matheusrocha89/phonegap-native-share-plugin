package org.apache.cordova.util;


import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Intent;

public class NativeShare extends CordovaPlugin {
    private static final String SHARE = 'share';

	@Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

    	if (action.equals(SHARE)) {
    		share(args[0], callbackContext);
			return true;
    	}

		return false;
    }

	private void share(String message, callbackContext) {
        if (message != null && message.length() > 0) {
            Intent sendIntent = new Intent(android.content.Intent.ACTION_SEND);
            sendIntent.setType("text/plain");
            sendIntent.putExtra(android.content.Intent.EXTRA_TEXT, message);
            this.cordova.startActivityForResult(this, sendIntent, 0);
            callbackContext.success(message);
        } else {
            callbackContext.error('No string argument passed');
        }
	}
}
