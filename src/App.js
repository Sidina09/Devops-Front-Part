import React, { useState, useEffect } from 'react';
import axios from 'axios';

function App() {
  const [weatherData, setWeatherData] = useState([]);

  useEffect(() => {
    // Utilisez process.env.REACT_APP_BACKEND_URL comme URL du backend
    const backendUrl = process.env.REACT_APP_BACKEND_URL || 'http://localhost:3001';

    // Fetch weather data from the backend API
    axios.get(`${backendUrl}/weather`)
      .then(response => setWeatherData(response.data))
      .catch(error => console.error('Error fetching weather data:', error));
  }, []);

  return (
    <div>
      <h1>Weather App</h1>
      <ol>
        {weatherData.map(city => (
          <li key={city.id}>{city.city} - Temperature: {city.temperature}, Conditions: {city.conditions}</li>
        ))}
      </ol>
    </div>
  );
}

export default App;
