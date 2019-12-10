/*

*/

function _DateTime_localNumericDateTime() {
	return new Intl.DateTimeFormat(undefined, {
		year: 'numeric',
		month: 'numeric',
		day: 'numeric',
		hour: 'numeric',
		minute: 'numeric'
	});
}

var _DateTime_format = F2(function (dateTimeFormat, value) {
	return dateTimeFormat.format(value);
});
