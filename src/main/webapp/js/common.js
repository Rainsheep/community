//����
$(function () {
    $("ul.nav0 li.sub").hover(function () {
        $("ul.nav0 li.sub .subNav").stop(false, true);
        $(this).find(".subNav").slideDown(800);
    }, function () {
        $("ul.nav0 li.sub .subNav").stop(false, true);
        $(this).find(".subNav").slideUp(400);
    });
});

//ƽ�嵼��
$(function () {
    $('.meun-nav').click(function () {
        if ($('.meunCont').is(':hidden')) {
            $('.meunCont').slideDown('800');
        } else {
            $('.meunCont').slideUp('800');
        }
    });
});
//�ֻ�����
$(document).ready(function () {
    $(".report").click(function () {
        var hh = $('.menu_item li').length;
        if (hh < 0) {
            $('.menu-fl').hide(500);
        }

        if (hh > 0) {
            $(".menu-fl").show().animate({left: "0"}, 500);
        }
    });
});
// ���ض���
$(function () {
    showScroll();

    function showScroll() {
        $(window).scroll(function () {
                var scrollValue = $(window).scrollTop();
                scrollValue > 10 ? $('div[class=fix-nav]').fadeIn() : $('div[class=fix-nav]').fadeOut();
            }
        );
        $('#fix-nav').click(function () {
                $("html,body").animate({
                        scrollTop: 0
                    }
                    , 500);
            }
        );
    }
});
// �ֻ����� 
$(".search-mobile").click(function () {
    $(".search").toggle(300);
});
// ����ѡ�� 
$(".language").click(function () {
    $(".language-list").toggle(300);
});

//������֤
function check() {
    var name = document.form.name;
    var email = document.form.email;
    var phone = document.form.phone;
    var cont = document.form.cont;
    if (name.value == '') {
        alert('Please fill in your name!');
        name.focus();
        return false;
    }
    if (email.value == '') {
        alert('Please fill in your e-mail!');
        email.focus();
        return false;
    }
    if (phone.value == '') {
        alert('Please fill in your phone!');
        phone.focus();
        return false;
    }
    if (cont.value == '') {
        alert('Please fill in the content of your message!');
        cont.focus();
        return false;
    }
}