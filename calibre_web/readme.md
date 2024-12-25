# Calibre Web

1. Installer et configrer Calibre lui même.
2. Configurer l'envoi d'emails dans calibre.
3. Installer [calibre-web](https://github.com/janeczku/calibre-web)

   Installation via pip (recommended)

   1. Create a virtual environment: It’s essential to isolate your Calibre-Web installation to avoid dependency conflicts. You can create a virtual environment by running:

      ```sh
      python3 -m venv calibre-web-env
      ```

   2. Activate the virtual environment:

      ```sh
      source calibre-web-env/bin/activate
      ```

   3. Install Calibre-Web: Use pip to install the application:

   ```sh
   pip install calibreweb
   ```

   4. Start Calibre-Web: After installation, you can start the application with:

   ```sh
   cps
   ```

   5. Test locally with `localhost:8083`

4. Copy the service file to

   ```sh
   [Unit]
   Description=Calibre-Web Service
   After=network.target

   [Service]
   Type=simple
   User=quentin
   Group=quentin
   WorkingDirectory=/home/quentin/calibre_web
   ExecStart=/bin/bash -c 'source /home/quentin/calibre_web/calibre-web-env/bin/activate && exec cps'
   Restart=always
   RestartSec=5

   [Install]
   WantedBy=multi-user.target
   ```
