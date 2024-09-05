"""A helper function for parsing and structuring data from API responses."""

import json

def extract_course_data(data):
    # Extract the list of schools
    school_list = data["schools"]
    first_school = school_list[0]

    # Extract departments from the first school
    departments = first_school["departments"]
    first_department = departments[0]

    # Extract courses from the first department
    courses = first_department["courses"]
    
    course_data_list = []

    for course in courses:
        # Extract course title
        course_title = course['courseTitle']
        sections_list = []
        meetings_list = []

        # Extract sections and meetings for each course
        for section in course["sections"]:
            section_code = section['sectionCode']
            units = section['units']
            instructors = section['instructors']
            meetings = section['meetings']

            # Collect meeting details
            for meeting in meetings:
                days = meeting['days']
                time = meeting['time']
                meetings_list.append({'days': days, 'time': time})

            # Add section details to sections_list
            sections_list.append({
                "sectionCode": section_code,
                "units": units,
                "instructors": instructors
            })

        # Add course details to course_data_list
        course_data_list.append({
            'courseTitle': course_title,
            'sections': sections_list,
            'meetings': meetings_list
        })
    
    return course_data_list
