# --------------------------------------------------
# Análise da Estatística Descritiva dos Dados
# --------------------------------------------------

# Mudando o diretório de trabalho
setwd("~/Git/pos-datascience/CMP.0005.00.02 - Técnicas Estatísticas de Predição")

# Carregando base de dados
municipios <- read.csv("Municipios_SC.csv", header = T, sep = ";", dec = ",", fileEncoding = "iso-8859-1")

# Para visualizar os dados
# View(municipios)

# Help do comando
# help(<comando>)

# Estatísticas descritivas

## Medidas de posição
### Média
mean(municipios$População)
mean(municipios$Área)
mean(municipios$Densidade)

### Mediana
median(municipios$População)
median(municipios$Área)
median(municipios$Densidade)

### Outras
quantile(municipios$População)
quantile(municipios$População, probs = c(0, .05, .1, .25, .5, .75, .9, .95, 1))
quantile(municipios$Área, probs = c(0, .05, .1, .25, .5, .75, .9, .95, 1))
quantile(municipios$Densidade, probs = c(0, .05, .1, .25, .5, .75, .9, .95, 1))

summary(municipios$População)
summary(municipios$Área)
summary(municipios$Densidade)

## Medidas de Dispersão

### Amplitude
max(municipios$População) - min(municipios$População)
max(municipios$Área) - min(municipios$Área)
max(municipios$Densidade) - min(municipios$Densidade)

### Desvio Padrão
sd(municipios$População)
sd(municipios$Área)
sd(municipios$Densidade)

### Variância
var(municipios$População)
var(municipios$Área)
var(municipios$Densidade)

### Coeficiente de Variação
sd(municipios$População) / mean(municipios$População)
sd(municipios$Área) / mean(municipios$Área)
sd(municipios$Densidade) / mean(municipios$Densidade)

## Medidas de Assimetria e Curtose

### Necessário instalar o pacote fBasics
install.packages("fBasics")

### Carregando o pacote
library(fBasics)

### Assimetria
#### Não há problemas de Assimetria se: -1 < Ass(x) < +1 
#### Há problemas de Assimetria Negativa se: Ass(x) < -1 
#### Há problemas de Assimetria Positiva se: Ass(x) > +1 
skewness(municipios$População)
skewness(municipios$Área)
skewness(municipios$Densidade)

### Curtose
#### Não há problemas de Curstose se: -7 < Curt(x) < +7 
#### Há problemas de Curstose (Leptocúrtica) se: Curt(x) < -7 
#### Há problemas de Curstose (Platicúrtica) se: Curt(x) > +7 
kurtosis(municipios$População)
kurtosis(municipios$Área)
kurtosis(municipios$Densidade)

# Estatísticas descritivas usando o fBasics

basicStats(municipios$População)
basicStats(municipios$Área)
basicStats(municipios$Densidade)

# Corrigindo a Assimetria dos Dados
## Padronizar as variáveis

## Número neperiano

### População
ln_pop <- log(municipios$População)
mean(ln_pop)
median(ln_pop)
skewness(ln_pop)
kurtosis(ln_pop)
exp(mean(ln_pop)) # Média mais representativa

### Área
ln_area <- log(municipios$Área)
mean(ln_area)
median(ln_area)
skewness(ln_area)
kurtosis(ln_area)
exp(mean(ln_area)) # Média mais representativa

### Densidade
ln_dens <- log(municipios$Densidade)
mean(ln_dens)
median(ln_dens)
skewness(ln_dens)
kurtosis(ln_dens)
exp(mean(ln_dens)) # Média mais representativa
