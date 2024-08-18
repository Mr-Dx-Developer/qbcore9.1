var open = false;
$('#panel').fadeOut(0);

function checkElement(settings, element, settingName) {
    if (settings[settingName] == true) {
        $(element).parent().addClass('active');
    }
    else {
        $(element).parent().removeClass('active');
    }
}

$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.type == "EnableCrosshairMenu") {
            open = event.data.enable;
            if (open) {
                document.body.style.display = "block";
                setTimeout(function(){
                    $('#panel').fadeIn(500);
                }, 1);
            }
            else {
                $('#panel').fadeOut(500);
                setTimeout(function(){
                    document.body.style.display = "none";
                }, 500);
            }
        }

		if (event.data.type == "DisplayCrosshair") {
			state = event.data.enable;
            // console.log('1')
			if (state) {
                document.body.style.display = "block";
                $('#panel').hide();
				$(".style"+event.data.style).show();
			} else {
                document.body.style.display = "none";
				$(".style"+event.data.style).hide()
			}
		}
    });

    $('.crosshair').on('click', function() {
        if ($(this).parent().hasClass('disabled')) return;
        var crosshairIndex = $(this).attr('value');
        $.post('http://qb-crosshair/setCrosshair', JSON.stringify({
			crosshairIndex: crosshairIndex
            })
        );
    });

    document.onkeyup = function (data) {
        if (open) {
            // data.getModifierState("Shift") &&
            if ((
                data.which == 90) ||
                data.which == 27
            ) {
                // Z or Esc
                $.post('http://qb-crosshair/escape', JSON.stringify({}));
            }
        }
    };
});