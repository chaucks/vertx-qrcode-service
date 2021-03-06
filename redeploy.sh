#!/usr/bin/env bash

export LAUNCHER="io.vertx.core.Launcher"
export VERTICLE="com.totorotec.service.MainVerticle"
export CMD="mvn compile"
export VERTX_CMD="run"
export JAVA_OPT="-Duser.language=en -Duser.country=US -Duser.variant=en_US"
# export CLASSPATH=$CLASSPATH:./src/js

mvn compile dependency:copy-dependencies
java \
  -cp  $(echo target/dependency/*.jar | tr ' ' ':'):"target/classes" \
  $LAUNCHER $VERTX_CMD --java-opts=${JAVA_OPT} $VERTICLE \
  --redeploy="src/main/**/*" --on-redeploy="$CMD" \
  --launcher-class=$LAUNCHER \
  $@
