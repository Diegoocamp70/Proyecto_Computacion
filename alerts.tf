# ============================================================
# Alertas de presupuesto y consumo para Proyecto Historias Clínicas
# ============================================================

# 1. Definir presupuesto mensual ( $50 USD)
resource "azurerm_consumption_budget_subscription" "monthly_budget" {
  name            = "hc-monthly-budget"
  subscription_id = var.subscription_id
  amount          = 50
  time_grain      = "Monthly"

  time_period {
    start_date = "2025-11-01T00:00:00Z"
    end_date   = "2025-12-01T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 70    # 70% del presupuesto
    operator       = "GreaterThan"
    contact_emails = ["admin@historiasclinicas.com"]
  }

  notification {
    enabled        = true
    threshold      = 90    # 90% del presupuesto
    operator       = "GreaterThan"
    contact_emails = ["admin@historiasclinicas.com"]
    contact_roles  = ["Owner"]
  }

  notification {
    enabled        = true
    threshold      = 100   # 100% del presupuesto
    operator       = "GreaterThan"
    contact_emails = ["admin@historiasclinicas.com"]
    contact_roles  = ["Owner"]
  }
}

# ============================================================
# 2. Alertas de métricas (CPU, memoria, latencia) con Azure Monitor
# ============================================================

# Ejemplo: alerta si CPU > 80% en App Service
resource "azurerm_monitor_metric_alert" "cpu_alert" {
  name                = "hc-appservice-cpu-alert"
  resource_group_name = azurerm_resource_group.rg.name
  scopes              = [azurerm_app_service.app.id]
  description         = "Alerta cuando el uso de CPU supera el 80%"
  severity            = 2
  window_size         = "PT5M"


  criteria {
    metric_namespace = "a"
    metric_name      = "Transactions"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 50

  }

  action {
    action_group_id = azurerm_monitor_action_group.alert_group.id
  }
}

# ============================================================
# 3. Grupo de acción para enviar notificaciones (correo, Teams)
# ============================================================
resource "azurerm_monitor_action_group" "alert_group" {
  name                = "hc-alert-group"
  resource_group_name = azurerm_resource_group.rg.name
  short_name          = "hcalerts"

  email_receiver {
    name          = "admin-email"
    email_address = "admin@historiasclinicas.com"
  }
}