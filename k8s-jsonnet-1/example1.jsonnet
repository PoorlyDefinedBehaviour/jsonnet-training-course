local k = import 'github.com/jsonnet-libs/k8s-libsonnet/1.23/main.libsonnet';

k.core.v1.container.new('container-name', 'container-image')
