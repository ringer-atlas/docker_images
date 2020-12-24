build:
	docker build --network host --compress -t jodafons/ringer:latest .
	docker build --network host --compress -t jodafons/ringer:base .
push:
	docker push jodafons/ringer:latest
	docker push jodafons/ringer:base
