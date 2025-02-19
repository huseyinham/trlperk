# Structure
I chose to use Terraform Workspaces. In real life, I feel like that is the best option for minimising differences between environments and making sure deployments in test are as trustworth as possible.

The format of the structure is pretty simple:
- stacks: top-level folder that builds the necessary parts (collates all the modules)
- variables: use to declare environment-specific variables to be passed into stacks. I choose to declare by env and region in case more regions are used.
- modules: bundles up logic into modules keeping them as reusable as possible however I do not try to overload them. For example, I made a specific ecs-service-fargate-replica module. I find creating separate modules for each type of service (ec2/fargate/replica/daemon) is better maintainence-wise.

In the real world, I would have the app1 stack in the GIT repository alongside the application (as it now). However I would place the vpc and ecs-cluster stack into a central repository together. This puts the application-specific components in the hands of engineers so they can amend IAM permissions, environment variables etc at the same time as their deployment that requires it.

The only application-specific thing that I do build in the "central repository" is security groups (all within the VPC folder) as otherwise you cause a weird dependency if you try to be as-secure-as-possible and reference app1's security group on app2's security group and vice versa.

# More changes I would make
I have had to do a few workarounds due to limited permissions that I wouldn't otherwise do such as hardcoding etc.

Similarly I haven't actually run the workflows as I have no remote state to be used; and do not want to have that be in Github.

Obviously move everything to private subnets and vpc endpoints.

In Github Actions (CI/CD), I would use git tags for events and gate off production deployments. 

# Notes
Some of the instructions between the two reposotries given were a bit conflicting. Hopefully me just documenting stuff was valid enough.

