local webserver = {
  local base = self,

  _config:: {
    // If name is not provided, an error will be raised.
    name: error 'provide name',
    replicas: 1,
  },

  _images:: {
    httpd: 'httpd:2.4',
  },

  container:: {
    name: 'httpd',
    image: base._images.httpd,
  },

  deployment: {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
      name: base._config.name,
    },
    spec: {
      replicas: base._config.replicas,
      template: {
        spec: {
          containers: [
            base.container,
          ],
        },
      },
    },
  },
};

// Some people use the `_` to indicate that a property is private.
// Is has no effect in practice and every property is public.
webserver {
  _config+: {
    name: 'wonderful-webserver',
  },
  _images+: {
    httpd: 'httpd:2.5',
  },
}
