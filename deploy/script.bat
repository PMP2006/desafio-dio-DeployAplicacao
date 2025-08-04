echo "Criando as imagens..........."

docker build -t pedromp1/projeto-backend:1.0 backend/.
docker build -t pedromp1/projeto-database:1.0 database/.

echo "Realizando push das imagens........"

docker push -t pedromp1/projeto-backend:1.0 
docker push -t pedromp1/projeto-database:1.0 

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments........"

kubectl apply -f ./deployment.yml
