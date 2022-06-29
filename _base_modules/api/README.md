# About
This folder contains the base terraform files for the api. This module uses several modules together:
- app service plan
- linux web app
- apim endpoint
- keyvault policy

This folder also contains api.hcl which is used to contain *global* inputs to all api projects (dev, test, stage, prod)