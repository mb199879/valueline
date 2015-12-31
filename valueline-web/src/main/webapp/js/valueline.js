String.prototype.format = function() {
	var args = $.makeArray(arguments);
	return this.replace(/\{(\d+)\}/g, function(match, p1) {
		return args[parseInt(p1)];
	});
};

$.extend(UIkit.modal.labels, {
	Ok: "确定",
	Cancel: "取消"
});

var global_page_size = 10;

function errorHandler() {
	UIkit.notify("发生错误，请刷新页面重试", {
		status: "danger"
	});
}

function ajax(options) {
	$.ajax({
		type: "POST",
		url: options.url,
		data: options.params,
		success: options.success,
		error: options.error || errorHandler,
		complete: options.complete || $.noop,
		dataType: "json"
	});
}

function scsAjax(options) {
	$.ajax({
		type: "POST",
		url: "/SCS" + options.url,
		data: JSON.stringify($.extend(options.params, {
			app: 12
		})),
		success: options.success,
		error: options.error || errorHandler,
		complete: options.complete || $.noop,
		contentType: "application/json",
		dataType: "json"
	});
}

function imageUploadSelect(options) {
	var progress = options.progress;
	var progressBar = progress.children(".uk-progress-bar");
	UIkit.uploadSelect(options.trigger, {
		action: "/valueline/upload",
		param: "attachment",
		type: "json",
		allow: "*.(jpg|jpeg|gif|png)",
		notallowed: function(file, settings) {
			UIkit.notify("仅支持如下类型的文件：{0}".format(settings.allow), {
				status: "warning"
			});
		},
		loadstart: function() {
			progress.removeClass("uk-hidden");
		},
		progress: function(percent) {
			progressBar.css("width", Math.ceil(percent) + "%");
		},
		loadend: function() {
			progressBar.css("width", "100%");
			setTimeout(function() {
				progress.addClass("uk-hidden");
				progressBar.css("width", "0%");
			}, 250);
		},
		complete: options.complete
	});
}

function addressHandler(event) {
	$.each(event.data, function() {
		this.children().slice(1).remove();
	});
	var id = $(this).children(":selected").data("id");
	if (id != undefined)
		scsAjax({
			url: "/UtiDomain/SelectProvince",
			params: {
				PID: id
			},
			success: function(data) {
				var select = event.data[0];
				if (data.resultCode >= 0)
					$.each(data.resultValue, function() {
						select.append("<option value='{1}' data-id='{0}'>{2}</option>".format(this.ID, this.VALUE, this.NAME));
					});
				else
					UIkit.notify(data.resultHint, {
						status: "danger"
					});
			}
		});
}