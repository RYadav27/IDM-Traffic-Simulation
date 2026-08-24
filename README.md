# IDM Traffic Simulation

A MATLAB-based traffic simulation project implementing the **Intelligent Driver Model (IDM)** to simulate and analyze longitudinal vehicle-following behavior.

## Project Overview

The **Intelligent Driver Model (IDM)** is a car-following model used to describe how a vehicle adjusts its acceleration and speed based on the desired speed, distance from the leading vehicle, and relative speed.

This project implements the IDM framework in MATLAB and includes vehicle-following simulation, visualization, traffic statistics, and data smoothing.

## Objectives

* Implement the Intelligent Driver Model (IDM) in MATLAB.
* Simulate longitudinal vehicle-following behavior.
* Analyze the movement and interaction of vehicles.
* Visualize vehicle trajectories and simulation results.
* Calculate traffic-related statistics.
* Apply exponential smoothing to reduce fluctuations in trajectory data.

## Repository Structure

```text
IDM-Traffic-Simulation/
│
├── IDM/
│   ├── IDMmodel.m
│   ├── initialization.m
│   ├── main.m
│   ├── plotFunction.m
│   ├── trafficStatistics.m
│   └── visualization.m
│
├── Smoothening/
│   ├── exponentialSmoothing.m
│   ├── main.m
│   └── leader_follower.xlsx
│
└── README.md
```

## IDM Module

The `IDM` folder contains the main MATLAB implementation of the Intelligent Driver Model.

### Main files

* **`main.m`** – Main script used to run the simulation.
* **`initialization.m`** – Initializes simulation parameters and vehicle conditions.
* **`IDMmodel.m`** – Implements the IDM acceleration and vehicle-following model.
* **`plotFunction.m`** – Generates plots for the simulation.
* **`visualization.m`** – Visualizes vehicle movement and simulation behavior.
* **`trafficStatistics.m`** – Calculates traffic and vehicle-related statistics.

## Smoothening Module

The `Smoothening` folder contains MATLAB code for processing and smoothing vehicle trajectory data.

### Main files

* **`exponentialSmoothing.m`** – Applies exponential smoothing to trajectory data.
* **`main.m`** – Runs the smoothing procedure.
* **`leader_follower.xlsx`** – Input vehicle trajectory data used for analysis.

## Methodology

The overall workflow is:

```text
Vehicle / Simulation Parameters
              ↓
       IDM Initialization
              ↓
       IDM Vehicle Model
              ↓
      Vehicle Simulation
              ↓
       Data Visualization
              ↓
      Traffic Statistics
              ↓
      Data Smoothing
              ↓
      Analysis of Results
```

## Technologies Used

* **MATLAB**
* **Excel**
* Intelligent Driver Model (IDM)
* Exponential Smoothing
* Traffic Flow and Vehicle-Following Analysis

## How to Run

1. Download or clone this repository.
2. Open MATLAB.
3. Navigate to the `IDM` folder.
4. Open `main.m`.
5. Run the script.
6. Review the generated simulation, visualization, and traffic statistics.

For the smoothing module, navigate to the `Smoothening` folder and run its `main.m` file.

## Applications

The project can be used for:

* Traffic flow simulation
* Car-following behavior analysis
* Vehicle trajectory analysis
* Traffic engineering studies
* Testing vehicle-following models
* Understanding microscopic traffic simulation

## Future Improvements

* Calibration of IDM parameters using real-world trajectory data.
* Comparison with other microscopic traffic models.
* Integration of real-world vehicle trajectory datasets.
* Automated model performance evaluation.
* Improved visualization of traffic flow and vehicle interactions.

## Author

**Rahul Yadav**
M.Tech – Transportation Engineering
Indian Institute of Technology Kanpur
