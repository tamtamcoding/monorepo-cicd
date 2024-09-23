# monorepo-cicd
setup cicd project using monorepo with different application


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

This provides a high-level overview of your project structure, while giving enough details for each directory to be easily understood by new team members or contributors.

Would you like to include any additional information or further breakdown for specific sections?


