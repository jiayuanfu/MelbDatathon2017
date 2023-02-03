# **Melbourne Datathon 2017**

Submission for Melbourne Datathon 2017, a Kaggle competition that consists of two parts: predicting diabetes development and delivering a data analytics/business analytics presentation.

## **Data**

The data used in this competition is not included in this repository. It is recommended to download the data from Kaggle for those who wish to run this code.

## Part 1: **Predicting Diabetes Development**

The code is used to generate prediction for the Kaggle Melbourne Datathon 2017 competition with a selection of machine learning models. 

For the data pipeline, the raw data has been uploaded and transformed to features by mySQL.  The machine learning models were built using **`scikit-learn`** to predict if a person would develop diabetes in the coming year based on a provided dataset. 

### Tech Stack:

- scikit-learn
- mySQL

## Part 2: Insight Competition

A data analytics/business analytics presentation was delivered, detailing an investment strategy for Chemist House. The graphs in the presentation was created using Tableau and can be found in the file **`Harvest your investment on Chemist House.pdf`**.

### Tech Stack:

- mySQL
- Tableau
- Presentation

## Structure of the code

- code
    - **load_mysqldata.sql** : SQL query to upload raw data to DB.
    - **analysis.sql** : SQL query to generate features, training data and test data for the prediction competition.
    - **visualization.sql** : SQL query to run some analysis to support the insight competition, the output are save in visualization/SQL_DA_output dir for refreshing the Tableau Dashboard.
    - **model.ipynb** :  The python modeling solution for the prediction competition.
- data
    - **Lookups** : This is the dir to store the original data, which includes patient info, store info, drug info etc…
    - **MISSING_TRANSACTIONS** : This is the dir to store the original missing data.
    - **Transactions** : This is the dir to store the original transaction data.
    - **prediction** :  ****This is the dir to store the prediction submission for prediction competition.
    - **train** : This is the dir to store the training data, validation data and test data
- visualization
    - **SQL_DA_output**: This is the dir to store the output from analysis.sql. It is the input data for building the Tableau dashboard for the presentation.
    - All the other data in this dir are public data for supporting the analysis.
- Harvest your investment on Chemist House.pdf : My presentation for the Part 2 insight competition.
- Melbourne Datathon 2017 Instruction.pdf : The instruction of the competition.
