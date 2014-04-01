var exec = require('cordova/exec');

function NativeShare() {};

NativeShare.prototype = {
	share : function(content, success, fail){
		exec(success, fail, "NativeShare", "share", [content]);
	}
};

module.exports = new NativeShare();