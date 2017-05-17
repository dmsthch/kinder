(function($) {
    $.fn.multiselect = function(options) {
		var opt = $.extend({
			removeIcon: '<span>&nbsp;&#x2716;</span>',
			width: 'auto',
			onSelect: function () {},
			onUnselect: function () {}
		}, options);
		var element = this;
		var items = $(element).children('option');
		var wrapper = $('<div class="multiselect-wrapper"></div>');
		var box = $('<div class="multiselect-box"></div>');
		var list = $('<div class="multiselect-list"></div>');

		function initMultiselect() {
			$(wrapper).append($(list), $(box));
			$(element).hide().after($(wrapper));
			if (opt.width != 'auto') {
				$(wrapper).css('width', opt.width);
			}
			generateList();
		}

		function generateList() {
			var opt_list = '';
			var box_list = '';

			$(items).each(function(idx) {
				if ($(this).attr('selected') == 'selected') {
					box_list += '<a href="" class="multiselect-box-item" num="' + idx + '">' + $(this).text() + opt.removeIcon + '</a>';
				} else {
					opt_list += '<a href="" class="multiselect-list-item" num="' + idx + '">' + $(this).text() + '</a>';
				}
			});

			if (box_list != '') {
				$(box).removeClass('empty');
			} else {
				$(box).addClass('empty');
			}

			if (opt_list != '') {
				$(list).removeClass('empty');
			} else {
				$(list).addClass('empty');
			}

			$(box).html(box_list);
			$(box).children('.multiselect-box-item').bind('click', removeItem);
			$(list).html(opt_list);
			$(list).children('.multiselect-list-item').bind('click', addItem);
		}

		function addItem(e) {
			var item = $(items).filter('option:eq(' + $(this).attr('num') + ')');
			e.preventDefault();
			item.attr("selected", "selected");
			generateList();
			opt.onSelect(item);
		}

		function removeItem(e) {
			var item = $(items).filter('option:eq(' + $(this).attr('num') + ')');
			e.preventDefault();
			item.removeAttr('selected');
			generateList(item);
			opt.onUnselect(item);
		}

		initMultiselect();
	};
})(jQuery);