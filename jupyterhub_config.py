import os
c = get_config()
data_dir = os.environ.get('JUPYTERHUB_DATA_DIR', '/home/jupyter/data')
# ----------------------------
# Authenticator
# ----------------------------
c.JupyterHub.authenticator_class = 'dummy'
c.DummyAuthenticator.password = "admin"

# ----------------------------
# Spawner
# ----------------------------
c.JupyterHub.spawner_class = 'localprocess'
c.LocalProcessSpawner.user = 'jupyter'
c.LocalProcessSpawner.notebook_dir = '/home/jupyter/notebooks'
c.Spawner.cmd = ['jupyter-labhub']

# ----------------------------
# Bind URL
# ----------------------------
c.JupyterHub.bind_url = 'http://:8000'

# ----------------------------
# Cookie secret
# ----------------------------
c.JupyterHub.cookie_secret_file = os.path.join(data_dir, "jupyterhub_cookie_secret")
c.JupyterHub.db_url = f"sqlite:///{os.path.join(data_dir, 'jupyterhub.sqlite')}"


c.ConfigurableHTTPProxy.pid_file = os.path.join(data_dir, "configurable-http-proxy.pid")