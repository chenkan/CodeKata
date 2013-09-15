# Reference link
# - http://pythonhosted.org/jenkinsapi/
# - https://github.com/salimfadhley/jenkinsapi/blob/master/jenkinsapi/jenkins.py
# - https://github.com/salimfadhley/jenkinsapi/blob/master/jenkinsapi/job.py
# - https://github.com/salimfadhley/jenkinsapi/blob/master/jenkinsapi/build.py

# Using curl to do the same work
# - http://wiki.cloudbees.com/bin/view/DEV/Accessing+Jenkins+using+HTTP+Basic+Authentication

# Author ChenKan

from jenkinsapi.jenkins import Jenkins

JENKINS_URL = 'http://192.168.146.65:8080/'
JOB_NAME    = 'first_blood'
USER_NAME   = 'admin'
PASS_WORD   = 'admin'

def trigger_build(J):
    J.build_job(JOB_NAME)
    print 'have built <' + JOB_NAME + '>'

def query_latest_build(J):
    job = J[JOB_NAME]
    build = job.get_last_build()
    print "#%d - %s" %(build.get_number(), build.get_status())

if __name__ == '__main__':
    J = Jenkins(JENKINS_URL, USER_NAME, PASS_WORD)
    # trigger_build(J)
    query_latest_build(J)
