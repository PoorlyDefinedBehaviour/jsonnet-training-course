// Execute with jsonnet -J vendor/ usage1.jsonnet

local xtd = import 'github.com/jsonnet-libs/xtd/main.libsonnet';

xtd.ascii.isNumber('2')
