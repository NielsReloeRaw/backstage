# Eerst inloggen op ghcr.io (eenmalig)
docker login ghcr.io -u nielsreloeraw

# Builden en pushen
cd C:\Claude\Backstage
.\build-push.ps1

# Of met een specifieke tag
.\build-push.ps1 -Tag "1.0.0"

# Namespace aanmaken + deployen
helm install backstage Backstage/helm/backstage --namespace backstage --create-namespace
helm upgrade backstage Backstage/helm/backstage --namespace backstage

# Git
git init
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/NielsReloeRaw/backstage.git
git push -u origin main