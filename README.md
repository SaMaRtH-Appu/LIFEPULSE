# LifePulse Health Tracker

## Prerequisites
1. **Java 17+**: You must have Java installed.
2. **Maven**: You need Maven to build and run the Spring Boot application.

## How to Run

1. Open this folder in your IDE (IntelliJ IDEA, Eclipse, or VS Code).
2. If using a terminal, navigate to this folder.
3. Run the following command:
   ```sh
   mvn spring-boot:run
   ```
4. Once started, open your browser and go to:
   ```
   http://localhost:8091/index.html
   ```

SQL COMMAND:
SELECT * FROM USERS;
SELECT * FROM MEDICINES;
## Features
- **Medicine Tracker**: Saves medicines with time/frequency. Notifications trigger at the exact time.
- **Water, Steps, Sleep**: Track daily logs and persist to database.
- **Health Score**: Calculates a score (0-100) based on your logs.
- **Language**: Switch between English, Hindi, and Kannada.
- **AI Chat**: Simple mock AI to discuss health.

## Technologies
- **Backend**: Spring Boot 3 (Java)
- **Database**: SQLite (`health_tracker.db` file will be created automatically)
- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)

## Troubleshooting
- If you see `mvn not found`, please install Maven or run via your IDE's "Run" button.
- If audio doesn't play, ensure you have adjusted the browser permission to allow "Auto-play" or clicked anywhere on the page at least once.




