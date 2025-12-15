# Air Pollution Analysis - Asuncion, Paraguay 2024
# Author: Miguel Angel Rosemberg
# Description: Analysis and visualization of PM2.5 data.

# -----------------------------------------------------------------------------
# Libraries
# -----------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
library(tidyr)
library(tibble)
library(rgl)
library(rayshader)
library(ggthemes)
library(viridis)

# -----------------------------------------------------------------------------
# Data Loading & Preprocessing
# -----------------------------------------------------------------------------
# NOTE: Ensure your working directory is set to the project root.
data_path <- "data/Hourly_pm25_Asu.csv"

if (!file.exists(data_path)) {
  stop("Data file not found. Please ensure working directory is correct.")
}

data <- read.csv(data_path)

# Convert dates and times
data$fecha <- as.Date(data$date, format="%m/%d/%Y")
data$hour_fmt <- format(as.POSIXct(data$hour, format="%H:%M"), format="%H:%M:%S")
data$hora_del_dia <- as.numeric(sub(":.*", "", data$hour_fmt))  # Extract hour as numeric
data$Pm2.5 <- as.numeric(data$median)

# Filter data from August 30th onwards
data <- data %>% filter(fecha >= as.Date("2024-08-30"))

# Create datetime column
data$datetime <- as.POSIXct(paste(data$fecha, data$hour_fmt), format="%Y-%m-%d %H:%M:%S")

# -----------------------------------------------------------------------------
# Visualization 1: PM 2.5 Over Time (Line Plot)
# -----------------------------------------------------------------------------
p_line <- ggplot(data, aes(x=datetime, y=Pm2.5)) +
  geom_line(color = "steelblue") +
  labs(
    title = "PM 2.5 Values Over Time (Asunción)",
    subtitle = "Data from August 30, 2024",
    x = "Datetime",
    y = "PM 2.5 (µg/m³)"
  ) +
  theme_minimal()

print(p_line)

# -----------------------------------------------------------------------------
# Visualization 2: Heatmap
# -----------------------------------------------------------------------------
p_heatmap <- ggplot(data, aes(x = fecha, y = hora_del_dia)) + 
  geom_tile(aes(fill = Pm2.5)) +
  scale_x_date(breaks = "1 week", date_labels = "%b %d", expand = c(0,0)) + 
  coord_equal(ratio = 1) + 
  scale_fill_viridis(option = "magma", name = "PM 2.5") +
  labs(
    title = "Hourly PM 2.5 Concentration",
    x = "Date",
    y = "Hour of Day"
  ) +
  theme_tufte()

print(p_heatmap)

# -----------------------------------------------------------------------------
# 3D Visualization (Rayshader)
# -----------------------------------------------------------------------------
# Set to TRUE to render 3D plots
RUN_3D <- FALSE 

if (RUN_3D) {
  plot_gg(p_heatmap, multicore = TRUE, width = 5, height = 5, 
          scale = 250, windowsize = c(1400, 866), zoom = 0.55, phi = 30)
  
  # Render movie
  # render_movie("air_polution.mp4", frames = 1080, fps = 60, zoom = 0.6, fov = 30)
}
