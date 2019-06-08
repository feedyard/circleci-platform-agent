from invoke import task

@task
def buildlocal(ctx):
    ctx.run("docker build -t local/circleci-platform-agent:latest .")

@task
def testlocal(ctx):
    ctx.run("bash testlocal.sh")
