import streamlit as st
import duckdb
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as mtick

# ─────────────────────────────────────────────────────────────
# LOAD & PREPROCESS DATA
# ─────────────────────────────────────────────────────────────

con = duckdb.connect('dbt_project/ecommerce.duckdb', read_only=True)
df = con.execute("SELECT * FROM fct_customer_personalities").fetchdf()
con.close()

# Churn flag: customers with recency > 60 are considered churned
df['is_churned'] = (df['recency'] > 60).astype(int)

# Enrich data
df['age'] = 2025 - df['year_birth']
df['age_group'] = pd.cut(df['age'], bins=[0, 30, 40, 50, 60, 100], labels=["<30", "30–39", "40–49", "50–59", "60+"])
df['income_group'] = pd.cut(df['income'], bins=[0, 30000, 60000, 90000, 120000, float('inf')],
                            labels=["<30k", "30–60k", "60–90k", "90–120k", "120k+"])
df['family_size'] = df['kidhome'] + df['teenhome']

# ─────────────────────────────────────────────────────────────
# SIDEBAR FILTERS
# ─────────────────────────────────────────────────────────────

st.sidebar.header("🔍 Filters")
edu_options = df['education'].unique().tolist()
selected_edu = st.sidebar.multiselect("Education Level", edu_options, default=edu_options)
df = df[df['education'].isin(selected_edu)]

# ─────────────────────────────────────────────────────────────
# DASHBOARD LAYOUT
# ─────────────────────────────────────────────────────────────

st.title("📈 Customer Churn Dashboard")
st.write("✅ Data loaded:", df.shape)

# ─────────────────────────────────────────────────────────────
# KEY METRICS
# ─────────────────────────────────────────────────────────────

st.header("📊 Key Metrics")
total_customers = len(df)
churned = df['is_churned'].sum()
churn_rate = churned / total_customers

col1, col2, col3 = st.columns(3)
col1.metric("Total Customers", f"{total_customers:,}")
col2.metric("Churned", f"{churned:,}")
col3.metric("Churn Rate", f"{churn_rate:.1%}")

# ─────────────────────────────────────────────────────────────
# CHURN OVERVIEW PIE CHART
# ─────────────────────────────────────────────────────────────

st.header("🧩 Churn Overview")
churn_counts = df['is_churned'].value_counts()

fig, ax = plt.subplots()
ax.pie(churn_counts, labels=["Active", "Churned"], autopct='%1.1f%%', startangle=90)
ax.axis('equal')
st.pyplot(fig)

# ─────────────────────────────────────────────────────────────
# CHURN BREAKDOWNS
# ─────────────────────────────────────────────────────────────

st.header("📉 Churn by Demographics")

def plot_churn_rate(group_col, title, xlabel):
    churn_group = df.groupby(group_col)['is_churned'].mean().sort_index()
    fig, ax = plt.subplots()
    bars = ax.bar(churn_group.index.astype(str), churn_group.values, color='skyblue')
    ax.set_ylabel("Churn Rate")
    ax.set_ylim(0, 1)
    ax.set_xlabel(xlabel)
    ax.set_title(title)
    ax.yaxis.set_major_formatter(mtick.PercentFormatter(1.0))
    for bar in bars:
        height = bar.get_height()
        ax.annotate(f'{height:.1%}', xy=(bar.get_x() + bar.get_width() / 2, height),
                    xytext=(0, 3), textcoords="offset points",
                    ha='center', va='bottom')
    st.pyplot(fig)

plot_churn_rate('age_group', "Churn Rate by Age Group", "Age Group")
plot_churn_rate('income_group', "Churn Rate by Income Group", "Income Group")
plot_churn_rate('family_size', "Churn Rate by Family Size", "Family Size")
plot_churn_rate('education', "Churn Rate by Education", "Education Level")

# ─────────────────────────────────────────────────────────────
# KEY INSIGHTS
# ─────────────────────────────────────────────────────────────

st.markdown("## Key Takeaways")
st.markdown("""
- **Higher income customers churn less**, especially above $90k.
- **Family size of 1–2 has higher churn** than singles or large families.
- **Higher education** shows slightly improved retention.
""")
