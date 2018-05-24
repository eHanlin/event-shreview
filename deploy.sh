#!/bin/sh
case $TRAVIS_TAG in
  *-SNAPSHOT ) API_HOST='test.ehanlin.com.tw';;
  * ) API_HOST='www.ehanlin.com.tw';;
esac

echo "TRAVIS_TAG => [$TRAVIS_TAG]"
echo "API_HOST => [$API_HOST]"
echo $API_HOST
curl -X POST -H 'Content-Type: application/json' -d "{\"Repository\":\"event-shreview\",\"Tag\":\"${TRAVIS_TAG}\",\"Owner\":\"eHanlin\",\"Password\":\"${EHANLIN_PW}\", \"Name\": \"shreview\"}" "https://${API_HOST}/event/api/Deploy"
