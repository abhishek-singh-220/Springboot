count=$(docker ps -a | grep springbootapp | wc -l)
if (($count>0))
then
echo '($count) container is running'
docker stop springbootapp
docker rm springbootapp
echo 'springbootapp is stopeed and removed'
docker run -d -p 9098:8080 --name springbootapp springbootapp
echo 'springbootapp container is started'
else
echo 'No Container is running'
docker run -d -p 9098:8080 --name springbootapp springbootapp
echo 'springbootapp container is started'
fi
