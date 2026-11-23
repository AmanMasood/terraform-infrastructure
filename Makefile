ENV ?= dev
DIR = environments/$(ENV)

.PHONY: fmt validate plan apply destroy

fmt:
	terraform fmt -recursive

validate:
	terraform -chdir=$(DIR) init -backend=false -input=false
	terraform -chdir=$(DIR) validate

plan:
	terraform -chdir=$(DIR) init -backend-config=backend.hcl
	terraform -chdir=$(DIR) plan -out=tfplan

apply:
	terraform -chdir=$(DIR) apply tfplan

destroy:
	terraform -chdir=$(DIR) destroy
