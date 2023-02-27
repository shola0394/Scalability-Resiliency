#Part 1: IAM
# * CloudSpace Engineers Cluster_Name [ They should have full admin access except billing to 
# the NAS accounts] 
 
 Name:CS_Engineers_Puma
	Policies:
		-AdministratorAccess
		-Billing (Deny)

#     * NAS Financial Group Security Team [They should have full admin access with billing 
# included to the NAS Financial Group accounts] 

 Name:NAS_Sec_Team
	Policies:
		-AdministratorAccess
		
#     * NAS Financial Group Operations Team [They should only have full admin access to deploy 
# ONLY in the us-east-1 region and should NOT be able to launch in any other region]

Name:NAS_Ops_Team
	Policies:
		-AdministratorAccess
			-Condition:
			 	-RequestedRegion, StringEquals, us-east-1

#Part 2: Network

Step1:
Create 1 VPC: 
	Properties:
	->[vpc name]:CS-project
	->CIDRs :10.0.0.0/16
	***Main route table automatically created
	***security created automatically
	***network ACL automatically created
[Step 2:]
Create Securitygroup:
	open to all traffic
attached to the vpc]xxx


Step3: 
Create 2 public subnet: 
	->Name:pub1-subnet | pub2-subnet
	->AZ:us-west-2a | us-west-2b
	->ipv4 cidr block:10.0.0.0/18 | 10.0.64.0/18	


Step 4:
Create 2 private subnet: 
		->Name:priv1-subnet | priv2-subnet
		->AZ:us-west-2a | us-west-2b
		->ipv4 cidr block:10.0.128.0/18	| 10.0.192.0/18

Step 5:
Create 1 igw:
	Properties:
		name:cs-igw
	Attach to cs-vpc	

Step 6:
create 2 nat gateway 4 each public subnet:
	Properties:
		Name:cs-nat-gat1 | cs-nat-gat2
		subnet(public): pub1-subnet | pub2-subnet id
		Connectivity type: public # private do not reach internet
		elastic ip: Associate or create then Associate one in the AZ
		

Step 7:
create 1 route table for public subnet:
	Properties:
		name:cs-pub-rtb
		vpc:name/id
	add a route:
		dest 0.0.0.0/0, target igw id
	subnet association: pub1-subnet & pub2-subnet id
	*** association can be done at subnet or rtb level****

Step 8:
create 2 route table for private subnet:
	Properties:
		name:cs-priv1-rtb | cs-priv2-rtb
		vpc:name/id
	add a route:
		dest 0.0.0.0/0, target nat gatw id
	subnet association: priv1-subnet | priv2-subnet id
	*** association can be done at subnet or rtb level****




# 	create Main network ACL: acl-001af04b9c6e60667
# 		subnet association: 4 subnets
# 		inbout rules:
# 			all trafic, all protocol, all port
# 		outbout rules:	
# 			all traffic, all protocol, all port

# 	Enable DNS hostnames
# 	Enable DNS resolution  
 
#  Allocate elastic IP: eipalloc-019cd3010faf3e6b6  
#  Allocate elastic IP: eipalloc-07165512f39daf897  
#  Create 2 NAT gateway: nat-0d72167ca569d1017  

 
#https://www.davidc.net/sites/default/subnets/subnets.html

#   Create VPC: vpc-0f0bb6024592dd2d4  
#  Enable DNS hostnames
#  Enable DNS resolution
#  Verifying VPC creation: vpc-0f0bb6024592dd2d4  
#  Create subnet: subnet-09b08f1ab6d94ffcf  
#  Create subnet: subnet-0c53fd0aac2985420  
#  Create subnet: subnet-02a6f90b130943357  
#  Create subnet: subnet-097df217201c6ba69  
#  Create internet gateway: igw-0a2891643d1ce0acc  
#  Attach internet gateway to the VPC
#  Create route table: rtb-0e9c5d2d471358a07  
#  Create route
#  Associate route table
#  Associate route table
#  Allocate elastic IP: eipalloc-019cd3010faf3e6b6  
#  Allocate elastic IP: eipalloc-07165512f39daf897  
#  Create NAT gateway: nat-0d72167ca569d1017  
#  Create NAT gateway: nat-02ea3f27cde182a58  
#  Wait for NAT Gateways to activate
#  Create route table: rtb-034c8d26f6e66e959  
#  Create route
#  Associate route table
#  Create route table: rtb-09b43c5ca05c05e85  
#  Create route
#  Associate route table
#  Verifying route table creation