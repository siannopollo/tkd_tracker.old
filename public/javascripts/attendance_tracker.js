var AttendanceTracker = new Class({
	initialize: function() {
		this.checkboxes = $$('input[type="checkbox"]')
		this.form = $('attendance_form')
		
		this.checkboxes.invoke('addEvent', 'change', this.onChange.bind(this))
		this.form.addEvent('submit', this.onSubmit.bind(this))
		
		this.checkedBoxes = []
		this.cookieName = 'attendance'
		
		this.readCookie()
	},
	
	onChange: function(event) {
		var checkbox = event.target
		if (checkbox.checked) this.checkedBoxes.push(checkbox)
		else {
			if (this.checkedBoxes.contains(checkbox)) {
				var index = this.checkedBoxes.indexOf(checkbox)
				this.checkedBoxes.splice(index,1)
			}
		}
		
		this.switchColor(checkbox)
		
		this.writeCookie()
	},
	
	onSubmit: function(event) {
		Cookie.dispose(this.cookieName)
	},
	
	readCookie: function() {
		var cookie = Cookie.read(this.cookieName)
		if (!cookie) return
		
		var ids = JSON.decode(cookie)
		ids.each(function(id) {
			var checkbox = $(id)
			checkbox.checked = true
			this.checkedBoxes.push(checkbox)
			this.switchColor(checkbox)
		}.bind(this))
	},
	
	switchColor: function(checkbox) {
		var parent = checkbox.getParent()
		var unchecked_color = parent.getParent().getStyle('background-color')
		var color = checkbox.checked ? 'green' : unchecked_color
		parent.setStyle('background-color', color)
	},
	
	writeCookie: function() {
		var ids = this.checkedBoxes.map(function(checkbox) {
			return checkbox.id;
		})
		
		Cookie.write(this.cookieName, JSON.encode(ids))
	}
})
