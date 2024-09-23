# monorepo-cicd
setup cicd project using monorepo with different application

/root-repo
├── /applications
│   ├── /java-app
│   ├── /python-app
│   ├── /nodejs-app
│   └── /shared-modules
├── /infrastructure
│   ├── /modules                    # Reusable infrastructure modules
│   │   ├── alb                      # Application Load Balancer module
│   │   ├── codedeploy               # CodeDeploy configuration
│   │   ├── ecs                      # ECS cluster and services module
│   │   ├── iam                      # IAM roles, policies, users
│   │   ├── security                 # Security groups, firewalls
│   │   └── vpc                      # Virtual Private Cloud configuration
│   ├── /environments                # Environment-specific configurations
│   │   ├── dev                      # Dev environment
│   │   │   └── main.tf
│   │   ├── prod                     # Prod environment
│   │   │   └── main.tf
│   └── /scripts                     # Infrastructure automation scripts
│       ├── apply.sh                 # Script to apply infrastructure changes
│       ├── plan.sh                  # Script to generate an execution plan
│       ├── destroy.sh               # Script to tear down infrastructure
│       └── graph.sh                 # Script to visualize the infrastructure graph
├── /workflows
│   ├── java-ci.yml
│   ├── python-ci.yml
│   ├── nodejs-ci.yml
│   ├── infra-ci.yml                 # CI/CD for infrastructure changes
│   └── reusable-ci.yml
├── .gitmodules
├── .github
│   └── workflows
│       └── reusable-workflow.yml
└── README.md
