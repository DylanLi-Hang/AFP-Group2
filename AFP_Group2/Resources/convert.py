import pandas as pd

# Load the Excel file
file_path = 'Misconceptions.xlsx'
df = pd.read_excel(file_path)

# Convert the DataFrame to JSON
json_data = df.to_json(orient='records', indent=4)

# You can then use json_data as needed, for example, print it or write it to a file
print(json_data)
with open('data.json', 'w') as f:
    f.write(json_data)
