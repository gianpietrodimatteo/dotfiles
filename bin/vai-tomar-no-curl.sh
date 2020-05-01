#!/bin/bash

# Vai tomar no curl

baseUrl="http://localhost:8080"
expenseUrl="$baseUrl/expense"

# curl -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json" -X POST http://localhost:3000/data

# for counter in {1..$num}; do
#         echo "$counter";
#         curl -d '{"name":"Mateules", "budget":6969}' -H "Content-Type: application/json" -X POST "$expenseUrl";
#     done

shoot() {
  for counter in {1..25}; do
    echo "$counter";
    curl -sSd '{"name":"Mateules", "budget":6969}' -H "Content-Type: application/json" -X POST "$expenseUrl";
  done
}

for count in {1..25}; do
  echo "$count" &
  shoot &
done



