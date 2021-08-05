# DesafioMobills
Sample CRUD implementation with Core Data. The Application objective is to add and see receipts and debts that you can have in your month. You can add, 
update and delete your receipts or debts.

## Build and Runtime Requirements
+ Xcode 12.0 or later
+ iOS 13.0 or later

## Configuring the Project
Configuring the Xcode project requires a few steps in Xcode to get up and running with iCloud capabilities. 

1) Configure each Mac and iOS device you plan to test with an iCloud account. Create or use an existing Apple ID account that supports iCloud.

2) Configure the Team for each target within the project.

Open the project in the Project navigator within Xcode and select each of the targets. Set the Team on the General tab to the team associated with your developer account.

3) Create an Scheme with iOS device (iPhone 11 or later)

With your project open, go to Scheme > New Scheme. Select the target Triad and set up the iPhone 11 for running and building the application. 

4) Run your code

You can Run going into Product > Run, or simply pressing command + R.

## About Desafio Mobills
For finantial administrations, we often see that our user wants to visualize what is their month receipts, so the app show the actual balance of your wallet.
Also, you can switch the status of the income, if is received or not, or you can tell if your debt was already paid. You can add the description, value, date of the income or debt, and if it's paid or not
(or in case of income, if was received).

## Written in Swift

This application is written in Swift. The application use the concepts of Core Data, for saving, updating, and deleting the data. The Data is displayed with CollectionView, 
that you can swipe horizontally, and long press can show the menu that you can update and delete the data inserted. It doesn't have tests, but we can test the interface, if 
the buttons is actionables, and the collections present a modal to configure receipts. 


## Application Architecture

Desafio Mobills includes MVC design pattern. The Core Data Stack implements what is in App Delegate for context saving.
