#!/bin/bash

[[ ! "$VIRTUAL_ENV" != "" ]]; source venv/bin/activate;

pip3 install -r requirements.txt

uvicorn app.main:app --reload

deactivate