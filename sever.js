// Import required packages
const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const dotenv = require('dotenv');
const morgan = require('morgan');
const cors = require('cors');
const helmet = require('helmet');

// Load environment variables from .env file
dotenv.config();

// Initialize Express app
const app = express();

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(morgan('dev')); // Logging HTTP requests to the console
app.use(cors()); // Enable CORS
app.use(helmet()); // Set secure HTTP headers

// Routes
const userRoutes = require('./app/routes/userRoutes');
const driverRoutes = require('./app/routes/driverRoutes');
const restaurantRoutes = require('./app/routes/restaurantRoutes');
const orderRoutes = require('./app/routes/orderRoutes');
const deliveryRoutes = require('./app/routes/deliveryRoutes');
const authRoutes = require('./app/routes/authRoutes');

app.use('/api/users', userRoutes);
app.use('/api/drivers', driverRoutes);
app.use('/api/restaurants', restaurantRoutes);
app.use('/api/orders', orderRoutes);
app.use('/api/deliveries', deliveryRoutes);
app.use('/api/auth', authRoutes);

// Connect to MySQL database
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL database:', err.message);
    return;
  }
  console.log('Connected to MySQL database');
});

// Start the server
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});