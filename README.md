# LeoCalculator

LeoCalculator is an iOS application developed using Swift that provides a powerful calculator functionality along with additional features such as trigonometric calculations and Bitcoin to USD conversion. The project utilizes two custom frameworks: LeoCalculation and LeoNetworking, to enhance the calculation capabilities and integrate with external APIs.

## Features

- Basic arithmetic operations: addition, subtraction, multiplication, and division.
- Trigonometric calculations: sin and cos values.
- Bitcoin to USD conversion using an API.

## Frameworks
The LeoCalculator project incorporates the following frameworks:

### 1. LeoCalculation
LeoCalculation is a custom framework developed specifically for this project. It provides the core calculation functionality required for the calculator operations. The framework includes algorithms for performing arithmetic calculations and trigonometric functions, enabling accurate and efficient computation.

### 2. LeoNetworking
LeoNetworking is another custom framework used in the LeoCalculator project. It facilitates communication with external APIs.

## Installation
To install and run the LeoCalculator project, follow these steps:

1. Clone the repository from GitHub.
1. Open the project in Xcode.
1. Build and run the project on your desired iOS simulator or device.

Note: Make sure to add your GitHub account to Xcode. This is necessary to access private repositories.

## Usage

Once the LeoCalculator application is launched, you can utilize its various functionalities:

Enter numerical values using the provided interface.
Perform basic arithmetic calculations by selecting the appropriate operator buttons (+, -, *, /).
Calculate sin and cos values by using the dedicated buttons.
Convert Bitcoin to USD by by using the ₿ to $.

Note: You can perform Concatenate operations using basic operators. From the displayed result, you can also perform "sin", "cos", and "₿ to $" operations. When a sin, cos, or convert operation is performed, the calculation in the application is reset, and you can start a new calculation. Since these special calculations can produce long results in the output section, they have not been included in the Concatenate operations to prevent this.

## API
The following API, https://www.abstractapi.com/api/exchange-rate-api, is used for the Bitcoin to USD conversion process. Please note that the free version of this API may not provide real-time data, and calculations are performed based on historical data.
