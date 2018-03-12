#!/bin/bash

eventdctl flags add j4status-grouped;
j4status -1;
eventdctl flags remove j4status-grouped;
