import yaml
from jinja2 import Environment, FileSystemLoader

# set current directory
ENV = Environment(loader=FileSystemLoader('.'))

# get template
baseline = ENV.get_template("./roles/run_test/tasks/main.yml.j2")

# create file
file = open('./roles/run_test/tasks/main.yml', 'w')

# create config
config = baseline.render(repetition=5)

file.write(config)
file.close
