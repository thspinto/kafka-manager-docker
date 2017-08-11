#!/bin/bash

if [[ $KM_USERNAME != ''  && $KM_PASSWORD != '' ]]; then
    sed -i.bak '/^basicAuthentication/d' ${KM_CONFIGFILE} 
    echo 'basicAuthentication.enabled=true' >> ${KM_CONFIGFILE} 
    echo "basicAuthentication.username=${KM_USERNAME}" >> ${KM_CONFIGFILE}
    echo "basicAuthentication.password=${KM_PASSWORD}" >> ${KM_CONFIGFILE}
    echo 'basicAuthentication.realm="Kafka-Manager"' >> ${KM_CONFIGFILE} 
fi

exec kafka-manager -Dconfig.file=${KM_CONFIGFILE} "${KM_ARGS}" "${@}"
