local webserver = {
  new(name, replicas=1): {
    local base = self,

    container:: {
      name: 'httpd',
      image: 'httpd:2.4',
    },

    deployment: {
      apiVersion: 'apps/v1',
      king: 'Deployment',
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

webserver.new('wonderful-webserver') + webserver.withImage('httpd:2.5')
