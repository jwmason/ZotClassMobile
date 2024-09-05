"""The main file that contains the Flask application and all the route definitions."""

# imports

from flask import Flask
from parse_requests import *
from flask import request
import requests
import json

app = Flask(__name__)


# gets all the departments
@app.route("/departments")
def all_departments():
    response1 = requests.get("https://api.peterportal.org/rest/v0/courses/all")
    resp_json = response1.json()
    set1 = set()
    for i in resp_json:
        x = i["department"]
        set1.add(x)
    dep_dict = {'json_list': list(set1)}
    json_data = json.dumps(dep_dict)
    return json_data


# gets all the terms from 2014 to 2023
@app.route("/terms")
def all_terms():
    year_list = []
    quarter = ["Spring", "Winter", "Fall"]
    for i in range(2014, 2023):
        for j in range(3):
            if j == 0 or j == 1:
                year_list.append(str(i + 1) + " " + quarter[j])
            else:
                year_list.append(str(i) + " " + quarter[j])
    year_list.reverse()
    json_data = json.dumps(year_list)
    return json_data


# Gets the json of classes that fit the parameters
@app.route("/parameters")
def get_parameters():
    # the year in term has to be separated from the quarter with a %20 sign
    term = request.args.get('term')
    department = request.args.get('department')
    section_code = request.args.get('sectionCodes')
    course_title = request.args.get('courseTitle')
    search_parameters = {'Term': term, 'Department': department, 'Section Code': section_code,
                         'Course Title': course_title}
    string1 = ''
    print(term)
    if term is not None:
        term_get = "term=" + str(term)
        string1 += term_get

    if department is not None:
        department_get = "&department=" + str(department)
        string1 += department_get

    if section_code is not None:
        section_code_get = "&sectionCodes=" + str(section_code)
        string1 += section_code_get

    if course_title is not None:
        course_title_get = "&courseTitle=" + str(course_title)
        string1 += course_title_get

    print(string1)
    string2 = "https://api.peterportal.org/rest/v0/schedule/soc?" + string1
    response2 = requests.get(string2)
    print(string2)
    data = dict(response2.json())
    return data

if __name__ == "__main__":
    app.run(host='0.0.0.0')
