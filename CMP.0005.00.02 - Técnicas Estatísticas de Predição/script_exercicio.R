#----------------------------------------------------------------------------------------------------
# Script do Exercício Preparatório
#----------------------------------------------------------------------------------------------------

# Carregando o df.
df <- read.csv("Exercício Preparatório.csv", header = T, sep = ";", dec = ",")

# Questão 1: As medidas de tendência central das variáveis numéricas (mínimo, máximo, 1o Quartil, 3o Quartil, mediana e média).
summary(df$salario)
summary(df$idade)
summary(df$stress)

# Questão 2: As medidas de dispersão das variáveis numéricas (amplitude, desvio-padrão, variância, coeficiente de variação, assimetria e curtose).
library(fBasics)

## Salário
max(df$salario)-min(df$salario)
sd(df$salario)
var(df$salario)
sd(df$salario) / mean(df$salario)
skewness(df$salario)
kurtosis(df$salario)

# ou basicStats(df$salario)

## Idade
max(df$idade)-min(df$idade)
sd(df$idade)
var(df$idade)
sd(df$idade) / mean(df$idade)
skewness(df$idade)
kurtosis(df$idade)

## Stress
max(df$stress)-min(df$stress)
sd(df$stress)
var(df$stress)
sd(df$stress) / mean(df$stress)
skewness(df$stress)
kurtosis(df$stress)

# Questão 3: Calcule a média e a mediana do salário para homens e mulheres separadamente.
df_homens <- subset(df, (sexo == 0))
df_mulheres <- subset(df, (sexo == 1))

mean(df_homens$salario)
median(df_homens$salario)

mean(df_mulheres$salario)
median(df_mulheres$salario)

# Questão 4: Calcule o desvio-padrão e o coeficiente de variação do salário para homens e mulheres separadamente e verifique se existe diferença nas variações.
### Desvio Padrão
sd(df_homens$salario)
sd(df_mulheres$salario)

### Coeficiente de Variação
sd(df_homens$salario) / mean(df_homens$salario)
sd(df_mulheres$salario) / mean(df_mulheres$salario)

# Questão 5: Calcule a média e a mediana do salário para casado e solteiros separadamente.
df_solteiros <- subset(df, (est_civil == 0))
df_casados <- subset(df, (est_civil == 1))

mean(df_solteiros$salario)
median(df_solteiros$salario)

mean(df_casados$salario)
median(df_casados$salario)

# Questão 6: Calcule a média e a mediana do nível de stress para homens e mulheres separadamente.
mean(df_homens$stress)
median(df_homens$stress)

mean(df_mulheres$stress)
median(df_mulheres$stress)

# Questão 7: Calcule a média e a mediana do nível de stress para casado e solteiros separadamente.
mean(df_solteiros$stress)
median(df_solteiros$stress)

mean(df_casados$stress)
median(df_casados$stress)

# Questão 8: Faça um gráfico de dispersão que compare o nível de stress com o salário do entrevistado.
stress <- df$stress
salario <- df$salario

plot(stress~salario, xlab="Salário", ylab="Stress", main="Stress X Salário")
model <- lm(stress~salario)    
abline(model, col="red")
abline(h=mean(df$stress), col="green")
abline(v=mean(df$salario), col="green")

# Questão 9: Faça um gráfico de dispersão que compare o nível de stress com a idade do entrevistado.
stress <- df$stress
idade <- df$idade

plot(stress~idade, xlab="Idade", ylab="Stress", main="Stress X Idade")
model <- lm(stress~idade)    
abline(model, col="red")
abline(h=mean(df$stress), col="green")
abline(v=mean(df$idade), col="green")

# Questão 10: Faça um gráfico box-plot das variáveis numéricas e verifique se existe a presença de outliers.
boxplot(df$salario)
boxplot(df$idade)
boxplot(df$stress)

## Extra
boxplot(df$salario ~ df$sexo)
boxplot(df$idade ~ df$stress)
boxplot(df$idade ~ df$sexo)
boxplot(df$salario ~ df$idade)

# Questão 11: Considerando a média e o desvio-padrão para as mulheres, verifique qual a probabilidade de uma melhor receber acima do 3o quartil. 
# E qual as chances de um homem? Assuma a distribuição normal para os dados.

# Funções da distribuição normal:
# dnorm() - gerar a densidade da probabilidade, P(X=x).
# pnorm() - gerar a probabilidade de ocorrência de até um valor x, P(X<=x).
# qnorm() - fornecendo a probabilidade acumulada(de um intervalo), retoma o valor que gera ela, 0 <= q <= 1
# rnorm() - gera um vetor de números aleatórios de distribuição normal.

# Para o caso das mulheres
media_mulher <- mean(df_mulheres$salario)
dp_mulher <- sd(df_mulheres$salario)

q3 <- quantile(dados$salario, probs=0.75)

# Probabilidade de uma mulher receber mais queo Q3
# P(Sal > Q3) = 1 - P(Sal <= Q3)
1 - pnorm(q3, mean = media_mulher, sd = dp_mulher)
# Aproximadamente 15%

# Para o caso dos homens
media_homem <- mean(df_homens$salario)
dp_homem <- sd(df_homens$salario)

q3 <- quantile(dados$salario, probs=0.75)
1 - pnorm(q3, mean = media_homem, sd = dp_homem)
# Aproximadamente 31%

# Questão 12: Considerando a distribuição normal, com a média e o desvio-padrão dos casados, quais as chances do nível de stress de um destes respondentes ser menor do que 50 (metade da escala).
