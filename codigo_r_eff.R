#Carregando os Pacotes
library(lpSolve)
library(readxl)
library(Benchmarking) 
library(writexl)
library(readr)
library(openxlsx)
library(ggplot2)
library(dplyr)


#Criando Data Frame
dados = read.xlsx('DADOS_ESTADOS.xlsx', sheet = 1) #Lendo a Base de Dados (Planilha Excel) Dados dos Estado

#Imprimindo Data Frame
print(dados)


#Criando as Entradas #Criando as saídas
entradas = as.matrix(dados[,c('Prof_D','Prof_E','Prof_G','Doc_Alun','Curso_Grad','Curso_Pos', 'Vagas_Of')])
saidas = as.matrix(dados[,c('Total_Capes','Total_Enade','Conc_Mat')])

#Calculando a Eficiencia
resultados = dea(entradas,saidas, RTS = 'crs', ORIENTATION = 'in') #Calculando a eficiência

#Imprimindo a Eficiencia
print(resultados$eff)


Eficiencia = resultados$eff #Adicionando os resultados na tabela

dados$Eficiência = Eficiencia #Adicionando os resultados na tabela

print(dados) #Imprimindo a nova tabela

View(dados)

write.xlsx(dados, 'dea_estados_universidades.xlsx') #Exportar Planilha0

