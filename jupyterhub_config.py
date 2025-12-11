c = get_config()

c.JupyterHub.authenticator_class = 'dummy'
c.DummyAuthenticator.password = "admin"

c.JupyterHub.spawner_class = 'localprocess'

c.LocalProcessSpawner.user = 'jupyter'
c.LocalProcessSpawner.notebook_dir = '/home/jupyter/notebooks'

c.Spawner.cmd = ['jupyter-labhub']

c.JupyterHub.bind_url = 'http://:8000'
