#~/bin/sh

WORK_DIR=${WORK_DIR:-/opt/nilseckelt.github.io}

LOG_FILE=${WORK_DIR}/build.log
MAX_SIZE=20000

cd ${WORK_DIR}
touch ${LOG_FILE}

# shorten log file so it will not fill the disk
tail -n $MAX_SIZE ${LOG_FILE} > tmp && mv tmp ${LOG_FILE}

cat <<eos >>${LOG_FILE}


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

                      `date "+%A, %d. %b. %Y - %T %Z"`

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
eos

date "+%T ☁️ Update repository..." >>${LOG_FILE}
git pull >>${LOG_FILE}

date "+%T 📚 Update dependencies..." >>${LOG_FILE}
bundle install --path vendor/bundle >>${LOG_FILE}

# use `jekyll build --watch` instead
date "+ %T 🎡 Building site..." >>${LOG_FILE}
bundle exec jekyll build >>${LOG_FILE} 2>&1
if [[ $? -ne 0 ]]; then
    date "+%T 🔥 Build failed!" >>${LOG_FILE}
else
    date "+%T 🚀 Build successful!" >>${LOG_FILE}
fi
