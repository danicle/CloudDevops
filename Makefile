setup:
	python3 -m venv ~/.udacity-devops

install:
	pip install --upgrade pip 
	pip install -r requirements.txt 
	docker pull hadolint/hadolint

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


lint:
	#hadolint Dockerfile
	docker run --rm -i hadolint/hadolint < Dockerfile
	pylint --disable=R,C,W1203 app.py

all: install lint test
