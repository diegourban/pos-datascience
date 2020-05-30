#----------------------------------------------------------------------------------------------------
# Script do Exercício Preparatório
#----------------------------------------------------------------------------------------------------

library(fBasics)

imprime_enunciado_questao <- function (enunciado) {
  cat("", "\n")
  cat("------------------------------------------------------------------------------------------------------------------------------------------------------", "\n")
  cat(enunciado, "\n")
  cat("------------------------------------------------------------------------------------------------------------------------------------------------------", "\n")
}

# Carregando o df.
df <- read.csv("Exercício Preparatório.csv", header = T, sep = ";", dec = ",")

# Questão 1: As medidas de tendência central das variáveis numéricas (mínimo, máximo, 1o Quartil, 3o Quartil, mediana e média).
imprime_enunciado_questao("Questão 1: As medidas de tendência central das variáveis numéricas (mínimo, máximo, 1o Quartil, 3o Quartil, mediana e média).")
cat("Salário", "\n")
summary(df$salario)

cat("\nIdade", "\n")
summary(df$idade)

cat("\nStress", "\n")
summary(df$stress)

# Questão 2: As medidas de dispersão das variáveis numéricas (amplitude, desvio-padrão, variância, coeficiente de variação, assimetria e curtose).
imprime_enunciado_questao("Questão 2: As medidas de dispersão das variáveis numéricas (amplitude, desvio-padrão, variância, coeficiente de variação, assimetria e curtose).")

## Salário
cat("Salário", "\n")
cat("Amplitude = ", max(df$salario)-min(df$salario), "\n")
cat("Desvio Padrão = ", sd(df$salario), "\n")
cat("Variância = ", var(df$salario), "\n")
cat("Coeficiente de Variação = ", sd(df$salario) / mean(df$salario), "\n")
cat("Assimetria = ", skewness(df$salario), "\n")
cat("Curtose = ", kurtosis(df$salario), "\n")
# ou basicStats(df$salario)

## Idade
cat("\nIdade", "\n")
cat("Amplitude = ", max(df$idade)-min(df$idade), "\n")
cat("Desvio Padrão = ", sd(df$idade), "\n")
cat("Variância = ", var(df$idade), "\n")
cat("Coeficiente de Variação = ", sd(df$idade) / mean(df$idade), "\n")
cat("Assimetria = ", skewness(df$idade), "\n")
cat("Curtose = ", kurtosis(df$idade), "\n")

## Stress
cat("\nStress", "\n")
cat("Amplitude = ", max(df$stress)-min(df$stress), "\n")
cat("Desvio Padrão = ", sd(df$stress), "\n")
cat("Variância = ", var(df$stress), "\n")
cat("Coeficiente de Variação = ", sd(df$stress) / mean(df$stress), "\n")
cat("Assimetria = ", skewness(df$stress), "\n")
cat("Curtose = ", kurtosis(df$stress), "\n")

# Questão 3: Calcule a média e a mediana do salário para homens e mulheres separadamente.
imprime_enunciado_questao("Questão 3: Calcule a média e a mediana do salário para homens e mulheres separadamente.")
df_homens <- subset(df, (sexo == 0))
df_mulheres <- subset(df, (sexo == 1))

cat("Homens", "\n")
cat("Média = ", mean(df_homens$salario), "\n")
cat("Mediana = ", median(df_homens$salario), "\n")

cat("\nMulheres", "\n")
cat("Média = ", mean(df_mulheres$salario), "\n")
cat("Mediana = ", median(df_mulheres$salario), "\n")

# Questão 4: Calcule o desvio-padrão e o coeficiente de variação do salário para homens e mulheres separadamente e verifique se existe diferença nas variações.
imprime_enunciado_questao("Questão 4: Calcule o desvio-padrão e o coeficiente de variação do salário para homens e mulheres separadamente e verifique se existe diferença nas variações.")
cat("Homens", "\n")
cat("Desvio Padrão = ", sd(df_homens$salario), "\n")
cat("Coeficiente de Variação = ", sd(df_homens$salario) / mean(df_homens$salario), "\n")
        
cat("\nMulheres", "\n")
cat("Desvio Padrão = ", sd(df_mulheres$salario), "\n")
cat("Coeficiente de Variação = ", sd(df_mulheres$salario) / mean(df_mulheres$salario), "\n")

# Questão 5: Calcule a média e a mediana do salário para casado e solteiros separadamente.
imprime_enunciado_questao("Questão 5: Calcule a média e a mediana do salário para casado e solteiros separadamente.")
df_casados <- subset(df, (est_civil == 1))
df_solteiros <- subset(df, (est_civil == 0))

cat("Casados", "\n")
cat("Média = ", mean(df_casados$salario), "\n")
cat("Mediana = ", median(df_casados$salario), "\n")

cat("\nSolteiros", "\n")
cat("Média = ", mean(df_solteiros$salario), "\n")
cat("Mediana = ", median(df_solteiros$salario), "\n")

# Questão 6: Calcule a média e a mediana do nível de stress para homens e mulheres separadamente.
imprime_enunciado_questao("Questão 6: Calcule a média e a mediana do nível de stress para homens e mulheres separadamente.")
cat("Homens", "\n")
cat("Média = ", mean(df_homens$stress), "\n")
cat("Mediana = ", median(df_homens$stress), "\n")

cat("\nMulheres", "\n")
cat("Média = ", mean(df_mulheres$stress), "\n")
cat("Mediana = ", median(df_mulheres$stress), "\n")

# Questão 7: Calcule a média e a mediana do nível de stress para casado e solteiros separadamente.
imprime_enunciado_questao("Questão 7: Calcule a média e a mediana do nível de stress para casado e solteiros separadamente.")
cat("Casados", "\n")
cat("Média = ", mean(df_casados$stress), "\n")
cat("Mediana = ", median(df_casados$stress), "\n")

cat("\nSolteiros", "\n")
cat("Média = ", mean(df_solteiros$stress), "\n")
cat("Mediana = ", median(df_solteiros$stress), "\n")

# Questão 8: Faça um gráfico de dispersão que compare o nível de stress com o salário do entrevistado.
imprime_enunciado_questao("Questão 8: Faça um gráfico de dispersão que compare o nível de stress com o salário do entrevistado.")
stress <- df$stress
salario <- df$salario

plot(stress~salario, xlab="Salário", ylab="Nível de Estresse (0 - 100)", main="Questão 8: Nível de Estresse X Salário")
model <- lm(stress~salario)    
abline(model, col="red")
abline(h=mean(df$stress), col="green")
abline(v=mean(df$salario), col="green")
cat("Ver PDF gerado...", "\n")

# Questão 9: Faça um gráfico de dispersão que compare o nível de stress com a idade do entrevistado.
imprime_enunciado_questao("Questão 9: Faça um gráfico de dispersão que compare o nível de stress com a idade do entrevistado.")
stress <- df$stress
idade <- df$idade

plot(stress~idade, xlab="Idade", ylab="Nível de Estresse (0 - 100)", main="Questão 9: Nível de Estresse X Idade")
model <- lm(stress~idade)    
abline(model, col="red")
abline(h=mean(df$stress), col="green")
abline(v=mean(df$idade), col="green")
cat("Ver PDF gerado...", "\n")

# Questão 10: Faça um gráfico box-plot das variáveis numéricas e verifique se existe a presença de outliers.
imprime_enunciado_questao("Questão 10: Faça um gráfico box-plot das variáveis numéricas e verifique se existe a presença de outliers.")
boxplot(df$salario, ylab="Salário", main="Questão 10: Distribuição do Salário dos entrevistados")
boxplot(df$idade, ylab="Idade", main="Questão 10: Distribuição da Idade dos entrevistados")
boxplot(df$stress, ylab="Nível de Estresse (0 - 100)", main="Questão 10: Distribuição do Nível de Estresse dos entrevistados")
cat("Ver PDF gerado...", "\n")

## Extra
#boxplot(df$salario ~ df$sexo)
#boxplot(df$idade ~ df$stress)
#boxplot(df$idade ~ df$sexo)
#boxplot(df$salario ~ df$idade)

# Questão 11: Considerando a média e o desvio-padrão para as mulheres, verifique qual a probabilidade de uma melhor receber acima do 3o quartil. 
imprime_enunciado_questao("Questão 11: Considerando a média e o desvio-padrão para as mulheres, verifique qual a probabilidade de uma melhor receber acima do 3o quartil. ")
# E qual as chances de um homem? Assuma a distribuição normal para os dados.

# Funções da distribuição normal:
# dnorm() - gerar a densidade da probabilidade, P(X=x).
# pnorm() - gerar a probabilidade de ocorrência de até um valor x, P(X<=x).
# qnorm() - fornecendo a probabilidade acumulada(de um intervalo), retoma o valor que gera ela, 0 <= q <= 1
# rnorm() - gera um vetor de números aleatórios de distribuição normal.

# Para o caso das mulheres
media_mulher <- mean(df_mulheres$salario)
dp_mulher <- sd(df_mulheres$salario)

q3 <- quantile(df$salario, probs=0.75)

# Probabilidade de uma mulher receber mais que o Q3
# P(Sal > Q3) = 1 - P(Sal <= Q3)
prob_mulher_salario_maior_q3 <- 1 - pnorm(q3, mean = media_mulher, sd = dp_mulher)
# Aproximadamente 15%

cat("Probabilidade de uma mulher receber mais que o Q3 = ", prob_mulher_salario_maior_q3, "\n")

# Para o caso dos homens
media_homem <- mean(df_homens$salario)
dp_homem <- sd(df_homens$salario)

q3 <- quantile(df$salario, probs=0.75)
prob_homem_salario_maior_q3 <- 1 - pnorm(q3, mean = media_homem, sd = dp_homem)
# Aproximadamente 31%

cat("Probabilidade de um homem receber mais que o Q3 = ", prob_homem_salario_maior_q3, "\n")

# Questão 12: Considerando a distribuição normal, com a média e o desvio-padrão dos casados, quais as chances do nível de stress de um destes respondentes ser menor do que 50 (metade da escala).
imprime_enunciado_questao("Questão 12: Considerando a distribuição normal, com a média e o desvio-padrão dos casados, quais as chances do nível de stress de um destes respondentes ser menor do que 50 (metade da escala).")
media_casados <- mean(df_casados$stress)
dp_casados <- sd(df_casados$stress)

prob_casado_stress_menor_50 <- pnorm(50, mean = media_casados, sd = dp_casados)
# Aproximadamente 32%

cat("Probabilidade de casados com nível de estresse menor que 50 = ", prob_casado_stress_menor_50, "\n")
