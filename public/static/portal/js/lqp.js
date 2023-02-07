(function ($, window, undefined) {
    let host = window.location.host;
    let prefix = '';
    if (host === 'localhost' || '192.168.0.200') {
        prefix = '/hb-shortVideo';
    }

   let checkMobile = function (){
       if (
           /AppleWebKit.*Mobile/i.test(navigator.userAgent) ||
           /MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/.test(
               navigator.userAgent
           )
       ) {
           if (window.location.href.indexOf("?mobile") < 0) {
               try {
                   if (
                       /Android|Windows Phone|webOS|iPhone|iPod|BlackBerry|iPad/i.test(
                           navigator.userAgent
                       )
                   ) {
                       console.log('手机')
                       // $('.home-banner').addClass('bannerHeight-mobil').removeClass('bannerHeight-web')
                       $('.contact-me').removeClass('position-absolute end-0 content-card')
                       $('.home-header-color').addClass('home-header-mobile').removeClass('home-header-web')
                   }
               } catch (e) {
                   console.log('这是')
               }
           }
       }else{
           console.log('web')
           // $('.home-banner').removeClass('bannerHeight-mobil').addClass('bannerHeight-web')
           $('.contact-me').addClass('position-absolute end-0 content-card')
           $('.home-header-color').addClass('home-header-web').removeClass('home-header-mobile')
       }
   }

   checkMobile();
 // 滚动条
    let scrollBar = function () {
        let scroll_top = 0;
        if (document.documentElement && document.documentElement.scrollTop) {
            scroll_top = document.documentElement.scrollTop;
        } else if (document.body) {
            scroll_top = document.body.scrollTop;
        }
        console.log('滚动条高度', scroll_top)
        if (scroll_top > 70) {
            $('.home-top').addClass('bg-dark');
        } else {
            $('.home-top').removeClass('bg-dark');
        }
    }
    scrollBar();
    $(window).scroll(function () {
        scrollBar();
    });



})(jQuery, window);
