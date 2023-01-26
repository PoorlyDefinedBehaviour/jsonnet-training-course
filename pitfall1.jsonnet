local webserver = {
  new(name, replicas=1): {
    local base = self,

    container:: {
      name: 'httpd',
      image: 'httpd:2.4',
    },

    deployment: {
      apiVersion: 'apps/v1',
      kind: 'Deployment',
      metadata: {
        name: name,
      },
      spec: {
        replicas: replicas,
        template: {
          spec: {
            containers: [
              base.container,
            ],
          },
        },
      },
    },

    // Adding `self` allows the user to chain this function call.
    // Usually used in the builder pattern.
    withImage(image):: self + {
      container+: { image: image },
    },
  },
};


// Should be avoided because the jsonnet interpreter gets slow.
webserver.new('wonderful-webserver').withImage('httpd:2.5')
