## To deploy the resources in this script, use the following command in the terminal:

```bash
az deployment group create --template-file ./main.bicep --resource-group your-RG-name --parameters ./parameters/test.json
```

### For dev environment, substitute the test.json parameter file with dev.json, similarly for prod, use prod.json:

```bash
az deployment group create --template-file ./main.bicep --resource-group your-RG-name --parameters ./parameters/dev.json
```

```bash
az deployment group create --template-file ./main.bicep --resource-group your-RG-name --parameters ./parameters/prod.json
```
