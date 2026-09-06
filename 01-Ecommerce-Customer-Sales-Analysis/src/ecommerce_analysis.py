from pathlib import Path
import urllib.request
import zipfile

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score


DATA_URL = "https://archive.ics.uci.edu/static/public/352/online+retail.zip"
DATA_FILE = Path("Online Retail.xlsx")
ZIP_FILE = Path("online_retail.zip")

OUTPUT_DIR = Path("outputs")
IMAGE_DIR = Path("images")
OUTPUT_DIR.mkdir(exist_ok=True)
IMAGE_DIR.mkdir(exist_ok=True)


def get_dataset():
    """Download and extract the UCI Online Retail dataset if needed."""
    if DATA_FILE.exists():
        print("Dataset already available locally.")
        return

    print("Downloading dataset from UCI...")
    urllib.request.urlretrieve(DATA_URL, ZIP_FILE)

    with zipfile.ZipFile(ZIP_FILE, "r") as z:
        z.extractall(".")

    print("Dataset downloaded and extracted.")


def load_data():
    df = pd.read_excel(DATA_FILE)
    print(f"Loaded {df.shape[0]:,} rows x {df.shape[1]} columns.")
    return df


def clean_data(df):
    clean_df = df.copy()

    clean_df = clean_df.drop_duplicates().copy()

    clean_df = clean_df[
        ~clean_df["InvoiceNo"].astype(str).str.startswith("C")
    ].copy()

    clean_df = clean_df[clean_df["Quantity"] > 0].copy()
    clean_df = clean_df[clean_df["UnitPrice"] > 0].copy()

    clean_df["Revenue"] = clean_df["Quantity"] * clean_df["UnitPrice"]
    clean_df["Month"] = clean_df["InvoiceDate"].dt.month
    clean_df["DayOfWeek"] = clean_df["InvoiceDate"].dt.day_name()
    clean_df["Hour"] = clean_df["InvoiceDate"].dt.hour

    return clean_df


def create_customer_data(clean_df):
    customer_df = clean_df.dropna(subset=["CustomerID"]).copy()
    customer_df["CustomerID"] = customer_df["CustomerID"].astype(int)
    return customer_df


def exploratory_analysis(clean_df, customer_df):
    total_revenue = clean_df["Revenue"].sum()
    total_orders = clean_df["InvoiceNo"].nunique()
    total_customers = customer_df["CustomerID"].nunique()

    top_products = (
        clean_df.groupby("Description")["Quantity"]
        .sum()
        .sort_values(ascending=False)
        .head(10)
    )

    top_countries = (
        clean_df.groupby("Country")["Revenue"]
        .sum()
        .sort_values(ascending=False)
        .head(10)
    )

    top_customers = (
        customer_df.groupby("CustomerID")["Revenue"]
        .sum()
        .sort_values(ascending=False)
        .head(10)
    )

    monthly_sales = (
        clean_df.groupby(clean_df["InvoiceDate"].dt.to_period("M"))["Revenue"]
        .sum()
    )

    print(f"Total Revenue: £{total_revenue:,.2f}")
    print(f"Total Orders: {total_orders:,}")
    print(f"Total Customers: {total_customers:,}")

    return {
        "total_revenue": total_revenue,
        "total_orders": total_orders,
        "total_customers": total_customers,
        "top_products": top_products,
        "top_countries": top_countries,
        "top_customers": top_customers,
        "monthly_sales": monthly_sales,
    }


def create_charts(results):
    plt.figure(figsize=(12, 6))
    results["monthly_sales"].plot(marker="o")
    plt.title("Monthly Revenue Trend")
    plt.xlabel("Month")
    plt.ylabel("Revenue (£)")
    plt.xticks(rotation=45)
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(IMAGE_DIR / "monthly_revenue.png", dpi=150, bbox_inches="tight")
    plt.close()

    plt.figure(figsize=(12, 6))
    results["top_products"].sort_values().plot(kind="barh")
    plt.title("Top 10 Best-Selling Products")
    plt.xlabel("Quantity Sold")
    plt.ylabel("Product")
    plt.tight_layout()
    plt.savefig(IMAGE_DIR / "top_products.png", dpi=150, bbox_inches="tight")
    plt.close()

    plt.figure(figsize=(12, 6))
    results["top_countries"].sort_values().plot(kind="barh")
    plt.title("Top 10 Countries by Revenue")
    plt.xlabel("Revenue (£)")
    plt.ylabel("Country")
    plt.tight_layout()
    plt.savefig(IMAGE_DIR / "top_countries.png", dpi=150, bbox_inches="tight")
    plt.close()

    plt.figure(figsize=(12, 6))
    results["top_customers"].sort_values().plot(kind="barh")
    plt.title("Top 10 Customers by Spending")
    plt.xlabel("Total Spending (£)")
    plt.ylabel("Customer ID")
    plt.tight_layout()
    plt.savefig(IMAGE_DIR / "top_customers.png", dpi=150, bbox_inches="tight")
    plt.close()


def build_rfm(customer_df):
    reference_date = customer_df["InvoiceDate"].max() + pd.Timedelta(days=1)

    rfm = customer_df.groupby("CustomerID").agg({
        "InvoiceDate": lambda x: (reference_date - x.max()).days,
        "InvoiceNo": "nunique",
        "Revenue": "sum",
    })

    rfm.columns = ["Recency", "Frequency", "Monetary"]
    return rfm


def segment_customers(rfm):
    rfm_features = rfm[["Recency", "Frequency", "Monetary"]].copy()

    rfm_log = np.log1p(rfm_features)

    scaler = StandardScaler()
    rfm_log_scaled = scaler.fit_transform(rfm_log)

    k_values = list(range(2, 11))

    inertia = []
    silhouette_scores = []

    for k in k_values:
        model = KMeans(n_clusters=k, random_state=42, n_init=10)
        labels = model.fit_predict(rfm_log_scaled)
        inertia.append(model.inertia_)
        silhouette_scores.append(silhouette_score(rfm_log_scaled, labels))

    plt.figure(figsize=(8, 5))
    plt.plot(k_values, inertia, marker="o")
    plt.title("Elbow Method After Log Transformation")
    plt.xlabel("Number of Clusters (K)")
    plt.ylabel("Inertia")
    plt.xticks(k_values)
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(IMAGE_DIR / "elbow_method.png", dpi=150, bbox_inches="tight")
    plt.close()

    plt.figure(figsize=(8, 5))
    plt.plot(k_values, silhouette_scores, marker="o")
    plt.title("Silhouette Scores by Number of Clusters")
    plt.xlabel("Number of Clusters (K)")
    plt.ylabel("Silhouette Score")
    plt.xticks(k_values)
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(IMAGE_DIR / "silhouette_scores.png", dpi=150, bbox_inches="tight")
    plt.close()

    final_model = KMeans(n_clusters=4, random_state=42, n_init=10)
    rfm["Cluster"] = final_model.fit_predict(rfm_log_scaled)

    profile = (
        rfm.groupby("Cluster")
        .agg(
            Recency=("Recency", "mean"),
            Frequency=("Frequency", "mean"),
            Monetary=("Monetary", "mean"),
            Customers=("Cluster", "size"),
        )
        .round(2)
    )

    remaining = set(profile.index)

    value_score = (
        profile["Frequency"].rank(pct=True)
        + profile["Monetary"].rank(pct=True)
        - profile["Recency"].rank(pct=True)
    )
    high_value_cluster = value_score.idxmax()
    remaining.remove(high_value_cluster)

    at_risk_cluster = profile.loc[list(remaining), "Recency"].idxmax()
    remaining.remove(at_risk_cluster)

    recent_cluster = profile.loc[list(remaining), "Recency"].idxmin()
    remaining.remove(recent_cluster)

    regular_cluster = remaining.pop()

    names = {
        high_value_cluster: "High-Value Loyal",
        at_risk_cluster: "At-Risk / Inactive",
        recent_cluster: "Recent / Promising",
        regular_cluster: "Regular Customers",
    }

    rfm["Segment"] = rfm["Cluster"].map(names)
    profile["Segment"] = profile.index.map(names)

    segment_counts = rfm["Segment"].value_counts()

    plt.figure(figsize=(10, 6))
    segment_counts.plot(kind="bar")
    plt.title("Customer Segments")
    plt.xlabel("Customer Segment")
    plt.ylabel("Number of Customers")
    plt.xticks(rotation=25)
    plt.tight_layout()
    plt.savefig(IMAGE_DIR / "customer_segments.png", dpi=150, bbox_inches="tight")
    plt.close()

    return rfm, profile


def export_results(clean_df, rfm, profile):
    clean_df.to_csv(OUTPUT_DIR / "online_retail_cleaned.csv", index=False)
    clean_df.head(5000).to_csv(
        OUTPUT_DIR / "online_retail_cleaned_sample.csv",
        index=False,
    )
    rfm.reset_index().to_csv(
        OUTPUT_DIR / "customer_segments.csv",
        index=False,
    )
    profile.reset_index().to_csv(
        OUTPUT_DIR / "cluster_profile.csv",
        index=False,
    )

    print("Output files created successfully.")


def main():
    get_dataset()

    df = load_data()
    clean_df = clean_data(df)
    customer_df = create_customer_data(clean_df)

    results = exploratory_analysis(clean_df, customer_df)
    create_charts(results)

    rfm = build_rfm(customer_df)
    rfm, profile = segment_customers(rfm)

    export_results(clean_df, rfm, profile)

    print("\nProject complete.")
    print("Charts are in ./images")
    print("CSV outputs are in ./outputs")


if __name__ == "__main__":
    main()
