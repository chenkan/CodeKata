# ref link - https://github.com/salimfadhley/jenkinsapi/blob/master/jenkinsapi/jenkins.py
# author ChenKan

from jenkinsapi.jenkins import Jenkins

JENKINS_URL = 'http://192.168.146.65:8080/'
JOB_NAME    = 'first_blood'
USER_NAME   = 'admin'
PASS_WORD   = 'admin'

def trigger_build(J):
    J.build_job(JOB_NAME)
    return 'have built <' + JOB_NAME + '>'

if __name__ == '__main__':
    J = Jenkins(JENKINS_URL, USER_NAME, PASS_WORD)
    print trigger_build(J)
