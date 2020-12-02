run:
	bundle exec karafka server


test:
	bundle exec rspec


build:
	docker build -t tucowsinc/karafkaexperiment .

run-docker: build
	docker run \
	-e KAFKA_HOSTS=${KAFKA_HOSTS} \
	tucowsinc/karafkaexperiment

test-docker: build
	docker run \
	--network host \
	-e KAFKA_HOSTS=${KAFKA_HOSTS} \
	tucowsinc/karafkaexperiment \
	exec rspec