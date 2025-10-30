```markdown
# Variables de entorno para Terraform


#variables para iniciar proyecto

terraform init // inicializar proyecto

terraform plan // pre para revisar lo que va crear

terraform apply // inicia la toma de recursos

terraform destroy // elimina los recursos creados

#Alias para terraform

Set-Alias tf terraform

#Formatear archivos tf

tf fmt

#Crear entornos de trabajo

tf workspace list / mostrar todos

tf workspace nombre / crear uno nuevo

#Requisitos para poder ejecutar el proyecto

1. **Instalar Terraform**:
   - Descarga Terraform desde su [página oficial](https://www.terraform.io/downloads.html).
   - Asegúrate de que el ejecutable `terraform` esté en tu PATH.
   - Verifica la instalación ejecutando:
     ```bash
     terraform --version
     ```

2. **Instalar Azure CLI**:
   - Descarga e instala Azure CLI desde su [página oficial](https://learn.microsoft.com/es-es/cli/azure/install-azure-cli).
   - Verifica la instalación ejecutando:
     ```bash
     az --version
     ```

3. **Configurar una cuenta del proveedor (Azure)**:
   - Asegúrate de tener una cuenta activa en Azure.
   - Inicia sesión en Azure CLI:
     ```bash
     az login
     ```
   - Verifica tu suscripción activa:
     ```bash
     az account show
     ```

4. **Definir las variables necesarias**:
   - Configura las variables `tenant_id` y `subscription_id` que Terraform necesita para interactuar con Azure.
   - Puedes definirlas como variables de entorno:
     ```bash
     export TF_VAR_tenant_id="<tu-tenant-id>"
     export TF_VAR_subscription_id="<tu-subscription-id>"
     ```
   - O incluirlas en un archivo `terraform.tfvars`:
     ```hcl
     tenant_id       = "<tu-tenant-id>"
     subscription_id = "<tu-subscription-id>"
     ```
   - O incluirlas en un archivo `variables.tf`:
     ```hcl
     variable "tenant_id" {}
     variable "subscription_id" {}
     ```

5. **Opcional: Crear un alias para Terraform**:
   - Para facilitar el uso de Terraform, puedes crear un alias:
     - En PowerShell:
       ```powershell
       Set-Alias tf terraform
       ```
     - En Bash:
       ```bash
       alias tf='terraform'
       ```
```