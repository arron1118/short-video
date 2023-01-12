define(["jquery", "easy-admin"], function ($, ea) {

    let init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'shot.tips/index',
        add_url: 'shot.tips/add',
        edit_url: 'shot.tips/edit',
        delete_url: 'shot.tips/delete',
        export_url: 'shot.tips/export',
        modify_url: 'shot.tips/modify',
    };

    let Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'id', title: 'ID'},
                    {field: 'title', title: '标题'},
                    {field: 'cover_img', title: '封面', templet: ea.table.image, search: false},
                    {field: 'keyword', title: '关键词'},
                    {field: 'description', title: '描述', search: false},
                    {field: 'sort', title: '排序', edit: 'text', search: false},
                    {field: 'status', search: 'select', selectList: ["禁用","启用"], title: '状态', templet: ea.table.switch},
                    {field: 'view_count', title: '查看', search: false},
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
