#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\n1) Cut\n2) Color\n3) Style\n4) Wash\n5) Exit"
  echo -e "\nPlease enter the service_id you would like:"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) CUT ;;
    2) COLOR ;;
    3) STYLE ;;
    4) WASH ;;
    *) MAIN_MENU "Please choose a valid option."
  esac
}

CUT() {
  SERVICE_ID_SELECTED=1
  # get customer input
  echo -e "\nEnter your phone number please:"
  read CUSTOMER_PHONE
  # check if customer exists
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # get customer name
    echo -e "\nEnter your name please:"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT == 'INSERT 0 1' ]]
    then
      echo -e "\n$CUSTOMER_NAME was added to the customers database!!!"
      # get new customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
  fi
  # get appointment time
  echo -e "\nEnter your preferred appointment time please:"
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

COLOR() {
  SERVICE_ID_SELECTED=2
  # get customer input
  echo -e "\nEnter your phone number please:"
  read CUSTOMER_PHONE
  # check if customer exists
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # get customer name
    echo -e "\nEnter your name please:"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT == 'INSERT 0 1' ]]
    then
      echo -e "\n$CUSTOMER_NAME was added to the customers database!!!"
      # get new customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
  fi
  # get appointment time
  echo -e "\nEnter your preferred appointment time please:"
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

STYLE() {
  SERVICE_ID_SELECTED=3
  # get customer input
  echo -e "\nEnter your phone number please:"
  read CUSTOMER_PHONE
  # check if customer exists
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # get customer name
    echo -e "\nEnter your name please:"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT == 'INSERT 0 1' ]]
    then
      echo -e "\n$CUSTOMER_NAME was added to the customers database!!!"
      # get new customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
  fi
  # get appointment time
  echo -e "\nEnter your preferred appointment time please:"
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

WASH() {
  SERVICE_ID_SELECTED=4
  # get customer input
  echo -e "\nEnter your phone number please:"
  read CUSTOMER_PHONE
  # check if customer exists
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if customer doesn't exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # get customer name
    echo -e "\nEnter your name please:"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_CUSTOMER_RESULT == 'INSERT 0 1' ]]
    then
      echo -e "\n$CUSTOMER_NAME was added to the customers database!!!"
      # get new customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
  fi
  # get appointment time
  echo -e "\nEnter your preferred appointment time please:"
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

EXIT() {
  echo -e "\nThanks for stopping in."
}

MAIN_MENU

