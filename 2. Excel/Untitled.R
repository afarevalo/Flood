library(rmarkdown)
library(here)
library(officer)
library(rmarkdown)
library(here)
library(quantmod)
library(dplyr)

# — Parámetros — 
cliente <- "Nombre del Cliente S.A."
fecha   <- format(Sys.Date(), "%d/%m/%Y")

# — Rutas — 
input_docx <- here("2. Excel","Hola Mundo.docx")
docx_out   <- here("2. Excel","informe_modificado.docx")
pdf_out    <- here("2. Excel","informe_modificado.pdf")

if (!file.exists(input_docx)) stop("No encuentro ", input_docx)

# 1) Leer plantilla y reemplazar
doc <- read_docx(input_docx) %>%
  body_replace_all_text(old_value      = "NC12",
                        new_value      = cliente,
                        only_at_cursor = FALSE) %>%
  body_replace_all_text(old_value      = "Date",
                        new_value      = fecha,
                        only_at_cursor = FALSE)

# 2) Guardar el .docx modificado
print(doc, target = docx_out)

# 3) Convertir sólo ese .docx a PDF
rmarkdown::pandoc_convert(
  input   = docx_out,      # ← aquí tu .docx recién creado
  to      = "pdf",
  output  = pdf_out,
  options = c("--pdf-engine=xelatex")
)

message("✅ PDF generado en: ", pdf_out)





#=============================================
# Ruta al ejecutable real de LibreOffice
soffice_cmd <- "C:/Program Files/LibreOffice/program/soffice.exe"
if (!file.exists(soffice_cmd)) {
  stop("No encontré soffice.exe en:\n", soffice_cmd)
}

# Llamada headless para convertir DOCX → PDF
res <- system2(soffice_cmd, args = c(
  "--headless",
  "--convert-to", "pdf",
  shQuote(input_doc),
  "--outdir",    shQuote(out_dir)
), stdout = TRUE, stderr = TRUE)

# LibreOffice deja el PDF en out_dir con mismo nombre base
auto_pdf <- file.path(out_dir,
                      paste0(tools::file_path_sans_ext(basename(input_doc)),
                             ".pdf"))

if (!file.exists(auto_pdf)) {
  stop("LibreOffice no generó el PDF. Salida:\n", paste(res, collapse = "\n"))
}

# (Opcional) Renómbralo si quieres un nombre distinto
file.rename(auto_pdf, pdf_out)

message("✅ PDF generado en: ", pdf_out)






# Renderizar el PDF y guardarlo en la carpeta "2. Excel/00. Reportes"
# render(
#   input = here("3. Reporte", "Reporte.Rmd"),  # ruta a tu .Rmd
#   output_format = "pdf_document",
#   output_file = "Reporte.pdf",               # nombre final del archivo
#   output_dir = here("2. Excel", "00. Reportes")  # carpeta de destino
# )
