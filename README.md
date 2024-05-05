# WordPress Project template

This project is a WordPress setup for ASSE Websites, configured to run in a Docker environment.

## Prerequisites

- Docker
- Docker-compose

## Installation

1. Clone the repository
```bash
git clone https://github.com/xpbl4/wp-website-container.git [wp-host-website]
```
2. Navigate to the project directory (replace `[wp-host-website]` with the name of the directory you cloned the repository into
```bash
cd [wp-host-website]
```
3. Copy the `.env.template` file to `.env` and modify it according to your needs
```bash
cp .env.template .env
```

## Locally Usage

4. Copy the `docker-compose.local.yml` file to `docker-compose.override.yml`
```bash
cp docker-compose.local.yml docker-compose.override.yml
```
5. Start the Docker containers
```bash
docker-compose up -d
```

- Access the application at `http://[wp-host-website].localhost:{HOST_PORT}`
- Access the database at `localhost:{MYSQL_PORT}`

## Production Usage
4. Copy the `docker-compose.production.yml` file to `docker-compose.override.yml`
```bash
cp docker-compose.production.yml docker-compose.override.yml
```
5. Create a host `nginx` configuration file
```bash
host/init.sh nginx/wp-host-website.conf [wp-host-website]
nginx -s reload
```
6. Start the Docker containers
```bash
docker-compose up -d
```
### Certbot
Create a certificate for the domain `[wp-host-website]`
```bash
certbot --nginx -d wp-host-website [-d wp-host-website-alias...]
```

- Access the application at `https://[wp-host-website]/`

## Developing

1. You can access MySQL server on the override port. Please see [.env](.env) for username/password and port.
2. Git:
   * `git checkout -b issue-{taskId}` and follow the git-flow. `{taskId}` corresponds to the issue number from the GitHub's Issues Tracker.
   * `git commit -m "..."`, optionally use `refs #{taskId}` to link the issue in the commit message


## Built With

* [Docker](https://www.docker.com/) - The container platform used
* [WordPress](https://wordpress.org/) - The CMS used
* [MySQL](https://www.mysql.com/) - The database used
* [Nginx](https://www.nginx.com/) - The web server used
* [PHP](https://www.php.net/) - The scripting language used

## Authors

* **Xpbl4** - *Initial work* - [Xpbl4](https://github.com/xpbl4)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc