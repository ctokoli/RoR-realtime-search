# Realtime Search Analytics Project

## Overview

This project is a web application built with Ruby on Rails and PostgreSQL that aims to create a realtime search box with analytics functionality. The primary objective is to allow users to search for articles in real-time and simultaneously record their search queries. The recorded data will be used to generate analytics and trends, revealing what users are searching for the most.

## Features

- **Realtime Search Box:** Users can input their search queries in a dynamic and responsive search box.
- **Search Tracking:** The system captures and records search queries in real-time.
- **IP Tracking:** The application tracks user searches based on their IP addresses.
- **Analytics Dashboard:** An analytics dashboard displays trends and insights into the most searched terms.

## Requirements

- Ruby (>= 2.6.3)
- Rails (>= 6.0.2)
- PostgreSQL (>= 12.0)

## Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/ctokoli/RoR-realtime-search.git


2. Navigate to the project directory:
   
   ```bash
   cd realtime-search-analytics

3. Install dependencies:
    
    ```bash
    bundle install

4. Create and migrate the database:
     
     ```bash
     rails db:create
     rails db:migrate

5. Start the Rails server:

    ```bash
    rails server

6. Visit http://127.0.0.1:3000/ in your web browser. 


