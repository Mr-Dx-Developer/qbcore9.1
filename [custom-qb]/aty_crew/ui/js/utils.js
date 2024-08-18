function sleep(ms) {
	return new Promise((resolve) => setTimeout(resolve, ms))
}

function epochToDate(timestamp) {
	const pad = (n, s = 2) => `${new Array(s).fill(0)}${n}`.slice(-s)
	const date = new Date(parseInt((timestamp + "000").slice(0, 13)))

	return `${pad(date.getDate())}/${pad(date.getMonth() + 1)}/${pad(date.getFullYear(), 4)}`
}

function isObject(object) {
	return typeof object === "object"
}

function isObjectEmpty(object) {
	return Object.keys(object).length == 0
}

function areObjectsEqual(obj1, obj2) {
	if (!isObject(obj1) || !isObject(obj2)) return false

	let props1 = Object.getOwnPropertyNames(obj1)
	let props2 = Object.getOwnPropertyNames(obj2)

	if (props1.length != props2.length) return false

	for (let i = 0; i < props1.length; i++) {
		let val1 = obj1[props1[i]]
		let val2 = obj2[props1[i]]

		let isObjects = isObject(val1) && isObject(val2)

		if ((isObjects && !areObjectsEqual(val1, val2)) || (!isObjects && val1 !== val2)) return false
	}

	return true
}

function areArraysEqual(arr1, arr2) {
	return JSON.stringify(arr1) == JSON.stringify(arr2)
}
