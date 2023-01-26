local webserver = {
  new(name, replicas=1): {
    // self refers to the object that starts at the latest { found.
    local base = self,

    container:: {
      name: 'httpd',
      image: 'httpd:2.4',
      ports: [{
        containerPort: 80,
      }],
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
  },

  withImage(image): {
    container+: { image: image },
  },
};

webserver.new('wonderful-webserver')
+ webserver.withImage('httpd:2.5')
// Apply a patch to change the container port. The idea here is that you can
// modify libraries without having to change their code.
+ { container+: { ports: [{ containerPort: 8080 }] } }
