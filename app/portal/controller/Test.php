<?php

namespace app\portal\controller;

use think\facade\Db;

class Test extends \app\common\controller\PortalController
{
    protected string $title = '测试数据';

    protected array $cols = [
        'Field',
        'Type',
        'Collation',
        'Null',
        'Key',
        'Default',
        'Extra',
        'Privileges',
        'Comment',
    ];

    public function getColumns()
    {
        $columns = Db::query('show full columns from sv_cases');
//        dump($columns);
        $temp = [];
        foreach ($columns as $key => $val) {
            $leftBrace = strpos($val['Comment'], '{');
            $rightBrace = strpos($val['Comment'], '}');
            $leftBracket = strpos($val['Comment'], '(');
            $rightBracket = strpos($val['Comment'], ')');

            $c = [];
            if ($leftBrace) {
                $c['type'] = substr($val['Comment'], $leftBrace + 1, $rightBrace - $leftBrace - 1);
            } else {
                $c = $val['Comment'];
            }

            $temp[] = [
                'field' => $val['Field'],
                'comment' => $c,
            ];
        }

        dump($temp);
    }
}
