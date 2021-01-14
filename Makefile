setup:
	python3 -m venv ~/.udacity-devops
	# Change .udacity-devops to whatever mine is in Azure CLI

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv test_hello.py
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	#pylint --disable=R,C hello.py
	pylint --disable=R,C,W1203,W0702 app.py

all: install lint test
