name: Appium Tests

on:
  push:
    branches:
      - "develop"
  pull_request:
    branches:
      - "main"
      - "develop"

jobs:
  appium-tests:
    runs-on: [self-hosted, macOS, ARM64]

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4.1.7

      - name: Set up JDK 17
        uses: actions/setup-java@v4.3.0
        with:
          java-version: '17'
          distribution: 'zulu'
          cache: gradle

      - name: Grant execute permission for gradlew
        run: chmod +x gradlew

      - name: Grant execute permission for Appium test script
        run: chmod +x scripts/run_offline_appium_tests.sh

      - name: Run Appium Tests (E2E)
        run: ./scripts/run_offline_appium_tests.sh
