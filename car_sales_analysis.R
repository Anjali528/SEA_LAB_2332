# SEA LAB NOVEMBER 2025
# ROLL NO: 2332
# BATCH : B

# -------------------------------------------------------
# Car Sales Data – Full Analysis with All Major Graph Types
# -------------------------------------------------------

# Install & load required packages
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)
library(lubridate)

# ------------------------
# Load the CSV file
# ------------------------
df <- read_csv(
  "C:\\Users\\ANJALI DESAI\\Downloads\\car_sales.csv",
  col_types = cols(
    Date = col_date(format = "%Y-%m-%d")
  )
)

# Create additional columns
df <- df %>%
  mutate(
    YearMonth = floor_date(Date, "month"),
    Revenue   = Units_Sold * Price
  )

# =======================================================
# CREATE GRAPH OBJECTS
# =======================================================

# 1) Histogram
hist_plot <- ggplot(df, aes(x = Units_Sold)) +
  geom_histogram(bins = 8, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Units Sold", x = "Units Sold", y = "Count") +
  theme_minimal()

# 2) Scatter Plot
scatter_plot <- ggplot(df, aes(x = Price, y = Units_Sold, color = Brand)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot: Price vs Units Sold",
       x = "Price", y = "Units Sold") +
  theme_minimal()

# 3) Box Plot
box_plot <- ggplot(df, aes(x = Brand, y = Units_Sold, fill = Brand)) +
  geom_boxplot() +
  labs(title = "Box Plot: Units Sold by Brand", x = "Brand", y = "Units Sold") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 4) Line Plot
monthly_sales <- df %>%
  group_by(YearMonth) %>%
  summarise(Total_Units = sum(Units_Sold))

line_plot <- ggplot(monthly_sales, aes(x = YearMonth, y = Total_Units)) +
  geom_line(size = 1.2, color = "blue") +
  geom_point(size = 3) +
  labs(title = "Line Plot: Monthly Sales Trend",
       x = "Month", y = "Units Sold") +
  theme_minimal()

# 5) Bar Plot
model_totals <- df %>%
  group_by(Model) %>%
  summarise(Total_Units = sum(Units_Sold))

bar_plot <- ggplot(model_totals, aes(x = reorder(Model, Total_Units), y = Total_Units)) +
  geom_col(fill = "orange") +
  coord_flip() +
  labs(title = "Bar Plot: Units Sold by Model",
       x = "Model", y = "Units Sold") +
  theme_minimal()

# 6) Pie Chart
fuel_share <- df %>%
  group_by(Fuel_Type) %>%
  summarise(Total = sum(Units_Sold))

pie_plot <- ggplot(fuel_share, aes(x = "", y = Total, fill = Fuel_Type)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Pie Chart: Fuel Type Distribution") +
  theme_void()

# =======================================================
# STEP 1 — VISUALIZE ALL PLOTS IN R (Important!)
# =======================================================

print(hist_plot)
print(scatter_plot)
print(box_plot)
print(line_plot)
print(bar_plot)
print(pie_plot)

# =======================================================
# STEP 2 — GENERATE PDF WITH ALL PLOTS
# =======================================================

pdf("C:/Users/ANJALI DESAI/Downloads/Car_Sales_All_Graphs.pdf",
    width = 10, height = 8)

print(hist_plot)
print(scatter_plot)
print(box_plot)
print(line_plot)
print(bar_plot)
print(pie_plot)

dev.off()

cat("\nPDF Saved in Downloads: Car_Sales_All_Graphs.pdf\n")
