      # Replica del script DADA de Roberto #

library(dada2)

via <- "01_RowData/MiSeq_SOP/"
list.files(via)

# La siguiente linea es para extraer los nombres simples de los archivos
# en el script los guarda en objetos llamados:
# fnFs: file name Forward
# fnFs: file name Reverse

# fastq forwrard
FqF <- sort(list.files(via, pattern="_R1_001.fastq", full.names = TRUE))
# fastq reverse
FqR <- sort(list.files(via, pattern="_R2_001.fastq", full.names = TRUE))

# Extract sample names, assuming filenames 
# have format: SAMPLENAME_XXX.fastq

#forward
nombres.muestra <- sapply(strsplit(basename(FqF), "_"), `[`, 1)

# reverse
nombres.muestra_2 <- sapply(strsplit(basename(FqR), "_"), `[`, 1)


# ¿Qué contienen las variables: fnFS,fnRs?



# Graficas de calidad phred para Forward
pdf("03_Results/Quality_Forward.pdf",width=13,height = 8)
plotQualityProfile(FqF[1:10])
dev.off()


# Graficas de calidad phred para Reverse
pdf("03_Results/Quality_Reverse.pdf",width=13,height = 8)
plotQualityProfile(FqR[1:10])
dev.off()

# Filtrar de acuerdo a la calidad phred, necesito que sea mayor a 30
# primero hay que generar una carpeta 

