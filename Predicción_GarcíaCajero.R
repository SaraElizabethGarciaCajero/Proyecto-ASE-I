#ASE_ SaraElizabethGarcíaCajero

#Instalamos librerías
install.packages('aTSA')
library(aTSA)
install.packages('astsa')
library(astsa)
install.packages('forecast')
library(forecast)
install.packages('GeneCycle')
library(GeneCycle)
install.packages('TSA')
library(TSA)
install.packages('xts')
library(xts)
install.packages('bayesforecast')
library(bayesforecast)


#Leemos el archivo que contiene el porcentaje de embarazos adolescentes desde el año 1994-2021
df = read.csv("C:/Users/sara1/Downloads/Embarazo94.csv")
data = xts(df[,-1],order.by = as.Date(as.yearmon(df[,1])))

acf(data,lag=100)
pacf(data,lag.max=100)
#arima= AR : Modelo autoregresivo, I : cuántos lags tiene (retrasos), MA : Contiene variables media móviles
auto.arima(data)
#nuestra solución dada ppor ARIMA fue (2,0,0)
modelo = arima(data,c(2,0,0))
autoplot(modelo)
plot(data)
