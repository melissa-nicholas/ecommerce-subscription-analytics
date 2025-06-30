import csv

# Input/output paths
input_path = 'dbt_project/seeds/personality/customer_personality.csv'
output_path = 'dbt_project/seeds/personality/customer_personality_clean.csv'

# Read tab-delimited, write comma-delimited
with open(input_path, 'r') as infile, open(output_path, 'w', newline='') as outfile:
    reader = csv.reader(infile, delimiter='\t')
    writer = csv.writer(outfile)
    for row in reader:
        writer.writerow(row)

print("✅ File cleaned and saved as customer_personality_clean.csv")
