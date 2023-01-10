<?php



namespace app\admin\service;


use EasyAdmin\auth\Node;

class NodeService
{

    /**
     * 获取节点服务
     * @return array
     * @throws \Doctrine\Common\Annotations\AnnotationException
     * @throws \ReflectionException
     */
    public function getNodelist(): array
    {
        $basePath = base_path() . 'admin' . DIRECTORY_SEPARATOR . 'controller';
        $baseNamespace = "app\admin\controller";

        return (new Node($basePath, $baseNamespace))->getNodelist();
    }
}
