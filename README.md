# monorepo-cicd
setup cicd project using monorepo with different application

/root-repo ├── /applications │ ├── /java-app │ │ ├── src/ # Source code for Java app │ │ ├── pom.xml # Maven/Gradle config for Java app │ │ └── Dockerfile # Dockerfile for building the Java app │ ├── /python-app │ │ ├── src/ # Source code for Python app │ │ ├── requirements.txt # Python dependencies │ │ └── Dockerfile # Dockerfile for building the Python app │ ├── /nodejs-app │ │ ├── src/ # Source code for Node.js app │ │ ├── package.json # Node.js dependencies │ │ └── Dockerfile # Dockerfile for building the Node.js app │ └── /shared-modules # Shared modules between different apps │ └── README.md # Info about shared modules ├── /infrastructure │ ├── /modules # Reusable infrastructure modules │ │ ├── alb # Application Load Balancer module │ │ ├── codedeploy # CodeDeploy configuration │ │ ├── ecs # ECS cluster and services module │ │ ├── iam # IAM roles, policies, users │ │ ├── security # Security groups, firewalls │ │ └── vpc # Virtual Private Cloud configuration │ ├── /environments # Environment-specific configurations │ │ ├── dev # Dev environment │ │ │ └── main.tf # Terraform config for dev environment │ │ ├── prod # Prod environment │ │ │ └── main.tf # Terraform config for prod environment │ └── /scripts # Infrastructure automation scripts │ ├── apply.sh # Script to apply infrastructure changes │ ├── plan.sh # Script to generate an execution plan │ ├── destroy.sh # Script to tear down infrastructure │ └── graph.sh # Script to visualize the infrastructure graph ├── /workflows │ ├── java-ci.yml # CI workflow for Java app │ ├── python-ci.yml # CI workflow for Python app │ ├── nodejs-ci.yml # CI workflow for Node.js app │ ├── infra-ci.yml # CI/CD for infrastructure changes │ └── reusable-ci.yml # Reusable CI templates for all apps ├── .gitmodules # Git submodules if needed ├── .github │ └── workflows │ └── reusable-workflow.yml # GitHub Actions reusable workflows └── README.md # Monorepo documentation

## Folder Descriptions

### `/applications`
This folder contains individual application code for the different language stacks:
- **/java-app**: Java-based microservice
- **/python-app**: Python-based microservice
- **/nodejs-app**: Node.js-based microservice
- **/shared-modules**: Any shared code or libraries used across applications.

### `/infrastructure`
The infrastructure folder houses the infrastructure-as-code configuration using Terraform or other IaC tools:
- **/modules**: Contains reusable Terraform modules for different services like ALB, ECS, IAM, etc.
- **/environments**: Environment-specific configuration files for provisioning infrastructure for dev, prod, etc.
- **/scripts**: Helper scripts for managing infrastructure, such as `apply.sh`, `plan.sh`, `destroy.sh`, and `graph.sh`.

### `/workflows`
Contains the CI/CD pipeline configuration for the applications and infrastructure, including individual workflows for each application and a shared reusable workflow template.

---



