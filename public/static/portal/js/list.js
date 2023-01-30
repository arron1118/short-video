(function ($, window, undefined) {

    let listContainer = $('.list-container')

    let init = function () {
        $.get("/Cases/getCasesCateList", {}, function (cates) {
            cates = cates.data
            console.log(cates)
            if (cates.length > 0) {
                // tablist
                let nav = $('<ul />', {
                    class: 'nav nav-pills mb-3 justify-content-center',
                    id: 'pills-tab',
                    role: 'tablist',
                })
                let content = $('<div />', {
                    class: 'tab-content',
                    id: 'pills-tabContent',
                })

                $.each(cates, function (index, item) {
                    nav.append($('<li />', {
                        class: 'nav-item',
                        role: 'presentation',
                        'data-id': item.id,
                    }).append($('<button />', {
                        class: 'nav-link ' + (index === 0 ? 'active' : ''),
                        id: 'pills-' + item.id + '-tab',
                        'data-bs-toggle': 'pill',
                        'data-bs-target': '#pills-' + item.id,
                        type: 'button',
                        role: 'tab',
                    }).text(item.title).on('click', function () {
                        getCasesList(item.id)
                    })))

                    content.append($('<div />', {
                        class: 'tab-pane fade show ' + (index === 0 ? 'active' : ''),
                        id: 'pills-' + item.id,
                        role: 'tabpanel',
                        'aria-labelledby': 'pills-' + item.id + '-tab',
                        tabindex: index,
                    }).append($('<div />', {
                        class: 'container tab-pane',
                    }).append($('<div />', {
                        class: 'row list-content',
                    }))))
                })

                $(listContainer).append(nav).append(content)

                // tabContent
                getCasesList(cates[0].id)
            }
        })
    }

    let getCasesList = function (cate_id, page = 1, limit = 6) {
        $.get('/Cases/getCasesList', {cate_id: cate_id, page: page, limit: limit}, function (cases) {
            if (cases.data.length > 0) {
                $('#pills-' + cate_id + ' .list-content').children().remove()
                // content
                $.each(cases.data, function (index, item) {
                    let listContent = $('#pills-' + cate_id + ' .list-content')
                    listContent.append($('<div />', {
                        class: 'col-4 mb-4',
                    }).append($('<div />', {
                        class: 'card p-0 border-0',
                    }).append($('<img />', {
                        src: item.cover_img ? item.cover_img : '/static/common/images/nopic.jpg',
                        alt: item.title,
                        class: 'card-img-top img-fluid',
                        style: 'max-height: 280px;',
                    })).append($('<div />', {
                        class: 'card-body'
                    }).append($('<div />', {
                        class: 'card-title',
                    }).append($('<div />', {
                        class: 'stretched-link text-reset',
                        href: '#',
                        title: item.title,
                    }).text(item.title))).append($('<div />', {
                        class: 'card-content line3 text-indent2',
                    }).text(item.description)))))
                })

                // pages
                let p = Math.round(cases.total / cases.limit)
                if (p > 1) {
                    $('#pills-' + cate_id + ' .list-page').remove()
                    let ul = $('<ul />', {
                        class: 'pagination justify-content-center',
                    })

                    let prevPage = $('<li />', {
                        class: 'page-item disabled',
                    }).append($('<a />', {
                        class: 'page-link',
                    }).text('上一页'))
                    if (page > 1) {
                        prevPage = $('<li />', {
                            class: 'page-item',
                        }).append($('<a />', {
                            class: 'page-link',
                            href: 'javascript:()',
                        }).text('上一页').on('click', function () {
                            getCasesList(cate_id, page - 1)
                        }))
                    }
                    ul.append(prevPage)

                    for (let i = 1; i <= p; i++) {
                        ul.append($('<li />', {
                            class: 'page-item ' + (i === page ? 'active' : ''),
                        }).append($('<a />', {
                            class: 'page-link',
                            href: 'javascript:()',
                        }).text(i).on('click', function () {
                            getCasesList(cate_id, i)
                        })))
                    }

                    let nextPage = $('<li />', {
                        class: 'page-item disabled',
                    }).append($('<a />', {
                        class: 'page-link',
                    }).text('下一页'))
                    if (page < p) {
                        nextPage = $('<li />', {
                            class: 'page-item',
                        }).append($('<a />', {
                            class: 'page-link',
                            href: 'javascript:()',
                        }).text('下一页').on('click', function () {
                            getCasesList(cate_id, page + 1)
                        }))
                    }
                    ul.append(nextPage)

                    $('#pills-' + cate_id).append($('<div />', {
                        class: 'row list-page',
                    }).append($('<nav />', {
                        'aria-label': 'Page navigation',
                    }).append(ul)))
                }
            }
        })
    }

    init();
})(jQuery, window)
