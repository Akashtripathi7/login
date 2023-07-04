# Login

- Dart Version - 2.18.4
- Flutter Version - 3.3.8

## 

## Running the application

Once you have forked the project, follow these steps :

- Run `flutter clean` once as soon as you fork the project
- Run `flutter pub get`

- Run the application via flutter run !

## 

## Coding Guidelines

### 

### Section 1: General Rule

- Files and folders MUST be named using snake case (eg home_page.dart)
- Classes MUST be named using pascal case (eg HomePage)
- Reusability is the key and Duplication is the lock - always break down widgets into separate reusable components
- Always keep the page layout and page child components separate unless really necessary
- Always store secrets and other shared configuration separately
- Responsiveness (ie fitting into different screen size) is the
highest priority of design, use MediaQuery.of(context).size instead of
hard coding size or width value.
- Make Use of Sizer library to provide maximum
- Use Row() and Column() wherever possible for designing layout
- Keep classes with low number of lines break widget into separate
small widget if the class is too long (this increases maintainability)

### 

### Section 2 : Pattern

The app is based around MVC (Model View Controller) 
pattern using Getx library, most context sensitive operation such as 
routes, alerts are mostly converted to non context sensitive functions 
to easily call it from controllers. Here are general rules that should 
be followed :

- We dont want any state to be maintained inside view so avoid statefull widgets and let controller manage the state
- Use context free alternative of functions like route & alert so that it can be used inside controllers
- Always Getx.put() the controller only once and retrive using Getx.find() whenever it is required
- Model , View and controller should recide inside same page package (look at folder by feature principal)
- If multiple pages rely on some states use shared controllers for those state wherever possible

### 


### Section 3: Pages folder and “Folder by feature principal”

Pages folder is divided into pages of screen , each page have at least these two property:

- A layout file , that is used to render the page
- A widgets folder , contains widgets that are needed to be render into layout divided by logical sense
- A controller file, that should contain all logical part, avoid using statefull widgets , let controller take care of state

### 

### Folder by feature principal -

By using folder by feature principal we make sure that all
 components required by the feature lie in the same folder or package. 
So anything related to a page must be inside the folder of that page 
which include any model, controller, extra custom package required by 
that page. This makes it easier for the developer to find everything he 
needs inside a single package or folder when he is working on a feature 
or page .

### 

### Section 5: Decoupling

The widgets needs to be decoupled please do not pass the 
widget state around use broadcast libraryy to brodcast events between 
widgets for changing state rather than relying on global key or other 
workaroud. Always keep states inside controller and pass controllers 
singleton using Getx.find() makes it easier to decouple the application 
yet easily pass state around
