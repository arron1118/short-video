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

    public function index()
    {
        $s = "<p>每个人的生命中，都有最艰难的一年，将人生变得美好而辽阔。无论是你的至暗时刻，还是你的高光时刻，都值得被记录！而你所热爱的东西，
总有一天，会反过来拥抱你。摄影，就是最好的证明，既能帮你记录，还能拥抱你！无论今年的你，是至暗还是高光，还是平常，这个春天的花朵，都值得被记录得更美！
下面咱学一下，怎么拍美这个春天的花朵吧！</P>
<br />
一、地上长的花，这么拍，就错啦！来看怎么改！";
        return html_entity_decode($s);
    }

    protected function ischinese($s)
    {
        $allen = preg_match('/^[^\x80-\xff]+$/', $s);   //判斷是否是英文
        $allcn = preg_match('/^[\x{4e00}-\x{9fa5}]+$/u', $s);  //判斷是否是中文
        if ($allen) {
            return 'allen';
        } else {
            if ($allcn) {
                return 'allcn';
            } else {
                return 'encn';
            }
        }

    }
}
