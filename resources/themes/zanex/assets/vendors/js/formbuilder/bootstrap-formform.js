/*
 * Bootstrap-FormForm
 * Christian Bergmiller 2015
 * https://github.com/cbergmiller/bootstrap-formform
 *
 * fields = [
 *    {
 * 		name: '',
 * 		label: '',
 * 		type: 'select',
 * 		'class': '',
 * 		id: null,
 * 		appendLabel: '',
 * 		default: '',
 * 		choices: []
 *    }
 * ];
*/

var FormForm = (function($) {
	return function(dom, fields) {
		var self = {};

		self.isHorizontal = false;
		self.col1 = 4;
		self.col2 = 8;
		self.fields = fields;
		self.dom = dom;
		self.templates= {
			group: _.template(
				'<div class="form-group" data-id="<%= data.field.id %>">\
					<label for="form_element_<%= data.id %>"><%- data.field.label %></label>\
					<%= data.renderedData %>\
					<span class="help-block"></span>\
				</div>', {variable: 'data'}),
			horizontalGroup: _.template(
				'<div class="form-group" data-id="<%= data.field.id %>">\
					<label class="col-sm-<%= data.col1 %> control-label" for="form_element_<%= data.id %>"><%- data.field.label %></label>\
					<div class="col-sm-<%= data.col2 %>">\
						<%= data.renderedData %>\
					</div>\
					<div class="col-sm-<%= data.col1 %>"></div>\
					<div class="col-sm-<%= data.col2 %>">\
						<span class="help-block" style="margin: 0"></span>\
					</div>\
				</div>', {variable: 'data'}),
			horizontalOffsetGroup: _.template(
				'<div class="form-group" data-id="<%= data.field.id %>">\
					<div class="col-sm-offset-<%= data.col1 %> col-sm-<%= data.col2 %>">\
						<%= data.renderedData %>\
					</div>\
				</div>', {variable: 'data'}),
			select: _.template(
				'<select name="<%= data.name %>[]" class="form-control" data-id="<%= data.id %>" id="form_element_<%= data.id %>"></select>'
				, {variable: 'data'}),
			selectmultiple: _.template(
				'<select multiple="multiple" class="form-control" maxlength="<%= data.length %>" name="<%= data.name %>[]" data-id="<%= data.id %>" id="form_element_<%= data.id %>"  <%= data.required %> ></select>'
				, {variable: 'data'}),
			input: _.template(
				'<input type="<%= data.type %>" value="<%= data.default %>" name="<%= data.name %>" maxlength="<%= data.length %>" class="form-control" data-id="<%= data.id %>" id="form_element_<%= data.id %>" <%= data.required %> placeholder="<%= data.placeholder %>"/>'
				, {variable: 'data'}),
			textarea: _.template(
				'<textarea name="<%= data.name %>" class="form-control" data-id="<%= data.id %>" id="form_element_<%= data.id %>" placeholder="<%= data.placeholder %>" rows="4"></textarea>'
				, {variable: 'data'}),
			file: _.template(
				'<div class="controls" style="height: 34px;">\
					<div class="fileinput <% if (data.value) { %>fileinput-exists<% } else { %>fileinput-new<% } %>" data-provides="fileinput">\
						\
						<div class="input-group">\
							<span class="input-group-addon btn btn-grey btn-file">\
								<span class="fileinput-exists">\
									<span class="glyphicon glyphicon-file" style="margin-right: 0"></span>\
								</span>\
								<input type="hidden"  name="hidden_multiple_file_upload[]" value="<%= data.name %>" multiple>\
								<input type="file" data-id="<%= data.id %>" id="form_element_<%= data.id %>" name="<%= data.name %>[]" multiple>\
							</span>\
						</div>\
					</div>\
				</div>', {variable: 'data'}),
			filedoc: _.template(
				'<div class="controls" style="height: 34px;">\
					<div class="fileinput <% if (data.value) { %>fileinput-exists<% } else { %>fileinput-new<% } %>" data-provides="fileinput">\
						\
						<div class="input-group">\
							<span class="input-group-addon btn btn-grey btn-file">\
								<span class="fileinput-exists">\
									<span class="glyphicon glyphicon-file" style="margin-right: 0"></span>\
								</span>\
								<input type="hidden"  name="hidden_multiple_file_doc_upload[]" value="<%= data.name %>" multiple>\
								<input type="file" id="form_element_<%= data.id %>" name="<%= data.name %>[]" multiple>\
							</span>\
						</div>\
					</div>\
				</div>', {variable: 'data'}),
			options: _.template(
				'<% _.each(choices, function(choice) { %>\
					<option value="<%= choice[0] %>"><%- choice[1] %></option>\
				<% }) %>', {variable: 'choices'}),
			optGroups: _.template(
				'<% _.each(choices, function(optgroup) { %>\
					<optgroup label="<%- optgroup[0] %>">\
						<% _.each(optgroup[1], function(choice) { %>\
							<option value="<%= choice[0] %>"><%- choice[1] %></option>\
						<% }) %>\
					</optgroup>\
				<% }) %>', {variable: 'choices'}),
			checkbox: _.template(
				'<div class="checkbox">\
					<label>\
						<input type="checkbox" data-id="<%= data.name %>" name="<%= data.name %>" <% if (data.value){ %>checked="checked"<% } %>> <%- data.label %>\
					</label>\
				</div>', {variable: 'data'}),
			button: _.template(
				'<button data-id="<%= data.name %>" type="<%= data.type %>" class="btn <%= data.class %>">\
					<% if (data.icon) { %><span class="glyphicon glyphicon-<%= data.icon %>"></span><% } %>\
					<span><%- data.label %></span>\
				</button>', {variable: 'data'})
		}; // ToDo: addon

		self.typeConfig = {
			text: {
				template: self.templates.input,
				value: true
			},
			password: {
				template: self.templates.input,
				value: true
			},
			number: {
				template: self.templates.input,
				value: true
			},
			color: {
				template: self.templates.input,
				value: true
			},
			date: {
				template: self.templates.input,
				value: true
			},
			datetimelocal: {
				template: self.templates.input,
				value: true
			},
			email: {
				template: self.templates.input,
				value: true
			},
			hidden: {
				template: self.templates.input,
				value: true
			},
			imagebutton: {
				template: self.templates.input,
				value: true
			},
			month: {
				template: self.templates.input,
				value: true
			},
			range: {
				template: self.templates.input,
				value: true
			},
			tel: {
				template: self.templates.input,
				value: true
			},
			time: {
				template: self.templates.input,
				value: true
			},

			textarea: {
				template: self.templates.textarea,
				value: true
			},
			checkboxinput: {
				template: self.templates.checkbox
			},
			select: {
				template: self.templates.select,
				value: true
			},
			selectmultiple: {
				template: self.templates.selectmultiple,
				value: true
			},
			select2: {
				template: self.templates.select,
				value: true,
				select2: true
			},
			selectmultiple2: {
				template: self.templates.selectmultiple,
				value: true,
				select2: true
			},
			button: {
				template: self.templates.button
			},
			submit: {
				template: self.templates.button
			},
			file: {
				template: self.templates.file
			},
			filedoc: {
				template: self.templates.filedoc
			},
		};

		/**
		 * Render the Form and attach it to the DOM.
		 */
		self.render = function() {
			self._renderFields();
			self._renderButtons();
		};

		/**
		 * Render all buttons and attach them to the DOM.
		 * @private
		 */
		self._renderButtons = function() {
			var renderedButtons = '';

			_.each(self.fields, function(field) {
				if ( !_.contains( ['button', 'submit'], field.type ) ) return;
				renderedButtons += self.templates.button(field);
			});
			if (self.isHorizontal) {
				renderedButtons = self.templates.horizontalOffsetGroup({
					renderedData: renderedButtons,
					col1: self.col1,
					col2: self.col2
				})
			}
			self.dom.append(renderedButtons);
		};

		/**
		 * Render all form-fields and attach them to the DOM.
		 * @private
		 */
		self._renderFields = function() {
			_.each(self.fields, function(field) {
				var formField,
					inputTemplate,
					groupTemplate,
					typeConfig;

				// skip buttons
				if ( _.contains( ['button', 'submit'], field.type ) ) return;

				typeConfig = self.typeConfig[field.type];
				if (!field.id) field.id = _.uniqueId();
				inputTemplate = self._getInputTemplate(field);
				groupTemplate = self._getGroupTemplate(field);
				formField = $(
					groupTemplate({
						field: field,
						renderedData: inputTemplate(field),
						col1: self.col1,
						col2: self.col2
					})
				);
				// Select-Optionen Rendern
				if ( field.choices ) self._renderChoices(formField, field);
				// Initialen Wert setzten
				if ( _.has(field, 'value') && typeConfig.value ) {
					formField.find('input, select, textarea').val(field.value);
				}
				self.dom.append(formField);
				if ( typeConfig.select2 ) {
					formField.find('select').select2({theme: 'bootstrap'});
				}
			});
		};

		/**
		 * Get the matching template for a form-field.
		 */
		self._getInputTemplate = function(field) {
			if (self.typeConfig[field.type]) {
				return self.typeConfig[field.type].template
			} else {
				throw 'Unkown field type: ' + field.type;
			}
		};

		/**
		 * Get the matching template for a form-group.
		 */
		self._getGroupTemplate = function(field) {
			if ( field.type == 'checkbox') {
				if (self.isHorizontal) {
					return self.templates.horizontalOffsetGroup
				} else {
					return function(field) {
						return field.renderedInput
					}
				}
			} else if (self.isHorizontal) {
				return self.templates.horizontalGroup
			} else {
				return self.templates.group
			}
		};

		/*
		 * Render options for a select-box
		 */
		self._renderChoices = function (formField, field) {
			var select;

			select = formField.find('select');
			if ( _.isArray( field.choices[0][1] ) ) {
				select.html(self.templates.optGroups(field.choices));
			} else {
				select.html(self.templates.options(field.choices));
			}
		};

		/**
		 * Get the field config object by name.
		 */
		self.getFieldByName = function(name) {
			return _.find( self.fields, function(field) {
				return field.name == name
			})
		};

		/*
		 * Reset the form to default values.
		 */
		self.reset = function() {

		};

		/*
		 * Setze alle Formularfelder auf die Werte aus dem Objekt.
		 */
		self.update = function(obj) {

		};

		return self
	};
})(jQuery);
