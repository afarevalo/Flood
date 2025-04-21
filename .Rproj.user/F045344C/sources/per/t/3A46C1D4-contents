rm(list = ls())
library(readxl)
library(tidyverse)
library(dplyr)
library(here)

cat("\014")
Centro_ABC <- data.frame(
  Ano = c(20, 50, 100, 200, 500, 1500),
  Probabilidad = c("1%", "10%", "1%", "10%","1%", "10%"),
  Area = c(20, 50, 100, 200, 500, 1500),
  promedio = c(20, 50, 100, 200, 500, 1500),
  maxima = c(20, 50, 100, 200, 500, 1500),
  Area2 = c(20, 50, 100, 200, 500, 1500),
  promedio2 = c(20, 50, 100, 200, 500, 1500),
  maxima2 = c(20, 50, 100, 200, 500, 1500)
  )

names(Centro_ABC) <- c(
  "Año", "Probabilidad",
  "Área Afectada (%)", "Promedio (m)", "Máxima (m)",
  "Área Afectada  (%)", "Promedio  (m)", "Máxima  (m)"
)

# -------

Centro_XYZ <- data.frame(
  Ano = c(20, 50, 100, 200, 500, 1500),
Probabilidad = c("1%", "10%", "1%", "10%","1%", "10%"),
Area = c(20, 50, 100, 200, 500, 1500),
promedio = c(30, 530, 1300, 2300, 5300, 13500),
maxima = c(230, 530, 1300, 2300, 5300, 13500),
Area2 = c(230, 530, 1300, 3200, 3500, 31500),
promedio2 = c(320, 350, 3100, 3200, 3500, 31500),
maxima2 = c(320, 350, 3100, 3200, 3500, 13500)
)

names(Centro_XYZ) <- c(
  "Año", "Probabilidad",
  "Área Afectada (%)", "Promedio (m)", "Máxima (m)",
  "Área Afectada  (%)", "Promedio  (m)", "Máxima  (m)"
)

# -------

Centro_SDF <- data.frame(
  Ano = c(20, 50, 100, 200, 500, 1500),
  Probabilidad = c("1%", "10%", "1%", "10%","1%", "10%"),
  Area = c(20, 50, 100, 200, 500, 1500),
  promedio = c(340, 4530, 4100, 4300, 4300, 43500),
  maxima = c(4230, 4530, 4130, 4300, 4300, 13500),
  Area2 = c(230, 530, 1300, 3200, 3500, 31500),
  promedio2 = c(320, 350, 3100, 3200, 3500, 31500),
  maxima2 = c(320, 350, 3100, 3200, 3500, 13500)
)

names(Centro_SDF) <- c(
  "Año", "Probabilidad",
  "Área Afectada (%)", "Promedio (m)", "Máxima (m)",
  "Área Afectada  (%)", "Promedio  (m)", "Máxima  (m)"
)

base_nombres <- ls()
cliente <- "Cliente ABC"

# -------

fecha <- format(Sys.Date(), "%B %Y")
fecha <- paste0(toupper(substring(fecha, 1, 1)), substring(fecha, 2))

# Rutas
ruta_maps_flood <- "1. Mapas"
ruta_maps_flood <- file.path(ruta_maps_flood, cliente,"Ubicaciones")

# ------

ruta_return <- here(file.path(ruta_maps_flood, cliente))

base_limpio <- gsub("_", " ", base_nombres)

ruta_codigo <- "3. Reporte"

# -------

# Definir la ruta a la carpeta temporal usando `here`
ruta_temp <- here(file.path(ruta_codigo, "temp_maps"))

# Verificar si existe y borrarla
if (dir.exists(ruta_temp)) {
  unlink(ruta_temp, recursive = TRUE, force = TRUE)
  } 