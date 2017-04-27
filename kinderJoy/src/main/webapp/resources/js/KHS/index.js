'use strict';

var App = React.createClass({
	displayName: 'App',

	getInitialState: function getInitialState() {
		return this.getDate();
	},
	getDate: function getDate() {
		var newdate = new Date();
		var date = {};

		date.hours = newdate.getHours();
		date.minutes = newdate.getMinutes();
		date.seconds = newdate.getSeconds();

		return date;
	},
	updateDate: function updateDate() {
		this.setState(this.getDate());
	},
	renderDate: function renderDate() {
		var secondOffset = date.seconds / 60 * 100 + '%';
		var minuteOffset = date.minutes / 60 * 100 + '%';
		var hourOffset = date.hours / 24 * 100 + '%';

		var secondopacity = date.seconds / 60 * 100 / 100;
		var minuteopacity = date.minutes / 60 * 100 / 100;
		var houropacity = date.hours / 24 * 100 / 100;
	},
	componentDidMount: function componentDidMount() {
		var that = this;
		setInterval(function () {
			that.updateDate();
		}, 1000);
	},
	render: function render() {
		return React.createElement(
			'div',
			{ className: 'App' },
			React.createElement(Marker, { type: 'hours', time: this.state.hours }),
			React.createElement(Marker, { type: 'minutes', time: this.state.minutes }),
			React.createElement(Marker, { type: 'seconds', time: this.state.seconds }),
			React.createElement(
				'div',
				{ className: 'text-overlay' },
				React.createElement(Timer, { type: 'hours', time: this.state.hours }),
				React.createElement(Timer, { type: 'minutes', time: this.state.minutes }),
				React.createElement(Timer, { type: 'seconds', time: this.state.seconds })
			)
		);
	}
});

var Marker = React.createClass({
	displayName: 'Marker',

	render: function render() {
		switch (this.props.type) {
			case 'hours':
				var measurement = 24;
				break;
			case 'minutes':
				var measurement = 60;
				break;
			case 'seconds':
				var measurement = 60;
				break;
		}

		var offset = this.props.time / measurement * 100 + '%';
		var opacity = this.props.time / measurement * 100 / 100;

		var columnClasses = 'Column Column--' + this.props.type;
		var typeClasses = 'Marker Marker--' + this.props.type;
		return React.createElement(
			'div',
			{ className: columnClasses },
			React.createElement('div', { className: typeClasses, style: { height: offset, opacity: opacity } })
		);
	}
});

var Timer = React.createClass({
	displayName: 'Timer',

	render: function render() {
		if (this.props.time < 10) {
			var time = '0' + this.props.time;
		} else {
			var time = this.props.time;
		}
		return React.createElement(
			'div',
			{ className: this.props.type },
			time
		);
	}
});

ReactDOM.render(React.createElement(App, null), document.getElementById('app'));