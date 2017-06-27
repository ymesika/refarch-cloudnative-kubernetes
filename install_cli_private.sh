# Checking if bx is installed
grn=$'\e[1;32m'
end=$'\e[0m'

# Install sudo
apt-get install sudo

# Checking if kubectl is installed
KUBE_PATH=$(command -v kubectl)

if [[ $? -ne 0 ]]; then
	printf "\n\n${grn}Installing Kubernetes CLI (kubectl)...${end}\n"

	if [[ $OSTYPE =~ .*darwin.* ]]; then
		# OS X
		curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl

	elif [[ $OSTYPE =~ .*linux.* ]]; then
		# Linux
		curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
	fi

	chmod +x ./kubectl
	sudo mv ./kubectl /usr/local/bin/kubectl
fi
		
# Checking if helm is installed
KUBE_PATH=$(command -v helm)

if [[ $? -ne 0 ]]; then
	printf "\n\n${grn}Installing Helm CLI (helm)...${end}\n"

	curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
	chmod 700 get_helm.sh
	./get_helm.sh -v v2.4.2

	rm get_helm.sh
fi


# Installing jq
JQ_PATH=$(command -v jq)

if [[ $? -ne 0 ]]; then
	printf "\n\n${grn}Installing jq${end}\n"

	if [[ $OSTYPE =~ .*darwin.* ]]; then
		# OS X
		curl -Lo jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-osx-amd64

	elif [[ $OSTYPE =~ .*linux.* ]]; then
		# Linux
		curl -Lo jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
	fi

	chmod +x ./jq
	sudo mv ./jq /usr/local/bin/jq
fi

# Installing yaml
YAML_PATH=$(command -v yaml)

if [[ $? -ne 0 ]]; then
	printf "\n\n${grn}Installing YAML${end}\n"

	if [[ $OSTYPE =~ .*darwin.* ]]; then
		# OS X
		curl -LO https://github.com/mikefarah/yaml/releases/download/1.10/yaml_darwin_amd64
		mv yaml_darwin_amd64 yaml

	elif [[ $OSTYPE =~ .*linux.* ]]; then
		# Linux
		curl -o yaml https://github.com/mikefarah/yaml/releases/download/1.8/yaml_linux_amd64
	fi

	chmod +x ./yaml
	sudo mv ./yaml /usr/local/bin/yaml
fi