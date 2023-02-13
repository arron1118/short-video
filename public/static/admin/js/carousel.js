define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'carousel/index',
        add_url: 'carousel/add',
        edit_url: 'carousel/edit',
        delete_url: 'carousel/delete',
        export_url: 'carousel/export',
        modify_url: 'carousel/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'id', title: 'ID'},                    {field: 'cate_id', search: 'select', selectList: {"1":"首页","2":"服务","3":"案例","4":"分享","5":"联系我们"}, title: '栏目ID'},                    {field: 'img', title: '图片', templet: ea.table.image},                    {field: 'url', title: '链接'},                    {field: 'sort', title: '排序', edit: 'text'},                    {field: 'status', search: 'select', selectList: ["禁用","启用"], title: '状态', templet: ea.table.switch},                    {field: 'create_time', title: '创建时间'},                    {width: 250, title: '操作', templet: ea.table.tool},
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});