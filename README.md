
# Car Price Prediction Using R  

## Project Overview  
This project involves predicting car prices using **R** by analyzing various car attributes such as **engine size, fuel type, car body, horsepower, and mileage**. The study applies **statistical analysis, data visualization, and machine learning models** to determine the key factors influencing car prices.  
 

## Objectives  
- Analyze a dataset of car features and prices.  
- Identify **key factors** affecting car prices using statistical techniques.  
- Use **data visualization** to explore correlations between variables.  
- Build a **linear regression model** to predict car prices.  
- Optimize the model by selecting only significant variables.  

## Technologies Used  
- **Programming Language**: R  
- **Libraries Used**:  
  - `tidyverse` (data manipulation & visualization)  
  - `GGally` (correlation plots)  
  - `caTools` (logistic regression)  
  - `ROCR` (ROC curve analysis)  
  - `corrplot` (correlation visualization)  
  - `caret` (model evaluation)  

## Dataset  
- The dataset (`carprice.csv`) contains various **car specifications** and **price information**.  
- Features include **engine size, fuel type, car weight, horsepower, mileage, and car body type**.  

## Data Analysis  
- **Descriptive Statistics**: Summary statistics and structure of the dataset.  
- **Data Visualization**:  
  - Scatter plots, histograms, and boxplots to understand relationships.  
  - Heatmaps to visualize variable correlations.  
  - Pair plots for multi-variable comparisons.  
- **Key Findings**:  
  - **Positive correlation** between price and **curb weight, engine size, car width**.  
  - **Negative correlation** between price and **mileage (MPG)**.  
  - Some variables (e.g., number of doors) do not significantly affect price.  

## Model Development  
- **Feature Selection**: Identified significant predictors using **p-values** (<0.05).  
- **Regression Model**: Built a **linear regression model** for price prediction.  
- **Model Evaluation**:  
  - **Adjusted R²**: 92.94% (shows strong predictive power).  
  - **RMSE (Root Mean Squared Error)** used to compare model performance.  
  - The refined model performed better than the initial model.  

## Conclusion  
The most important variables for **predicting car price** are:  
✔ **Aspiration**  
✔ **Engine location**  
✔ **Car width**  
✔ **Car height**  
✔ **Engine type**  
✔ **Number of cylinders**  
✔ **Stroke**  
✔ **Peak RPM**  

## How to Run the Project  
1. Load the dataset in **RStudio**.  
2. Run the provided **R script** to preprocess the data.  
3. Use `ggplot2` for visualizations.  
4. Build and evaluate the **linear regression model**.  
5. Interpret the results and optimize the model.  
