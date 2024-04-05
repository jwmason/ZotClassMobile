# ZotClassMobile: Frontend

## TLDR:

- **Challenge**: Many lack support and guidance in having UCI course information on their mobile devices.
- **Solution**: ZotClassMobile, a tool that guides UCI collegiates in finding course information easily on their mobile devices.
- **Features**:
  - PeterPortal API information access.
  - User-friendly Home Screen to search for course information.
  - Apple and Android friendly

## The Problem

We got our inspiration from ZotCourse, which is a popular class scheduler for students at UCI. We wanted create an application that is able to show class information for students. When a student tries to search up their classes in ZotCourse or WebReg on their mobile browser, the interface feels scrunched and uncomfortable. 

## The Solution

With Zot Class Mobile, students do not have to go into a browser and look up their classes from there. Instead, they can just have an app on their phone that just shows the class information.

## The Inspiration

We got our inspiration from ZotCourse, which is a popular class scheduler for students at UCI. We wanted create an application that is able to show class information for students.

## How We Built It

- **Flutter**: We implemented the front end using Flutter. First, we divided the user interface of the two screens by having one page focus on the search inputs and the and dropdown menus, and then the other page focusing on displaying the searched courses through a scrollable list view. After creating the basic functionality for the front end, we implemented the back end using get requests to filter data from the back end API and display it properly.

- **Design**: After getting most of the functionality and displaying the correct data within the given amount of time, we did our best to work on UX/UI design.

## Accomplishments

1. **Integration**: Successfully linking the frontend UI to the json objects from the backend to create a comprehensive UCI course information app.

## What We Learned

- Flutter.
- The importance of a user-centered approach espeically using an API with lots of information.

## What's Next for ZotClassMobile

1. **Search Terms**: In the front end, we want to include features that allow users to search classes by their individual course code and course name. We also want to implement more information about each class that shows where the class is located, how many students are enrolled, and whether the class is open or waitlisted.
2. **Improved UI**: We want to improve the user interface so the app looks and feels more appealing and smooth to the user.
   
ZotClassMobile stands as a testament to technological innovation in UCI collegiate support, emphasizing the need for ease-of-access and understanding in digital solutions.
