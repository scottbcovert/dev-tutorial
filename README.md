#Visualforce & Apex Development Tutorial
========================================

Dev Tutorial for new Salesforce Developers

##Background  
There is so much information about development on the Salesforce/Salesforce1/Force.com platform that sometimes it can be difficult to know where to start. This tutorial is meant to guide new developers as they create their first simple application and then help them as they continue to build upon this foundation with advanced features and functionality. The tutorial is based off the [official Visualforce Developer's Guide](http://www.salesforce.com/us/developer/docs/pages/salesforce_pages_developers_guide.pdf). If you have any questions or comments feel free to reach out to me on twitter [@scottbcovert](https://www.twitter.com/scottbcovert).

##Prerequisites  
To begin you will need to [sign up for your own Salesforce development org](https://developer.salesforce.com/signup). You will also want to set up your local machine with a Force.com IDE. There are several choices here, but I'd recommend [MavensMate](http://mavensmate.com/) for [Sublime Text](http://www.sublimetext.com/).

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step0a.png)

After installing your Force.com IDE (note: this tutorial assumes you are using MavensMate) you will need to set up a new project that is associated with your new Salesforce development org. After creating your org you should receive an email from _info@sforce.com_ containing a login link where you can create your new password.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step0b.png)

Afterwards you will be redirected to the org, where you should reset your security token by clicking **Your Name>>My Settings>>Personal>>Reset My Security Token**. You will then receive an email from _support@salesforce.com_ with the subject **salesforce.com security token confirmation**. You will need the contained security token to create your new MavensMate project so you should copy/paste it to your clipboard.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step0c.png)

Next, open up Sublime Text and click **MavensMate>>Project>>New Project**. You will then be presented the new project modal; enter a name for your project, your username, and your password followed by the security token copied to your clipboard. After selecting **Developer** from the edition dropdown you can click **Create Project**.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step0d.png)

The last setup step is cloning this repository to your local machine within your newly created MavensMate project. In the terminal navigate to your project's folder within the MavensMate workspace and run **git clone https://github.com/scottbcovert/dev-tutorial.git** This will create the dev-tutorial folder within your MavensMate project folder. You will want to delete the original _src_ folder and then rename the _dev-tutorial_ folder to _src_. Navigate into the new _src_ folder and run *git checkout -f step-1*. You should now have a git repository pointing to the _step-1_ commit of this tutorial within your Salesforce org's src folder.

##Instructions  
This repository is meant to serve as a development walk-through with each commit being tied to the next step in the tutorial. You will first need to clone this repository to your local machine; then with each new step in the headings below you will want to run **_git checkout -f step-X_** (where X is the current step #) on your local repo to update your code accordingly. After each checkout you should then save the new code to your Salesforce org and review the changes (from both a user and developer perspective) to make sure you fully understand before moving to the next step.

###Step 1: Creating Your First Page  
_Note: This step includes new metadata for your Salesforce org (the_ myFirstApp _Visualforce page). You will thus need to save the corresponding .xml file to your Salesforce server before saving the .page file for the first time._

This step provides the source code for your first Visualforce page named _myFirstApp_, which should display the famous **Hello World!** message. Note how Visualforce pages follow a node-tree structure similar to XML with everything wrapped inside an **&lt;apex:page&gt;** tag; this tag is required and serves as the root node for all Visualforce pages. Once the page has been saved/uploaded to your Salesforce org it can be [viewed within your browser](https://login.salesforce.com/apex/myFirstApp)

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step1.png)

###Step 2a: Displaying Field Values with Visualforce  
Visualforce pages use the same expression language as formulas--that is, anything inside **{! }** is evaluated as an expression that can access values from records that are currently in context. For example, you can display the current user's first name by adding the **{!$User.FirstName}** expression to your page.

**$User** is a global variable that always represents the current user record. All global variables are reference with a **$** symbol.

###Step 2b: Displaying Field Values from Specific Records with Visualforce  
To access fields from a record that is not globally available like a specific account, contact, or custom object record, you need to associate your page with a _controller_. Controllers provide pages with the data and business logic that make your application run, including the logic that specifies how to access a particular object's records. While you can define a custom controller for any page with Apex, Salesforce includes standard controllers for every standard and custom object.

For example, to use the standard controller for accounts, add the _standardController_ attribute to the **&lt;apex:page&gt;** tag, and assign it the name of the account object.

After you save your page, the Accounts tab is highlighted for the page, and the look-and-feel for the components on the page match the Accounts tab. Additionally, you can now access fields on the account record currently in context by using **{!account.&lt;fieldName&gt;}** expression syntax.

For example, to display an account's name on a page, use **{!account.name}** in the page markup. Note that refreshing the page leaves a blank value for the account name value; this is because Salesforce uses the **id** HTML parameter (currently undefined) to set the record context for the **standardController** attribute. If you navigate to an account record, copy its id to the clipboard, and then append **?id=[Insert Id Here]** to [your app's page](https://login.salesforce.com/apex/myFirstApp) you should see the name field is populated properly.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step2b.png)

###Step 3a: Using the Visualforce Component Library  
Up to this point, the only Visualforce tag that has been used in the examples is the mandatory **&lt;apex:page&gt;** tag that must be placed at the start and end of all Visualforce markup. However, just as you can insert images or tables into an HTML document with the **&lt;img&gt;** or **&lt;table&gt;** tags, respectively, you can add user interface components to your Visualforce pages using tags that are defined in the Visualforce component library.

For example, this step uses the **&lt;apex:pageBlock&gt;** component tag to add a component that looks like a section on a detail page.

###Step 3b: Continuing use of the Visualforce Component Library  
Tags also exist for other common Salesforce interface components, such as related lists, detail pages, and input fields.  
For example, this step adds the content of a detail page using the **&lt;apex:detail&gt;** component tag.

###Step 3c: Continuing use of the Visualforce Component Library  
Without any specified attributes on the tag, **&lt;apex:detail&gt;** displays the complete detail view for the context record. If you want to modify properties such as which record details are displayed, or whether related lists or the title appear, you can use attributes on the tag.  
For example, this step provides the source code to display the details of the context account's owner, without related lists or a colored title bar.

###Step 4: Overriding an Existing Page with a Visualforce Page  
Suppose you want to change the format of an existing page, such as the standard account detail page. All the information for an account displays on a single page. If there's a lot of information, you might end up doing a lot of scrolling. This step provides the source code for your Visualforce page to make each section for an account display in a tab, such as contacts, opportunities, and so on.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step4.png)

###Step 5: Using Input Components in a Page  
So far the examples in this quick start tutorial show ways that you can display data in a Visualforce page. To capture input from a user, use the **&lt;apex:form&gt;** tag with one or more input components and a **&lt;apex:commandLink&gt;** or **&lt;apex:commandButton&gt;** tag to submit the form.

The input component tag that is most often used in a form is **&lt;apex:inputField&gt;**. This tag renders the appropriate input widget based on a standard or custom object field’s type. For example, if you use an **&lt;apex:inputField&gt;** tag to display a date field, a calendar widget displays on the form. If you use an **&lt;apex:inputField&gt;** tag to display a picklist field, a drop-down list displays instead. The **&lt;apex:inputField&gt;** tag can be used to capture user input for any standard or custom object field, and respects any metadata that is set on the field definition, such as whether the field is required or unique, or whether the current user has permission to view or edit it.

This step provides the source code for your Visualforce page to allow users to edit and save the name of an account.

Notice that the **&lt;apex:inputField&gt;** tag is bound to the account name field by setting the tag’s value attribute. The expression contains the familiar **{!account.name}** dot-notation used to display the field’s value elsewhere in the page.

Also notice that the **&lt;apex:commandButton&gt;** tag has an action attribute. The value for this attribute invokes the save action of the standard Account controller, which performs identically to the Save button on the standard Account edit page.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step5.png)

###Step 6: Enabling Inline Editing  
Visualforce pages 21.0 and above support inline editing. Inline editing lets users quickly edit field values, right on a record’s detail page. Editable cells display a pencil icon when you hover over the cell, while non-editable cells display a lock icon.  
The **&lt;apex:detail&gt;** component has an attribute that activates inline editing, while the **&lt;apex:inlineEditSupport&gt;** component provides inline editing functionality to several container components.  
This step provides the source code for your Visualforce page to display the power of inline editing.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step6.png)

###Step 7: Converting a Page to a PDF File  
You can render any page as a PDF by adding the _renderAs_ attribute to the **&lt;apex:page&gt;** component, and specifying _pdf_ as the rendering service.

We previously created a Visualforce page to change the name of an account; this step provides the source code to display an announcement of a new account name as a PDF that also contains the current date and time.

Note that **&lt;style&gt;** is CSS markup, not Visualforce markup. It defines the font family used for the entire page, as well as a particular style for the account name.

Also note that some of the output text is contained in an **&lt;apex:panelGrid&gt;** component. A panel grid renders as an HTML table. Each component found in the body of the **&lt;apex:panelGrid&gt;** component is placed into a corresponding cell in the first row until the number of columns is reached. As there is only a single cell, each output text is displayed in a separate row.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step7.png)

###Step 8a: Building a Table of Data in a Page  
Some Visualforce components, such as **&lt;apex:pageBlockTable&gt;** or **&lt;apex:dataTable&gt;**, allow you to display information from multiple records at a time by iterating over a collection of records. To illustrate this concept, this step provides the source code for your Visualforce page to list the contacts associated with an account that is currently in context using the **&lt;apex:pageBlockTable&gt;** component.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step8a.png)

###Step 8b: Editing a Table of Data in a Page  
Using **&lt;apex:inputField&gt;** in the data table columns, you can create a table with editable fields. Using **&lt;apex:commandButton&gt;** you can save the data you change. Any message (such as Saving) is automatically displayed with the **&lt;apex:pageMessages&gt;** tag. This step provides the source code for a Visualforce page that enables you to edit a seriest of Industry types at the same time.

This page takes advantage of standard set controllers to generate the data for the table. Use the _recordSetVar_ attribute to specify the name of the set of data you want to use. Then, in the **&lt;apex:pageBlockTable&gt;** value, use the name of that set to populate the table with data.

The **&lt;apex:inputField&gt;** tag automatically generates the correct display for the field. In this case, as a drop-down list.

The page must be enclosed in an **&lt;apex:form&gt;** tag in order to use the **&lt;apex:commandButton&gt;** tag. A form specifies a portion of a Visualforce page that users can interact with.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step8b.png)

###Step 9a: Building a Custom Controller 
_Note: This step includes new metadata for your Salesforce org (the_ MyController _Apex class). You will thus need to save the corresponding .xml file to your Salesforce server before saving the .cls file for the first time._

A _custom controller_ is an Apex class that implements all of the logic for a page without leveraging a standard controller. Use custom controllers when you want your Visualforce page to run entirely in system mode, which does not enforce the permissions and field-level security of the current user.

A custom controller is an Apex class that uses the default, no-argument constructor for the outer, top-level class. You cannot create a custom controller constructor that includes parameters.  
This step provides the source code for your first custom controller, named _MyController_, and points your Visualforce page to this controller.

The custom controller is associated with the page because of the _controller_ attribute of the **&lt;apex:page&gt;** component.

As with standard controllers and controller extensions, custom controller methods can be referenced with **{! }** notation in the associated page markup. In this step, the **getAccount** method is referenced by the **&lt;apex:inputField&gt;** tag's _value_ attribute, while the **&lt;apex:commandButton&gt;** tag references the **save** method with its _action_ attribute.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step9a.png)

###Step 9b: Building a Controller Extension  
A _controller extension_ is an Apex class that extends the functionality of a standard or custom controller. Use controller extensions when:  
* You want to leverage the built-in functionality of a standard controller but override one or more actions, such as edit, view, save, or delete.
* You want to add new actions.
* You want to build a Visualforce page that respects user permissions.

Although a controller extension class executes in system mode, if a controller extension extends a standard controller, the logic from the standard controller does not execute in system mode. Instead, it executes in user mode, in which permissions, field-level security, and sharing rules of the current user apply.  
A controller extension is any Apex class containing a constructor that takes a single argument of type _ApexPages.StandardController_ or _CustomControllerName_, where _CustomControllerName_ is the name of a custom controller you want to extend.

This step updates the MyController apex class to serve as a controller extension for your Visualforce page.  
The extension is associated with the page using the _extensions_ attribute of the **&lt;apex:page&gt;** component.  
As with all controller methods, controller extension methods can be referenced with **{! }** notation in page markup. In this step, the **{!greeting}** expression at the top of the page references the controller extension's **getGreeting** method. 

Because this extension works in conjunction with the Account standard controller, the standard controller methods are also available. For example, the _value_ attribute in the **&lt;apex:inputField&gt;** tag retrieves the name of the account using standard controller functionality. Likewise, the **&lt;apex:commandButton&gt;** tag references the standard account **save** method with its _action_ attribute.

Multiple controller extensions can be defined for a single page through a comma-separated list. This allows for overrides of methods with the same name.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step9b.png)

###Step 9c: Building a Custom List Controller  
A custom list controller is similar to a standard list controller. Custom list controllers can implement Apex logic that you define to show or act on a set of records. This step provides the source code for a custom list controller that uses anti- and semi-joins as part of a SOQL query. The visualforce page displays these records using a mix of standard list controller actions, but depends on iterating over the records returned from the custom list controller.

![](https://raw.githubusercontent.com/scottbcovert/dev-tutorial/master/images/Step9c.png)
