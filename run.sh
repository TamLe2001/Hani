#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

JAVA="/usr/lib/jvm/temurin-8-jre/bin/java"

if [ ! -x "$JAVA" ]; then
    echo "Java 8 not found at $JAVA"
    exit 1
fi

shopt -s nullglob
jars=(forge-1.16.5-36.2.34.jar)

if [ ${#jars[@]} -ne 1 ]; then
    echo "Expected exactly one forge-1.16.5-*.jar file."
    echo "Found: ${#jars[@]}"
    printf '%s\n' "${jars[@]}"
    echo "Run ls -la and check your Forge installation."
    exit 1
fi

exec "$JAVA" -Xms1G -Xmx2G -jar "${jars[0]}" nogui
