set -e
sudo docker build -t packager .
sudo docker stop packager
sudo docker rm packager
sudo docker run -d -e VIRTUAL_HOST=packager.rnplay.org -v /home/app/rails/rnplay/play_js:/js --name packager packager
