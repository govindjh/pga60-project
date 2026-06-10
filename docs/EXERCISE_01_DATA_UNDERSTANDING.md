# Exercise 01: Data Understanding

## Goal
Learn how to inspect a raw dataset like a data analyst.

## Why This Step Matters
Before cleaning or dashboarding, analysts first understand:
- How many rows and columns exist
- What each column means
- Which fields are numeric, date, or text
- Which columns have missing or messy data
- Which columns are useful for business analysis

## Python Code To Run

```python
import pandas as pd

file_path = r"C:\Users\caros\Downloads\Delhi_NCR_Delivery_Operations_Raw.csv"

df = pd.read_csv(file_path)

print("Rows and Columns:")
print(df.shape)

print("\nColumn Names:")
print(df.columns)

print("\nFirst 5 Rows:")
print(df.head())

print("\nData Types:")
print(df.dtypes)

print("\nMissing Values:")
print(df.isna().sum().sort_values(ascending=False))
```

## What You Should Notice

### Dataset Size
The dataset has:
- 30,800 rows
- 22 columns

### Fully Missing Column
`Legacy_Marketing_ID` is missing for all rows. This means it is not useful for analysis.

### Messy Rating Column
`Rider_Rating_Raw` has values like:
- `Terrible`
- `4.5 stars`
- `2.0`

This column needs cleaning before analysis.

### Date Column
`Order_Timestamp` is currently read as text. We need to convert it into a proper datetime field.

### Target Column
`SLA_Breached` is very important:
- `1` means late delivery
- `0` means on-time delivery

This is the main performance column for the project.

## Mini Task
Write answers to these questions:

1. How many rows are in the dataset?
2. How many columns are in the dataset?
3. Which column tells us whether an order was late?
4. Which column tells us the dark store?
5. Which column needs cleaning because ratings are written in mixed formats?

## Expected Answers

1. 30,800
2. 22
3. `SLA_Breached`
4. `Dark_Store_ID`
5. `Rider_Rating_Raw`
