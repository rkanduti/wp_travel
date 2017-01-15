# Web programming
### PROJECT: Billing of travel expenses
## Travel expenses tracker
This is my app for __**Web programming**__ that is used for tracking, editing and approval of travel expenses in a firm. 

It will be used by: 
* __employee__
* __accountant (not implemented)__
* __manager (not implemented)__

### Workflow
Employee will file in the application for traveling, manager will either confirm or modify it. If the application is approved he will get the travel order.
After travelling he will have to file and prove all of the expenses. The accountant will then check the expenses and transfer spended money to employee account.

Manager, accountant and employee will all have **different permissions** to application, e.g. manager will have permission to whole application while employee can only see his 
travel history and pending travel apllications.

### Browser compatibility
The application was tested in Chrome, Mozilla Firefox and Microsoft Edge. I did not run into any mayor problems in different browsers, only some small cosmetic differences and that date input field is not supported in Mozilla Firefox.

### Own elements
I am really proud on accordion that I implemented in Manage travel order page. It stretches if you click on its header and hides if you click on it again. You can add as many as you have travel expenses and you are able to remove them. The second one is a graph showing your travel activity in past 6 months. At first I wanted to implement a library to show map of world, with colored visited countries but it required too much changing of current structure. The graph is big enough to be visible and readable.

### Notes for second part
In second part i will have to be careful with parsing url-s and showing data accessible to user. In this part I did not implement 3 different access modes for employee, accountant and manager because it is hard to determine everything without proper database and enable access without back end.