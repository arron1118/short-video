define(["jquery", "easy-admin"], function ($, ea) {

    let init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'cooperate.customers/index',
        add_url: 'cooperate.customers/add',
        edit_url: 'cooperate.customers/edit',
        delete_url: 'cooperate.customers/delete',
        export_url: 'cooperate.customers/export',
        modify_url: 'cooperate.customers/modify',
    };

    let Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'id', title: 'ID'},
                    {field: 'title', title: '客户名称'},
                    {field: 'logo', title: 'LOGO', templet: ea.table.image, search: false},
                    {field: 'url', title: '链接地址', search: false},
                    {field: 'sort', title: '排序', edit: 'text', search: false},
                    {field: 'status', search: 'select', selectList: ["禁用","启用"], title: '状态', templet: ea.table.switch},
                    {field: 'create_time', title: '创建时间', search: false},
                    {width: 250, title: '操作', templet: ea.table.tool},
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
