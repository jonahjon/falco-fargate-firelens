CLUSTER_NAME = robotshop

fargate-profile:
	eksctl create fargateprofile --cluster $(CLUSTER_NAME) --name falco --namespace default --labels app=falco

create-sa:
	eksctl create iamserviceaccount \
	--name falco \
	--namespace default \
	--cluster $(CLUSTER_NAME) \
	--attach-policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy  \
	--approve