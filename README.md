# ApiaR

The ´ApiaR´ package generates economic time series forecasts. Economic activity is a monthly proxy for GDP that is only available quarterly. This package was originally developed to be used in the Ministry of Finance (Brazil) in Matlab and later ported to R. APIA is an acronym to "Análise e Projeção de Indicadores de Atividade (econômica)". This package requires access to a MySQL database where time series data is stored. The forecast is constructed as new data appears so that the structure changes form estimated components to actual observed data as time goes by. 
