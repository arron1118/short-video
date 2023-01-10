(function ($, window, undefined) {
    let host = window.location.host;
    let prefix = '';
    if (host === 'localhost' || '192.168.0.200') {
        prefix = '/hb-shortVideo';
    }
    console.log('999',prefix)
    console.log('这', window.location);

    let navInit = function () {
        $('.lqp-header').load(prefix, {dataType: 'jsonp'}, function () {
            // 配置文件
            let menuUrl = prefix + '/js/menu.json';
            console.log(menuUrl)
            let url = window.location.href;//获取浏览器地址
            let res = url.lastIndexOf("\/");
            let str = url.substring(res + 1, url.length);//从后面截取最后一个/后面的内容
            let pageName = str.substring(0, str.indexOf('.'));//去掉后缀，预防不同的后缀匹配不到（html,xhtml）

            $.getJSON(menuUrl, function (res) {
                // 头部导航
                $.each(res.menuList, function (index, item) {
                    let aClass = res["menuClass"] + ' ' + item["class"];
                    if (pageName === item.name) {//用浏览器地址和自定义绑定的数据data-url或许自己命名：name。两个对比
                        aClass += " nav-active ";
                    }

                    let li = $('<li />', {
                        class: ' nav-item mx-3 lqp-hoverline text-nowrap'
                    }).append($('<a />', {
                        class: aClass,
                        href: item.href,
                    }).text(item.title));
                    $('.lqp-inner-ul').append(li);
                });
            });
        });

    };
    // 初始化导航
   navInit();

})(jQuery, window);
