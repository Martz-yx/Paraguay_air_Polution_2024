# Paraguay Air Pollution Analysis 2024

> Report issued: September 9th, 2024  
> Analyst: Miguel Angel Rosemberg  
> Data Source: US Embassy Air Quality Records

## Overview

In September 2024, the air quality in Paraguay, specifically Asunción, was severely affected by climatological alerts due to fires in Brazil and the Paraguayan Chaco. This project analyzes the PM2.5 data during this period to visualize the impact on air quality.

## Situation Analysis

The air pollution situation deteriorated markedly starting September 6th, resulting in adverse health consequences. PM2.5 levels reached peaks of **120 µg/m³**, considered "Unhealthy" for normal breathing.

Prolonged wildfires enveloped the city in a cloud of smoke and ash. Despite protective measures by some, the potential health consequences remain a critical concern.

### Visualizations

<img width="100%" alt="Air Quality Graph" src="https://github.com/user-attachments/assets/dc143a4c-ad36-4a1c-a2e0-f10b556a9bd5" />

<img width="100%" alt="Air Quality Map" src="https://github.com/user-attachments/assets/0dd9037e-586b-4990-9a33-8a9e34487a25" />

### Pollution Analysis (7-day Threshold)
*Period: August 30, 2024 - September 12, 2024*

<img width="100%" alt="Analysis Chart 1" src="https://github.com/user-attachments/assets/d642c51d-786c-483a-b2fa-73f1f50986e4" />

<img width="100%" alt="Analysis Chart 2" src="https://github.com/user-attachments/assets/84b78515-ffc7-4953-8c0c-9a263087758f" />

<img width="100%" alt="Analysis Chart 3" src="https://github.com/user-attachments/assets/d4a49bf6-c17d-4bff-95c0-71a868acc447" />

<img width="100%" alt="Analysis Chart 4" src="https://github.com/user-attachments/assets/3858f851-063e-434d-bb6c-879ea8eb42d1" />

## Conclusion

The air pollution crisis in early September 2024 was a profound public health and environmental emergency. 

- **Critical Levels**: PM2.5 concentrations reached **205.7 µg/m³** on September 10th.
- **Health Impact**: Levels consistently fluctuated between "Very Unhealthy" and "Hazardous".
- **Volatility**: Air quality showed extreme volatility, with short-term improvements quickly overwhelmed by smoke.

## Project Structure

This repository is organized as follows:

- `data/`: Contains the raw CSV data (`Hourly_pm25_Asu.csv`).
- `scripts/`: R scripts for analysis and visualization.
- `docs/`: Reports and documentation (PDFs).
- `images/`: Generated images and assets.

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Martz-yx/paraguay-air-pollution-2024.git
   ```

2. **Open the project in RStudio** (or your preferred IDE).

3. **Install required packages**:
   ```R
   install.packages(c("ggplot2", "dplyr", "tidyr", "tibble", "rgl", "rayshader", "ggthemes", "viridis"))
   ```

4. **Run the analysis**:
   Open `scripts/Asu_Air_polution.R` and execute the code. Ensure your working directory is set to the project root.
