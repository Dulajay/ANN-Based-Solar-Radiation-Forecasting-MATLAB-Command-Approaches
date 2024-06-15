# ANN Based Solar Radiation Forecasting MATLAB Command Approach

This repository contains the data, source code, and report for the study on the performance of artificial neural network (ANN) models for weather data analysis using datasets collected from multiple weather stations in Sydney, Australia.

## Overview

The research compares ANN models constructed using a GUI-based tool (`nnstart`) and MATLAB commands (`newff`, `traingd`, `newrb`) to model solar exposure patterns over a year. The study focuses on the accuracy and generalization of the models across different seasons.

## Repository Structure

- **data/**: Contains the raw and processed datasets.
  - `sydney_weather_data.csv`: Raw weather data collected from various Sydney stations.
  - `processed_data.csv`: Processed data used for training the ANN models.
- **src/**: Contains the source code for both GUI-based and MATLAB command approaches.
  - Scripts and results for the GUI-based approach.
  - Scripts and results for the MATLAB command approach.
    - `feed_forward.m`: Script for feedforward gradient descent backpropagation.
    - `radial_basis.m`: Script for radial basis function analysis.
- **report/**: Contains the final report in PDF format.
  - `Report.pdf`: The full report.

## Data Collection and Preprocessing

Daily solar radiation data and meteorological variables were collected from the following weather stations for the period from May 2023 to May 2024:

- Sydney City, Sydney NSW (Station No. 0067119)
- Blacktown, Horsley Park NSW (Station No. 066214)
- Earlwood, Canterbury Racecourse AWS NSW (Station No. 066194)
- Randwick, Sydney Airport AMO (Station No. 066037)
- Rozelle, Terry Hills AWS (Station No. 066059)

The collected data included:
- Minimum Temperature
- Maximum Temperature
- Rainfall
- Maximum Wind Speed
- Solar Exposure

Min-Max Normalization was applied to normalize the input features. The normalized dataset was then divided into training (70%), validation (15%), and testing (15%) sets.

## Methods

### GUI-Based Approach (`nnstart`)

The GUI-based tool `nnstart` was used to explore various input combinations to optimize the input-output mapping performance for solar radiation forecasting. The Levenberg-Marquardt backpropagation algorithm was employed for training the neural network models.

### MATLAB-Based Approach

ANN models were implemented using MATLAB commands `newff`, `traingd`, and `newrb`. Training rules such as feedforward gradient descent backpropagation and radial basis function were applied.

## Results and Analysis

The performance of both approaches was evaluated based on several metrics, including the number of hidden neurons, training epochs, Mean Squared Error (MSE), and regression analysis.

### GUI-Based Approach Results

- Optimal configuration achieved with 100 hidden neurons.
- Lowest MSE: 18.25

### MATLAB-Based Approach Results

- Feedforward Gradient Descent Backpropagation (FFBP) outperformed Radial Basis Function (RBF).
- Best MSE during training, validation, and testing phases achieved by FFBP.

## Conclusion

The study provides valuable insights into the performance of ANN models for solar radiation forecasting. The GUI-based approach demonstrated the capability to construct accurate models, while the MATLAB-based approach, particularly the FFBP algorithm, showed superior predictive accuracy.

## References

1. [Gradient descent backpropagation - MATLAB traingd](https://www.mathworks.com/help/deeplearning/ref/traingd.html)
2. [Fit data with a shallow neural network - MATLAB & Simulink](https://www.mathworks.com/help/deeplearning/gs/fit-data-with-a-neural-network.html)
3. MATLAB and R. LAB, [How to import training and testing data in neural network tool box in MATLAB?](https://www.youtube.com/watch?v=tXBmdselGzE), YouTube, Aug. 24, 2022.
4. [Climate data online - map search](http://www.bom.gov.au/climate/data/)
5. [North head [wind only], NSW - daily weather observations](http://www.bom.gov.au/climate/dwo/IDCJDW2192.latest.shtml)

