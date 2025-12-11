library(ggplot2)
library(rayshader)
library(dplyr)
library(tidyr)
library(tibble)
library(rgl)
data <- read.csv("C:/Users/surface pro 8/Documents/R Scripts/Hourly_pm25_Asu.csv")

data$fecha <- as.Date(data$date, format="%m/%d/%Y")

data$hour <- format(as.POSIXct(data$hour, format="%H:%M"), format="%H:%M:%S")

data$hora_del_dia <- as.numeric(sub(":.*", "", data$hour))  # Extract hours as numeric

data$Pm2.5 <- as.numeric(data$median)

data <- data %>% filter(data$fecha >= as.Date("2024-08-30"))

############# PLOT 1: PM 2.5 Values Over Time #############
data$datetime <- as.POSIXct(paste(data$fecha, data$hour), format="%Y-%m-%d %H:%M:%S")
p <- ggplot(data, aes(x=datetime, y=Pm2.5)) +
  geom_line() +
  labs(title="PM 2.5 Values Over Time", x="Datetime", y="PM 2.5") +
  theme_minimal()
str(data)
print(p)
###########PLOT 1: PM 2.5 Values Over Time ################

data_wide <- data %>%
  select(fecha, hour, Pm2.5) %>%
  pivot_wider(names_from = hour, values_from = Pm2.5) %>%
  column_to_rownames(var = "fecha")

# Convert to matrix
data_matrix <- as.matrix(data_wide)

print(data_matrix)

# Ensure the matrix has row names and column names
if (is.null(rownames(data_matrix))) rownames(data_matrix) <- 1:nrow(data_matrix)
if (is.null(colnames(data_matrix))) colnames(data_matrix) <- 1:ncol(data_matrix)

# Create the rayshader plot
#data_matrix %>%
 # sphere_shade(texture = "imhof1") %>%  # Texture can be adjusted
 # plot_3d(data_matrix, zscale = 10, fov = 0, theta = 45, phi = 30)

# Save the plot as an image file
#rgl::rglwidget()  # For interactive 3D plot
#rgl::rgl.postscript("surface_plot.png", fmt = "png")  # Save static image

#######################################################
library(ggthemes)
library(viridis)
p2<-ggplot(data, aes(x = fecha,y = hora_del_dia)) + 
  geom_tile(aes(fill = Pm2.5)) +
  scale_x_date(breaks= "1 week", date_labels = "%b %d", expand=c(0,0)) + coord_equal(ratio = 1) + 
  scale_fill_viridis(option="magma")
  str(data)
print(p2)
plot_gg(p2,multicore = TRUE, width = 5, height = 5, 
        scale = 250, windowsize = c(1400,866), zoom = 0.55, phi = 30 )


render_movie("air_polution.mp4",frames = 1080, fps=60,zoom=0.6,fov=30)
